%%%  final results of this project 
%%%%%%%%%%%%%%%%%%%%%%%%  pre-process  %%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
tic

%%%% get the camera %%%%
disp('getting the camera info......')
obj=videoinput('winvideo',1,'YUY2_640x480'); 
h1=preview(obj);                 %Ô¤ÀÀÊÓÆµ£¬Í¬Ê±»ñÈ¡¾ä±ú 
h2=figure(2); 

%%%% set searching creteria %%%%
disp('setting searching creterias.........')%  Ia: creteria      Ib: tested image
importfile('data/biaozhun.jpg')
Ia=single(rgb2gray(biaozhun));  
[fa,da] = vl_sift(Ia);
% xianshijieguo(biaozhun,fa);
      
%%%%%%%%%%%%%%%%%%%%% baisc parameters %%%%%%%%%%%%%%%%%%%%%%
disp('setting basic parameters.......')
period=0.4;
frame=getsnapshot(obj);     %²¶»ñÍ¼Ïñ      
Ib=single(rgb2gray(frame)); 
[fb,db]=vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da, db) ;
% frame=ycbcr2rgb(frame);
[size_x,size_y,ttt]=size(frame);
cen_x=0;cen_y=0;
f_tmp=fb;m_tmp=matches;

while true
    frame=getsnapshot(obj);     %²¶»ñÍ¼Ïñ      
     frame=ycbcr2rgb(frame);
    imshow(frame);
%     biaoji(h2,cen_x,cen_y);
    hs = vl_plotframe(f_tmp(:,m_tmp(2,:))) ;
    set(hs,'color','r','linewidth',5) ;
    drawnow;

%%%%%%%%%%%%%%%%%  process every 1 second
    if toc>period
        tic;
        disp([num2str(period) ' seconds past'])
        
        Ib=single(rgb2gray(frame)); 
        [fb,db]=vl_sift(Ib);
        [matches, scores] = vl_ubcmatch(da, db) ;
        if ~isempty(matches)
            f_tmp=fb;m_tmp=matches;
            cen_x=mean(fb(1,matches(2,:)));
            cen_y=mean(fb(2,matches(2,:)));
%             cen_r=sqrt((max(fb(1,matches(2,:)))-min(fb(1,matches(2,:))))^2+(max(fb(2,matches(2,:)))-min(fb(2,matches(2,:))))^2);
            [cen_x,cen_y]
            
        end
        hs = vl_plotframe(fb) ;
        set(hs,'color','y','linewidth',2) ;
%         xianshijieguo(frame,fb(:,matches(2,:)));
        
    end
end




























