#include <ros/ros.h>
#include <new_msgs/vector_Armor.h> //自定义的消息类型
#include <opencv2/opencv.hpp>
#include <MV_camera.h>
#include <Armor_detection.h>
#include <AngleSolve.h>

using namespace std;
using namespace cv;

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "camera2_node"); // argc和argv是main函数参数，camera2_node是节点名

    // 相机类对象
    MV_camera Camera;
    // 自瞄对象
    ArmorDetector detection;
    // 角度解算对象
    AngleSolve AS;
    // 相机名字
    char cameraName[] = "Camera_2";
    // 相机坐标系相较于云台坐标系的欧拉角(角度制，理想情况下分别是0，-120，120)
    double yaw = -120;
    // 电控云台坐标
    Eigen::Vector3d ros_imu_pos;
    // 图像初始化
    Mat src = Mat::zeros(1, 1, CV_8UC3);
    // 相机初始化，传入名字
    bool b = Camera.init(cameraName);
    // 初始化错误
    if (!b)
    {
        cout << "init error" << endl;
        return 0;
    }

    ros::NodeHandle nh;                                                       // 节点管家
    ros::Publisher pub = nh.advertise<new_msgs::vector_Armor>("camera2", 10); // 发送的话题名称为camera2。缓存长度为10
    // 循环
    while (ros::ok())
    {
        // 读取图片
        Camera.read_frame();
        src = Camera.src.clone();
        Camera.release_Buffer();
        // 接入自瞄，显示
        vector<Armor> Targets = detection.Detection(src);
        // 消息包
        new_msgs::vector_Armor msg;

        for (int i = 0; i < Targets.size(); i++)
        {
            // 坐标解算
            ros_imu_pos = AS.pixel2ros_imu(Targets[i], yaw); // 电控云台坐标
            msg.grade.push_back(Targets[i].grade);
            msg.id.push_back(Targets[i].id);
            msg.x.push_back(ros_imu_pos(0));
            msg.y.push_back(ros_imu_pos(1));
            msg.z.push_back(ros_imu_pos(2));
        }
        // imshow("camera2", src);
        waitKey(1);
        pub.publish(msg); // 发送
    }
    return 0;
}
