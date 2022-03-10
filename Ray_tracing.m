tic;
clear; clc;

x0=0; y0=0; z0=0;
x1=x0+1;
xc=10; yc=0; zc=0; r=3;
xL=4; yL=10; zL=5;
row=1; col=1;

md=1.5; ms=0.8; sk=20; 

La=10;
obj_color=[180;0;0];
light_color=[255;255;255];    

%for center=[
for y1=-1:0.01:1
    for z1=0.7:-0.01:-0.7
        
        a=(x1-x0)^2 + (y1-y0)^2 + (z1-z0)^2;
        b = 2*((x1-x0)*(x0-xc) + (y1-y0)*(y0-yc) + (z1-z0)*(z0-zc));
        c = xc^2 + yc^2 + zc^2 + x0^2 + y0^2 + z0^2 - ...
            2*(xc*x0 + yc*y0 + zc*z0) - r^2;
         
        delta = b^2-4*a*c;
        if delta>=0
            root=(-b-sqrt(delta))/2*a;
            x=x0+root*(x1-x0);
            y=y0+root*(y1-y0);
            z=z0+root*(z1-z0);
            
            N=2*[x-xc; y-yc; z-zc]; N=N/norm(N);
            L=[x-xL; y-yL; z-zL]; L=L/norm(L);
            V=[x-x0; y-y0; z-z0]; V=V/norm(V);
            H=-(L+V); H=H/norm(H);
            
            % Blinn-Phong shading model
            color=obj_color - md*obj_color*max(dot(L,N),0)...
                  + ms*light_color*max(dot(H,N),0)^sk + La;
            
            I(row,col,1:3)=color;
            
        else
            I(row,col,1:3)=[50,50,50];
        end
            
        row=row+1;
    end
    row=1;
    col=col+1;
end
I=uint8(I);
imshow(I,'initialmagnification','fit')
toc;