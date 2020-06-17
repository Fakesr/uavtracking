//Track Object---advanced by Xuancen Liu -----------------------------------------
//2019.9.18 at Hunan Changsha.
// email: buaalxc@163.com
//wechat: liuxuancen003
#include <math.h>
#include <string>
#include <vector>
#include <iostream>
#include <pthread.h>
#include <thread>
#include <chrono>
#include <boost/thread/mutex.hpp>
#include <boost/thread/shared_mutex.hpp>

#include <ros/ros.h>  
#include <image_transport/image_transport.h>  
#include <cv_bridge/cv_bridge.h>  
#include <sensor_msgs/image_encodings.h>  
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Pose2D.h>
#include <opencv2/opencv.hpp>
//#include <opencv2/dnn.hpp>

#include <opencv2/dnn/shape_utils.hpp>
#include <opencv2/imgproc/imgproc.hpp>  
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/ml.hpp>
#include <opencv2/dnn/dnn.hpp>

#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include <opencv/cv.hpp>

#include "kcftracker.hpp"

#include "fv_tracking/Diff.h"
#include "derror.h"

using namespace std;
using namespace cv;


#define MARKER_SIZE 0.18
#define F1 300
#define F2 300
#define C1 320
#define C2 240

static const std::string RGB_WINDOW = "RGB Image window";

//! Camera related parameters.
int frameWidth_;
int frameHeight_;

float get_ros_time(ros::Time begin);                                                 //获取ros当前时间

std_msgs::Header imageHeader_;
cv::Mat camImageCopy_;
//boost::shared_mutex mutexImageCallback_;
bool imageStatus_ = false;
//boost::shared_mutex mutexImageStatus_;

static DERROR derrorX, derrorY;

void cameraCallback(const sensor_msgs::ImageConstPtr& msg)
{
    ROS_DEBUG("[EllipseDetector] USB image received.");

    cv_bridge::CvImagePtr cam_image;

    try {
        cam_image = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        imageHeader_ = msg->header;
    } catch (cv_bridge::Exception& e) {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

    if (cam_image) {
        {
            //boost::unique_lock<boost::shared_mutex> lockImageCallback(mutexImageCallback_);
            camImageCopy_ = cam_image->image.clone();
        }
        {
            //boost::unique_lock<boost::shared_mutex> lockImageStatus(mutexImageStatus_);
            imageStatus_ = true;
        }
        frameWidth_ = cam_image->image.size().width;
        frameHeight_ = cam_image->image.size().height;
    }
    return;
}

// 用此函数查看是否收到图像话题
bool getImageStatus(void)
{
    //boost::shared_lock<boost::shared_mutex> lock(mutexImageStatus_);
    return imageStatus_;
}


float get_ros_time(ros::Time begin)
{
    ros::Time time_now = ros::Time::now();
    float currTimeSec = time_now.sec-begin.sec;
    float currTimenSec = time_now.nsec / 1e9 - begin.nsec / 1e9;
    return (currTimeSec + currTimenSec);
}


//! ROS subscriber and publisher.
image_transport::Subscriber imageSubscriber_;
ros::Publisher pose_pub;





bool HOG = true;
bool FIXEDWINDOW = false;
bool MULTISCALE = true;
bool SILENT = true;
bool LAB = false;

// Create KCFTracker object
KCFTracker tracker(HOG, FIXEDWINDOW, MULTISCALE, LAB);

int nFrames = 0;
//Init Rect
cv::Rect initRect(0, 0, 0, 0);
//参考点
cv::Point referencePoint(320, 480);
//初始化BBOX
cv::Rect yoloBbox(0, 0, 0, 0);
cv::Rect kcfBbox(0, 0, 0, 0);
bool startyolo= true;
bool yoloFindTarget = false;
bool kcfLost = true;

vector<string> classes;//储存名字的容器
float confThreshold = 0.5;//置信度阈值
float nmsThreshold = 0.4;//非最大抑制阈值
int inpWidth = 416;//网络输入图片宽度
int inpHeight = 416;//网络输入图片高度
//移除低置信度边界框

//绘制预测边界框
void drawPred(int classId, float conf, int left, int top, int right, int bottom, cv::Mat& frame) {
    //绘制边界框
    cv::rectangle(frame, cv::Point(left, top), cv::Point(right, bottom), cv::Scalar(255, 178, 50), 3);

    string label = cv::format("%.2f", conf);
    if (!classes.empty()) {
        CV_Assert(classId < (int)classes.size());
        label = classes[classId] + ":" + label;//边框上的类别标签与置信度
    }
    //绘制边界框上的标签
    int baseLine;
    cv::Size labelSize = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseLine);
    top = max(top, labelSize.height);
    cv::rectangle(frame, cv::Point(left, top - round(1.5 * labelSize.height)), cv::Point(left + round(1.5 * labelSize.width), top + baseLine), cv::Scalar(255, 255, 255), cv::FILLED);
    cv::putText(frame, label, cv::Point(left, top), cv::FONT_HERSHEY_SIMPLEX, 0.75, cv::Scalar(0, 0, 0), 1);
}


bool getNearestBox(std::vector<int>& classIds, std::vector<cv::Rect>& bBoxes, std::vector<int>& indices, cv::Point& referencePoint, cv::Rect& nearestBox)
{
    if (indices.size() > 0)
    {
        int nearestIdx;
        bool init = true;
        bool discoverTarget = false;
        for (size_t i = 0; i < indices.size(); ++i)
        {
            int idx = indices[i];
            //ROS_INFO("Determine if it is a target class.");
            /*classIds[idx] == 0 || classIds[idx] == 1||classIds[idx]==41*/
            discoverTarget = true;
            if (init)
            {
                nearestIdx = idx;
                init = !init;
            }
            else
            {
                cv::Rect box1 = bBoxes[nearestIdx];
                cv::Rect box2 = bBoxes[idx];
                cv::Point bBoxCenetr1 = cv::Point(box1.x + box1.width / 2, box1.y + box1.height / 2);
                cv::Point bBoxCenetr2 = cv::Point(box2.x + box2.width / 2, box2.y + box2.height / 2);
                int dist1 = abs(bBoxCenetr1.x - referencePoint.x) + abs(bBoxCenetr1.y - referencePoint.y);//街区距离
                int dist2 = abs(bBoxCenetr2.x - referencePoint.x) + abs(bBoxCenetr2.y - referencePoint.y);//街区距离
                if (dist1 > dist2)
                {
                    nearestIdx = idx;
                }
            }



        }

        if (discoverTarget)
        {
            nearestBox = bBoxes[nearestIdx];
            return true;
        }
        else
        {
            std::cout << "No target found...\n";
            return false;
        }
    }
    else
    {
        std::cout << "No box found...\n";
        return false;
    }
}


//从输出层得到名字
vector<cv::String> getOutputNames(const cv::dnn::Net& net) {
    static vector<cv::String> names;
    if (names.empty()) {
        //取得输出层指标
        vector<int> outLayers = net.getUnconnectedOutLayers();
        vector<cv::String> layersNames = net.getLayerNames();
        //取得输出层名字
        names.resize(outLayers.size());
        for (size_t i = 0; i < outLayers.size(); i++) {
            names[i] = layersNames[outLayers[i] - 1];
        }
    }
    return names;
}

void postprocess(cv::Mat& frame, const vector<cv::Mat>& outs, cv::Rect& resultBbox) {
    vector<int> classIds;//储存识别类的索引
    vector<float> confidences;//储存置信度
    vector<cv::Rect> boxes;//储存边框

    for (size_t i = 0; i < outs.size(); i++) {
        //从网络输出中扫描所有边界框
        //保留高置信度选框
        //目标数据data:x,y,w,h为百分比，x,y为目标中心点坐标
        float* data = (float*)outs[i].data;
        for (int j = 0; j < outs[i].rows; j++, data += outs[i].cols) {
            cv::Mat scores = outs[i].row(j).colRange(5, outs[i].cols);
            cv::Point classIdPoint;
            double confidence;//置信度
            //取得最大分数值与索引
            cv::minMaxLoc(scores, 0, &confidence, 0, &classIdPoint);
            if (confidence > confThreshold) {
                int centerX = (int)(data[0] * frame.cols);
                int centerY = (int)(data[1] * frame.rows);
                int width = (int)(data[2] * frame.cols);
                int height = (int)(data[3] * frame.rows);
                int left = centerX - width / 2;
                int top = centerY - height / 2;

                classIds.push_back(classIdPoint.x);
                confidences.push_back((float)confidence);
                boxes.push_back(cv::Rect(left, top, width, height));
            }

        }

    }

    //低置信度
    vector<int> indices;//保存没有重叠边框的索引
    //该函数用于抑制重叠边框
    cv::dnn::NMSBoxes(boxes, confidences, confThreshold, nmsThreshold, indices);
    for (size_t i = 0; i < indices.size(); i++) {
        int idx = indices[i];
        cv::Rect box = boxes[idx];
        drawPred(classIds[idx], confidences[idx], box.x, box.y,
            box.x + box.width, box.y + box.height, frame);
    }
    cv::Rect nearestBox(0, 0, 0, 0);
    if (getNearestBox(classIds, boxes, indices, referencePoint, nearestBox))//得到最近的bounding box
    {
        std::cout << "YOLO find bbox." << std::endl;
        resultBbox = nearestBox;
        yoloFindTarget = true;
        startyolo = false;
    }
    else
    {
        std::cout << "YOLO not find bbox." << std::endl;
        resultBbox = cv::Rect(0, 0, 0, 0);
        yoloFindTarget = false;
        startyolo = true;
    }


}



//run kcf
//void runkcf(cv::Mat frame, cv::Rect initRect, cv::Rect& resultBbox);
//void runyolo3(cv::Mat frame,cv::Rect &resultbbox);





int main(int argc, char **argv)
{

    ros::init(argc, argv, "tracker_ros");
    ros::NodeHandle nh;
    image_transport::ImageTransport it(nh); 
    ros::Rate loop_rate(5);
    
    // 接收图像的话题
    imageSubscriber_ = it.subscribe("/camera/rgb/image_raw", 1, cameraCallback);
  
    string classesFile = "/home/dov1s/catkin_ws/src/fv_tracking/data/coco.names";
    ifstream ifs(classesFile.c_str());
    string classline;
    while (getline(ifs, classline))classes.push_back(classline);

    //取得模型的配置和权重文件
    cv::String modelConfiguration = "/home/dov1s/catkin_ws/src/fv_tracking/data/yolov3.cfg";
    cv::String modelWeights = "/home/dov1s/catkin_ws/src/fv_tracking/data/yolov3.weights";
    
    //加载网络
    cv::dnn::Net net = cv::dnn::readNetFromDarknet(modelConfiguration, modelWeights);
    net.setPreferableBackend(cv::dnn::DNN_BACKEND_OPENCV);
    net.setPreferableBackend(cv::dnn::DNN_TARGET_CPU);
    
    cv::Mat blob;



    ros::Publisher flag_version_pub=nh.advertise<geometry_msgs::Point>("/relative_position_flag",10);
    // diff 
    ros::Publisher position_diff_pub=nh.advertise<fv_tracking::Diff>("/position_diff",10);    
  
    sensor_msgs::ImagePtr msg_ellipse;

    const auto wait_duration = std::chrono::milliseconds(2000);

    //cv::namedWindow(RGB_WINDOW);
    
    float cur_time;
    float last_time;
    float last_error_x, last_error_y;
    float dt;
    float unfilter_vely, unfilter_velx;
                   

    geometry_msgs::Point flag_vision;
    fv_tracking::Diff error_pixels;
    ros::Time begin_time = ros::Time::now();


    while (ros::ok())
    {


        cur_time = get_ros_time(begin_time);
        dt = (cur_time - last_time);
        if(dt>1.0 || dt<0.0)
        {
          dt=0.05;
        }
        while (!getImageStatus()) 
        {
            printf("Waiting for image.\n");
            std::this_thread::sleep_for(wait_duration);
            ros::spinOnce();
        }

        Mat frame;
        {
            //boost::unique_lock<boost::shared_mutex> lockImageCallback(mutexImageCallback_);
            frame = camImageCopy_.clone();
        }
        static bool need_tracking_det = false;
        //cv::imshow("yolo_kcf_frame",frame/255.0);
        Mat temp1;
        Mat temp2;
        Mat blob;
        frame.copyTo(temp1);
        frame.copyTo(temp2);


        while(startyolo){
        //runyolo3(temp1,yoloBbox);
        cv::dnn::blobFromImage(temp1,blob,1/255.0,cv::Size(inpWidth, inpHeight),cv::Scalar(0,0,0),true,false);
        //Sets the input to the network
        net.setInput(blob);
        //Runs the forward pass to get output of the output layers
        std::vector<cv::Mat> outs;
        net.forward(outs, getOutputNames(net));
         
        postprocess(temp1, outs,yoloBbox);
        cv::Mat detectedFrame;
        temp1.convertTo(detectedFrame, CV_8UC1);
        //show detectedFrame
        cv::imshow("yoloDetectedFrame",detectedFrame);
        cv::waitKey(1);
        std::cout<<"yoloBbox:"<<yoloBbox<<std::endl;
     
        }
        
        if (yoloFindTarget)
        {
           ROS_INFO("run kcf...");
           initRect = yoloBbox;
           cv::Rect &resultBbox = kcfBbox;
           if (nFrames==0||kcfLost)
           {
               if (initRect.width > 0 && initRect.height > 0)
               {
                   ROS_INFO("kcf init...");
                   kcfLost = false;
                   tracker.init(initRect, temp2);
                   cv::rectangle(temp2,
                       cv::Point(initRect.x, initRect.y),
                       cv::Point(initRect.x + initRect.width, initRect.y + initRect.height),
                       cv::Scalar(0, 255, 255), 1, 8);
                   initRect = cv::Rect(0, 0, 0, 0);
               }
               else
               {
                   cout << "no kcf init Rect" << endl;
               }

           }
           // Update
           else
           {
               ROS_INFO("kcf update...");
               if (tracker.update(temp2, resultBbox))
               {


                   //result = tracker.update(frame);
                   flag_vision.x = 0x01;
                   error_pixels.x = resultBbox.x + resultBbox.width / 2 - temp2.cols / 2;
                   error_pixels.y = resultBbox.y + resultBbox.height / 2 - temp2.rows / 2;

                   error_pixels.recsize = resultBbox.width * resultBbox.height;
                   error_pixels.selectrec = yoloBbox.width * yoloBbox.height;

                   float error_x = error_pixels.x;
                   float error_y = error_pixels.y;

                   derrorX.add_error(error_x, cur_time);
                   derrorY.add_error(error_y, cur_time);
                   derrorX.derror_output();
                   derrorY.derror_output();
                   derrorX.show_error();
                   derrorY.show_error();

                   error_pixels.velx = derrorX.Output;
                   error_pixels.vely = derrorY.Output;

                   error_pixels.Ix += error_pixels.x * dt;
                   error_pixels.Iy += error_pixels.y * dt;

                   unfilter_velx = (error_pixels.x - last_error_x) / dt;
                   unfilter_vely = (error_pixels.y - last_error_y) / dt;

                   last_time = cur_time;
                   last_error_x = error_pixels.x;
                   last_error_y = error_pixels.y;

                   cv::rectangle(temp2,
                       cv::Point(resultBbox.x, resultBbox.y),
                       cv::Point(resultBbox.x + resultBbox.width,
                           resultBbox.y + resultBbox.height),
                       cv::Scalar(0, 255, 255), 1, 8);


               }
               else
               {
                   ROS_INFO("kcf update failed...");
                   flag_vision.x = 0x00;
                   error_pixels.x = 0.0;
                   error_pixels.y = 0.0;
                   error_pixels.Ix = 0.0;
                   error_pixels.Iy = 0.0;
                   error_pixels.velx = 0.0;
                   error_pixels.vely = 0.0;
                   error_pixels.recsize = 0.0;
                   error_pixels.selectrec = 0.0;
                   kcfLost = true;
               }

               position_diff_pub.publish(error_pixels);
               flag_version_pub.publish(flag_vision);

               float left_point = temp2.cols / 2 - 20;
               float right_point = temp2.cols / 2 + 20;
               float up_point = temp2.rows / 2 + 20;
               float down_point = temp2.rows / 2 - 20;
               //draw
               cv::line(temp2,Point(left_point,temp2.rows/2),Point(right_point,temp2.rows/2),Scalar(0,255,0),1,8);
               cv::line(temp2,Point(temp2.cols/2,down_point),Point(temp2.cols/2,up_point),Scalar(0,255,0),1,8);
               putText(temp2, "x:", Point(50, 60), FONT_HERSHEY_SIMPLEX, 1, Scalar(255, 23, 0), 3, 8);
               putText(temp2, "y:", Point(50, 90), FONT_HERSHEY_SIMPLEX, 1, Scalar(255, 23, 0), 3, 8);

               //draw
               char s[20] = "";
               sprintf(s, "%.2f", error_pixels.x);
               putText(temp2, s, Point(100, 60), FONT_HERSHEY_SIMPLEX, 1, Scalar(255, 23, 0), 2, 8);
               sprintf(s, "%.2f", error_pixels.y);
               putText(temp2, s, Point(100, 90), FONT_HERSHEY_SIMPLEX, 1, Scalar(255, 23, 0), 2, 8);



               //imshow(RGB_WINDOW, temp2);
               std::cout<<"tracker end"<<std::endl;
               //writer << frame;
               waitKey(5);
            }

               nFrames++;
               if (SILENT)
               {   temp2.convertTo(temp2, CV_8UC1);
                   cv::imshow("kcf tracker", temp2);
                   cv::waitKey(1);
               }


           

           ros::spinOnce();
           loop_rate.sleep();
       }

   }

}



