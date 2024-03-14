#include <ros/ros.h>
#include <std_msgs/String.h>
#include <new_msgs/Armor.h>        //自定义的消息类型
#include <new_msgs/vector_Armor.h> //自定义的消息类型
#include <new_msgs/barrel.h>       //自定义的消息类型
#include <new_msgs/chassis.h>      //自定义的消息类型

// 回调函数
void camera1_callback(new_msgs::vector_Armor msg)
{
    ROS_WARN("camera1");
    if (!msg.grade.empty())
    {
        ROS_INFO("grade = %d", msg.grade[0]);
        ROS_INFO("id = %d", msg.id[0]);
        ROS_INFO("x = %f", msg.x[0]);
        ROS_INFO("y = %f", msg.y[0]);
        ROS_INFO("z = %f", msg.z[0]);
    }
}

void camera2_callback(new_msgs::vector_Armor msg)
{

    ROS_WARN("camera2");
    if (!msg.grade.empty())
    {
        ROS_INFO("grade = %d", msg.grade[0]);
        ROS_INFO("id = %d", msg.id[0]);
        ROS_INFO("x = %f", msg.x[0]);
        ROS_INFO("y = %f", msg.y[0]);
        ROS_INFO("z = %f", msg.z[0]);
    }
}

void camera3_callback(new_msgs::vector_Armor msg)
{
    {
        ROS_WARN("camera3");
        if (!msg.grade.empty())
        {
            ROS_INFO("grade = %d", msg.grade[0]);
            ROS_INFO("id = %d", msg.id[0]);
            ROS_INFO("x = %f", msg.x[0]);
            ROS_INFO("y = %f", msg.y[0]);
            ROS_INFO("z = %f", msg.z[0]);
        }
    }
}

void left_callback(new_msgs::barrel msg)
{
    ROS_WARN("left");
    ROS_INFO("id = %d", msg.id);
    ROS_INFO("grade = %d", msg.grade);
    ROS_INFO("num = %d", msg.num);
    ROS_INFO("yaw = %f", msg.yaw);
    ROS_INFO("x = %f", msg.x);
    ROS_INFO("y = %f", msg.y);
    ROS_INFO("z = %f", msg.z);
}

void right_callback(new_msgs::barrel msg)
{
    ROS_WARN("right");
    ROS_INFO("id = %d", msg.id);
    ROS_INFO("grade = %d", msg.grade);
    ROS_INFO("num = %d", msg.num);
    ROS_INFO("yaw = %f", msg.yaw);
    ROS_INFO("x = %f", msg.x);
    ROS_INFO("y = %f", msg.y);
    ROS_INFO("z = %f", msg.z);
}

void cha_callback(new_msgs::chassis msg)
{
    ROS_WARN("chassis");
    ROS_INFO("num = %d", msg.num);
    for (int i = 0; i < msg.grade.size(); i++)
    {
        ROS_WARN("target %d", i + 1);
        ROS_INFO("id = %d", msg.id[i]);
        ROS_INFO("grade = %d", msg.grade[i]);
        ROS_INFO("yaw = %f", msg.yaw[i]);
        ROS_INFO("x = %f", msg.x[i]);
        ROS_INFO("y = %f", msg.y[i]);
        ROS_INFO("z = %f", msg.z[i]);
    }
}

int main(int argc, char *argv[])
{
    /* code */
    setlocale(LC_ALL, ""); // 可接受发布者的中文内容
    ros::init(argc, argv, "sub_node");

    ros::NodeHandle nh; // 管家,通过管家发布一个话题并得到一个消息发送对象
    // ros::Subscriber sub1 = nh.subscribe("camera1", 10, camera1_callback); // pub理解为由管家发的手机,该函数是泛型函数，尖括号参数是消息类型，参数是话题名称和，消息缓存长度
    // ros::Subscriber sub2 = nh.subscribe("camera2", 10, camera2_callback);
    // ros::Subscriber sub3 = nh.subscribe("camera3", 10, camera3_callback);
    ros::Subscriber left_sub = nh.subscribe("Robot_left_imu",10,left_callback);
    ros::Subscriber right_sub = nh.subscribe("Robot_right_imu",10,right_callback);
    // ros::Subscriber cha_sub = nh.subscribe("Robot_cha_imu", 10, cha_callback);

    while (ros::ok()) // 让节点保持运行
    {
        ros::spinOnce(); // 调用该函数会注意到消息包的接收
    }

    return 0;
}
