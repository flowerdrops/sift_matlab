clear all;
close all;
clc;

obj=videoinput('winvideo',1,'YUY2_640x480');       %һ��ļ�������ͷ���������������Ϳ��ԣ���������ֱ��ȥ������������Ҳ����
% obj=videoinput('winvideo',1);
h1=preview(obj);                 %Ԥ����Ƶ��ͬʱ��ȡ���  
 h2=figure(2);                    %�½���ʾͼ��figure,ͬʱ��ȡ���

while ishandle(h1) && ishandle(h2)              %���������һ���رվͽ�������
    frame=getsnapshot(obj);     %����ͼ��
    frame=ycbcr2rgb(frame);     %ת�ɲ�ɫ,���frame�Ϳ��԰����Լ���Ը������

    imshow(frame);              %��ʾͼ��
    drawnow;                    % ʵʱ����ͼ��
end

delete(obj);                %ɾ������ 













