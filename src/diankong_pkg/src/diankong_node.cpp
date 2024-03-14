#include <ros/ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/UInt8.h>

int main(int argc, char *argv[])
{
    ros::init(argc,argv,"diankong_node");

    ros::NodeHandle nh;
    ros::Publisher pub_yaw = nh.advertise<std_msgs::Float32>("yaw",10);
    ros::Publisher pub_mode = nh.advertise<std_msgs::UInt8>("mode",10);


    while(ros::ok()){
        std_msgs::Float32 msg1;
        std_msgs::UInt8 msg2;

        msg1.data = 0;//+120度
        msg2.data = 20;

        pub_yaw.publish(msg1);
        pub_mode.publish(msg2);
    } 
    return 0;
}
