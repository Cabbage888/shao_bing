#include <ros/ros.h>
#include <new_msgs/vector_Armor.h> //自定义的消息类型

#include <opencv2/opencv.hpp>
#include <MV_camera.h>
#include <Armor_detection.h>
#include <AngleSolve.h>
// #include <std_msgs/String.h>

using namespace std;
using namespace cv;
//准备用来模拟电控发来的消息

int main(int argc, char *argv[])
{
    /* code */
    ros::init(argc,argv,"chao_node");



    ros::NodeHandle nh;//该对象是节点与ROS通讯的关键，理解为管家,通过管家发布一个话题并得到一个消息发送对象
    // ros::Publisher pub = nh.advertise<std_msgs::>("connect",10);//pub理解为由管家发的手机,该函数是泛型函数，尖括号参数是消息类型，参数是话题名称和，消息缓存长度

  

    while(ros::ok()){
        printf("wait for connect!\n");
        std_msgs::String msg;
        msg.data = "we can hhhhhh !!!!";
        pub.publish(msg);
        

    } 
    return 0;
}
