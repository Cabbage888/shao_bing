#include "MV_camera.h"

// 初始化
bool MV_camera::init(char *Camera_Name)
{
    name = Camera_Name;

    // 相机SDK初始化，设置中文
    CameraSdkInit(1);
    // 枚举设备，并建立设备列表
    int status1 = CameraEnumerateDevice(camera_list, &camera_num);
    if (status1 != CAMERA_STATUS_SUCCESS) // 枚举失败，输出错误码
    {
        std::cout << "CameraEnumerateDevice Error" << status1 << std::endl;
        return false;
    }

    cout << "num = " << camera_num << endl;

    // 相机初始化，使用CameraInitEx2函数初始化可以用名字分别调用不同相机
    int status2 = CameraInitEx2(Camera_Name, &camera_handle);
    if (status2 != CAMERA_STATUS_SUCCESS) // 相机初始化失败，输出错误码
    {
        std::cout << "CameraInitEx2 Error" << status2 << std::endl;
        return false;
    }

    // 获取相机设备的特性结构体capbility，该结构体中包含了相机可设置的各种参数的范围信息
    int status3 = CameraGetCapability(camera_handle, &capbility);
    if (status3 != CAMERA_STATUS_SUCCESS) // 获取相机设备的特性结构体失败，输出错误码
    {
        std::cout << "CameraGetCapability Error" << status3 << std::endl;
        return false;
    }

    // 创建rgb图像数据缓冲区
    // 相机分辨率最大高度*最大宽度*3（*3是因为有rgb三个通道）
    rgbBuffer = (unsigned char *)malloc(capbility.sResolutionRange.iHeightMax *
                                        capbility.sResolutionRange.iWidthMax * 3);

    // 设置相机曝光的模式（为了后续设置，设为停止自动曝光）
    // 传入：相机的句柄，TRUE，使能自动曝光；FALSE，停止自动曝光
    CameraSetAeState(camera_handle, FALSE);

    // 设置曝光时间
    // 降低曝光时间，一般为了防止图像拖影将曝光时间调为2毫秒以下，该函数以微秒为单位
    // 传入：相机的句柄，曝光时间（微秒为单位）
    CameraSetExposureTime(camera_handle, 1200.);
    //    CameraSetExposureTime(camera_handle, 15000.0);

    // 调高图像模拟增益值，使得图像亮度提高（最大值为256）
    CameraSetAnalogGain(camera_handle, iAnalogGain);
    // 输出图像信号放大倍数
    std::cout << capbility.sExposeDesc.fAnalogGainStep * iAnalogGain << std::endl;

    // 设置相机白平衡模式
    // TRUE，则表示使能自动模式。FALSE，则表示使用手动模式
    CameraSetWbMode(camera_handle, TRUE);

    // 相机开始图像采集
    CameraPlay(camera_handle);

    // 设置getimagebuffer的输出格式
    // bMonoSensor输出是否为黑白相机
    if (capbility.sIspCapacity.bMonoSensor)
    {
        channel = 1;                                                   // 通道数为1
        CameraSetIspOutFormat(camera_handle, CAMERA_MEDIA_TYPE_MONO8); // 8位灰度图像
    }
    else
    {
        channel = 3;                                                  // 通道数为3
        CameraSetIspOutFormat(camera_handle, CAMERA_MEDIA_TYPE_BGR8); // 24位彩色图像
    }

    return true;
}

bool MV_camera::read_frame()
{
    // 获得一帧图像数据
    int status4 = CameraGetImageBuffer(camera_handle, &pFrameInfo, &pbyBuffer, 10000000);
    if (status4 == CAMERA_STATUS_SUCCESS)
    {
        // 将原始图像数据转为bgr图像数据储存到rgb_buffer中
        // pbyBuffer处理前的图像指针
        // rgbBuffer处理后的图像指针
        CameraImageProcess(camera_handle, pbyBuffer, rgbBuffer, &pFrameInfo);
        // 将图像存入src，设置宽高
        src = cv::Mat(cv::Size(pFrameInfo.iWidth, pFrameInfo.iHeight), CV_8UC3, rgbBuffer);
        //        //图像宽高缩小1/2
        //        cv::resize(src,src,cv::Size(src.cols/2,src.rows/2));
        return true;
    }
    else // 获得一帧图像数据失败，输出错误码
    {
        std::cout << "CameraGetImageBuffer Error" << status4 << std::endl;
        return false;
    }
}

bool MV_camera::release_Buffer()
{
    // 将图像缓冲区中的图像数据释放掉
    CameraReleaseImageBuffer(camera_handle, pbyBuffer);
    return true;
}

void MV_camera::output_parameter()
{
    int gain;
    double time;
    // 获取相机当前的曝光时间
    CameraGetExposureTime(camera_handle, &time);
    // 获取相机的模拟增益值大，亮度越大，最大192，超过自动截断）
    CameraGetAnalogGain(camera_handle, &gain);
    // 获取当前相机的曝光和增益
    std::cout << "ExposureTime: " << time << std::endl;
    std::cout << "Gain: " << gain << std::endl;
}

MV_camera::~MV_camera()
{
    CameraUnInit(camera_handle);
    if (rgbBuffer != nullptr)
        free(rgbBuffer);
}