#include <ros/ros.h>
#include <new_msgs/Armor.h>        //自定义的消息类型
#include <new_msgs/vector_Armor.h> //自定义的消息类型
#include <new_msgs/barrel.h>       //自定义的消息类型
#include <new_msgs/chassis.h>      //自定义的消息类型
#include <std_msgs/Float32.h>
#include <std_msgs/UInt8.h>
#include <opencv2/opencv.hpp>
#include <MV_camera.h>
#include <Armor_detection.h>
#include <AngleSolve.h>
#include <robot_status.h>
#include <robot_struct.h>

using namespace std;
using namespace cv;

vector<new_msgs::Armor> Armor;     // 每个摄像头至多筛选出1个装甲板
vector<new_msgs::Armor> all_Armor; // 全部装甲板（除了陀螺情况下两个装甲板出自一个机器人）
int mode = 20;                      // 模式（10：打单 20：打双）
int num = 0;                       // 传输的目标数量
double dis_yaw = 1;                // 大云台坐标系相对于世界坐标系的yaw（弧度）
double add_yaw = 0.610865;         // 额外角度约35度（弧度）                          TODO：待测试
int c1 = 0;                        // camera1_callback是否运行过
int c2 = 0;                        // camera2_callback是否运行过
int c3 = 0;                        // camera3_callback是否运行过


void camera1_callback(new_msgs::vector_Armor msg)
{
    c1 = 1;
    int max_index = -1;
    new_msgs::Armor temp;
    for (int i = 0; i < msg.grade.size(); i++)
    {
        temp.grade = msg.grade[i];
        temp.id = msg.id[i];
        temp.x = msg.x[i];
        temp.y = msg.y[i];
        temp.z = msg.z[i];

        all_Armor.push_back(temp);
        if (max_index == -1 || msg.grade[i] > msg.grade[max_index])
        {
            max_index = i;
        }
    }
    if (max_index != -1)
    {
        temp.grade = msg.grade[max_index];
        temp.id = msg.id[max_index];
        temp.x = msg.x[max_index];
        temp.y = msg.y[max_index];
        temp.z = msg.z[max_index];
        Armor.push_back(temp);
    }
}

void camera2_callback(new_msgs::vector_Armor msg)
{
    c2 = 1;
    int max_index = -1;
    new_msgs::Armor temp;
    for (int i = 0; i < msg.grade.size(); i++)
    {
        temp.grade = msg.grade[i];
        temp.id = msg.id[i];
        temp.x = msg.x[i];
        temp.y = msg.y[i];
        temp.z = msg.z[i];

        all_Armor.push_back(temp);
        if (max_index == -1 || msg.grade[i] > msg.grade[max_index])
        {
            max_index = i;
        }
    }
    if (max_index != -1)
    {
        temp.grade = msg.grade[max_index];
        temp.id = msg.id[max_index];
        temp.x = msg.x[max_index];
        temp.y = msg.y[max_index];
        temp.z = msg.z[max_index];
        Armor.push_back(temp);
    }
}

void camera3_callback(new_msgs::vector_Armor msg)
{
    c3 = 1;
    int max_index = -1;
    new_msgs::Armor temp;
    for (int i = 0; i < msg.grade.size(); i++)
    {
        temp.grade = msg.grade[i];
        temp.id = msg.id[i];
        temp.x = msg.x[i];
        temp.y = msg.y[i];
        temp.z = msg.z[i];

        all_Armor.push_back(temp);
        if (max_index == -1 || msg.grade[i] > msg.grade[max_index])
        {
            max_index = i;
        }
    }
    if (max_index != -1)
    {
        temp.grade = msg.grade[max_index];
        temp.id = msg.id[max_index];
        temp.x = msg.x[max_index];
        temp.y = msg.y[max_index];
        temp.z = msg.z[max_index];
        Armor.push_back(temp);
    }
}

void yaw_callback(std_msgs::Float32 msg)
{
    dis_yaw=msg.data;
}

void mode_callback(std_msgs::UInt8 msg)
{
    mode=msg.data;
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");                    
    ros::init(argc, argv, "camera_sum_node"); 

    ros::NodeHandle nh;
    ros::Subscriber sub1 = nh.subscribe("camera1", 10, camera1_callback);
    ros::Subscriber sub2 = nh.subscribe("camera2", 10, camera2_callback);
    ros::Subscriber sub3 = nh.subscribe("camera3", 10, camera3_callback);
    ros::Subscriber sub_yaw = nh.subscribe("yaw",10,yaw_callback);
    ros::Subscriber sub_mode = nh.subscribe("mode",10,mode_callback);

    ros::Publisher left_imu = nh.advertise<new_msgs::barrel>("Robot_left_imu", 10);
    ros::Publisher right_imu = nh.advertise<new_msgs::barrel>("Robot_right_imu", 10);
    ros::Publisher cha_imu = nh.advertise<new_msgs::chassis>("Robot_cha_imu", 10);

    while (ros::ok()) // 让节点保持运行
    {
        ros::spinOnce(); // 调用该函数会注意到消息包的接收

        if (c1 && c2 && c3) // 三个回调函数都已经运行完
        {
            // ------------------------------底盘消息包------------------------------
            new_msgs::chassis cha_msg;

            int arr[6] = {0};
            for (int i = 0; i < all_Armor.size(); i++) // 避免相同id
            {
                if (arr[all_Armor[i].id] == 0)
                {
                    arr[all_Armor[i].id] = 1;
                    cha_msg.grade.push_back(all_Armor[i].grade);
                    cha_msg.id.push_back(all_Armor[i].id);
                    cha_msg.x.push_back(all_Armor[i].x);
                    cha_msg.y.push_back(all_Armor[i].y);
                    cha_msg.z.push_back(all_Armor[i].z);
                    double imu_yaw = atan2(all_Armor[i].y, all_Armor[i].x); // 相对大云台坐标系（弧度）
                    cha_msg.yaw.push_back(imu_yaw);
                }
            }
            cha_msg.num = cha_msg.grade.size();

            all_Armor.clear(); // 清空容器

            cha_imu.publish(cha_msg); // 向底盘发送消息包

            // ------------------------------左右云台消息包------------------------------
            // mode 1：打单目标
            if (mode == 10)
            {
                new_msgs::barrel left_right_msg; // 左右云台消息包

                if (!Armor.empty()) // 检测到目标
                {
                    // 打分值最高装甲板
                    int max_grade = 0;
                    int index = 0; // 目标索引
                    for (int i = 0; i < Armor.size(); i++)
                    {
                        if (max_grade <= Armor[i].grade)
                        {
                            index = i;
                            max_grade = Armor[i].grade;
                        }
                    }

                    double imu_yaw = atan2(Armor[index].y, Armor[index].x); // 相对大云台坐标系（弧度）
                    double world_yaw = imu_yaw + dis_yaw;                   // 相对世界坐标系（弧度）
                    // cout << imu_yaw * 180.0f / CV_PI << endl;               // 角度制

                    left_right_msg.id = Armor[index].id;
                    left_right_msg.grade = Armor[index].grade;
                    left_right_msg.num = 1;
                    left_right_msg.yaw = world_yaw;
                    left_right_msg.x = Armor[index].x;
                    left_right_msg.y = Armor[index].y;
                    left_right_msg.z = Armor[index].z;

                    Armor.clear();
                }
                else // 检测不到目标
                {
                    left_right_msg.id = 0;
                    left_right_msg.grade = 0;
                    left_right_msg.num = 0;
                    left_right_msg.yaw = 0;
                    left_right_msg.x = 0;
                    left_right_msg.y = 0;
                    left_right_msg.z = 0;
                }

                left_imu.publish(left_right_msg);
                right_imu.publish(left_right_msg);
            }
            // mode 2：打双目标
            else if(mode==20)
            {
                new_msgs::barrel left_msg;
                new_msgs::barrel right_msg;

                // 初始化
                left_msg.id = 0;
                left_msg.grade = 0;
                left_msg.num = 0;
                left_msg.yaw = 0;
                left_msg.x = 0;
                left_msg.y = 0;
                left_msg.z = 0;
                right_msg = left_msg;

                if (Armor.size() == 0) // 检测不到目标
                {
                }
                else if (Armor.size() == 1) // 检测到1个目标
                {
                    double imu_yaw = atan2(Armor[0].y, Armor[0].x); // 相对大云台坐标系（弧度）
                    double world_yaw = imu_yaw + dis_yaw;           // 相对世界坐标系（弧度）
                    cout << imu_yaw * 180.0f / CV_PI << endl;       // 角度制

                    if (imu_yaw > -add_yaw) // 左
                    {
                        left_msg.id = Armor[0].id;
                        left_msg.grade = Armor[0].grade;
                        left_msg.num = 1;
                        left_msg.yaw = world_yaw;
                        left_msg.x = Armor[0].x;
                        left_msg.y = Armor[0].y;
                        left_msg.z = Armor[0].z;
                    }
                    if (imu_yaw < add_yaw) // 右
                    {
                        right_msg.id = Armor[0].id;
                        right_msg.grade = Armor[0].grade;
                        right_msg.num = 1;
                        right_msg.yaw = world_yaw;
                        right_msg.x = Armor[0].x;
                        right_msg.y = Armor[0].y;
                        right_msg.z = Armor[0].z;
                    }

                    Armor.clear();
                }
                else // 检测到2个目标以上
                {
                    int left_index = -1;  // 左云台目标索引
                    int right_index = -1; // 右云台目标索引

                    for (int i = 0; i < Armor.size(); i++)
                    {
                        if (atan2(Armor[i].y, Armor[i].x) > add_yaw) // 左
                        {
                            if (left_index == -1 || Armor[i].grade > Armor[left_index].grade)
                                left_index = i;
                        }
                        if (atan2(Armor[i].y, Armor[i].x) < -add_yaw) // 右
                        {
                            if (right_index == -1 || Armor[i].grade > Armor[right_index].grade)
                                right_index = i;
                        }
                    }
                    for (int i = 0; i < Armor.size(); i++)
                    {
                        if (atan2(Armor[i].y, Armor[i].x) <= add_yaw && atan2(Armor[i].y, Armor[i].x) >= -add_yaw) // 中
                        {
                            if (left_index == -1)
                                left_index = i;
                            else if (right_index == -1)
                                right_index = i;
                            else
                            {
                                if (Armor[left_index].grade > Armor[right_index].grade)
                                    right_index = i;
                                else
                                    left_index = i;
                            }
                        }
                    }

                    if (left_index != -1)
                    {
                        double left_imu_yaw = atan2(Armor[left_index].y, Armor[left_index].x); // 相对大云台坐标系（弧度）
                        double left_world_yaw = left_imu_yaw + dis_yaw;                        // 相对世界坐标系（弧度）
                        cout << "left：" << left_imu_yaw * 180.0f / CV_PI << endl;             // 角度制

                        left_msg.id = Armor[left_index].id;
                        left_msg.grade = Armor[left_index].grade;
                        left_msg.num = 1;
                        left_msg.yaw = left_world_yaw;
                        left_msg.x = Armor[left_index].x;
                        left_msg.y = Armor[left_index].y;
                        left_msg.z = Armor[left_index].z;
                    }

                    if (right_index != -1)
                    {
                        double right_imu_yaw = atan2(Armor[right_index].y, Armor[right_index].x); // 相对大云台坐标系（弧度）
                        double right_world_yaw = right_imu_yaw + dis_yaw;                         // 相对世界坐标系（弧度）
                        cout << "right：" << right_imu_yaw * 180.0f / CV_PI << endl;              // 角度制

                        right_msg.id = Armor[right_index].id;
                        right_msg.grade = Armor[right_index].grade;
                        right_msg.num = 1;
                        right_msg.yaw = right_world_yaw;
                        right_msg.x = Armor[right_index].x;
                        right_msg.y = Armor[right_index].y;
                        right_msg.z = Armor[right_index].z;
                    }

                    Armor.clear();
                }
                // 发布
                left_imu.publish(left_msg);
                right_imu.publish(right_msg);
            }
            // 重置
            c1 = 0;
            c2 = 0;
            c3 = 0;
        }
    }

    return 0;
}