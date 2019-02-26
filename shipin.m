clear all;
close all;
clc;

obj=videoinput('winvideo',1,'YUY2_640x480');       %一般的家用摄像头第三个参数这样就可以，不能运行直接去掉第三个参数也可以
% obj=videoinput('winvideo',1);
h1=preview(obj);                 %预览视频，同时获取句柄  
 h2=figure(2);                    %新建显示图像figure,同时获取句柄

while ishandle(h1) && ishandle(h2)              %两个句柄有一个关闭就结束程序
    frame=getsnapshot(obj);     %捕获图像
    frame=ycbcr2rgb(frame);     %转成彩色,这个frame就可以按照自己意愿处理了

    imshow(frame);              %显示图像
    drawnow;                    % 实时更新图像
end

delete(obj);                %删除对象 













