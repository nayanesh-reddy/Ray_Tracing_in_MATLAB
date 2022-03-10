tic;
clear
clc
width=100;
height=50;
x1=10; y1=10;
x2=80; y2=40;

I=uint8(zeros(height,width,3));

dx=x2-x1;dy=y2-y1;

if abs(dx)>abs(dy)
    step=abs(dx);
else
    step=abs(dy);
end

xinc=dx/step; yinc=dy/step;

for i=1:step
    I(height-round(y1),round(x1),:)=((step-i)/step)*[255;255;0]+(i/step)*[0;255;255];
    x1=x1+xinc;
    y1=y1+yinc;
end

imshow(I,'initialmagnification','fit')
toc;