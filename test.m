clc
clear all
close all
importfile('biaozhun.jpg')
importfile('test2.png')
% Ia = vl_impattern('test1.jpg');
% Ib=vl_impattern('test2.jpg');
Ia=single(rgb2gray(biaozhun));
Ib=single(rgb2gray(test2));
% image(I);
% I = single(rgb2gray(I));

[fa,da] = vl_sift(Ia);
[fb,db] = vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da, db) ;


image(biaozhun)
perm = randperm(size(fa,2)) ;
sel = perm(1:30) ;
h1 = vl_plotframe(fa) ;
h2 = vl_plotframe(fa) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

figure()
image(test2)
perm = randperm(size(fb,2)) ;
sel = perm(1:30) ;
h1 = vl_plotframe(fb(:,sel)) ;
h2 = vl_plotframe(fb(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;


% perm = randperm(size(f,2)) ;
% sel = perm(1:50) ;
% h1 = vl_plotframe(f(:,sel)) ;
% h2 = vl_plotframe(f(:,sel)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;
% h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
% set(h3,'color','g') ;


















