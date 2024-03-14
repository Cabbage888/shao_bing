#include <opencv2/opencv.hpp>
#include <iostream>
#include "camera/CameraApi.h"
#include "robot_status.h"
#include "robot_struct.h"

using namespace std;

class MV_camera
{
private:
    tSdkCameraDevInfo camera_list[3];//设备列表数组指针
    INT camera_num = 10000;//设备的个数指针（需初始化为一个大于使用相机数量的数字）
    CameraHandle camera_handle;//相机的句柄指针
    tSdkCameraCapbility capbility;//相机特性描述的结构体
    int iAnalogGain = 152;//图像模拟增益值
    int channel = 3;// 通道数选择图像格式
    tSdkFrameHead pFrameInfo;//图像的帧头信息指针
    BYTE* pbyBuffer;//指向图像的数据的缓冲区指针
    BYTE* rgbBuffer;//处理后图像输出的缓冲区地址


public:
    cv::Mat src;//图像
    char *name;

    //构造函数
    MV_camera()
    {}
    //相机初始化（传入相机名称）
    bool init(char *Camera_Name);
    //读取图片
    bool read_frame();
    //释放缓冲区图像
    bool release_Buffer();
    //输出参数
    void output_parameter();
    //析构函数
    ~MV_camera();
};