tic;
clear; clc;

O=[0,0,0]; 
C0=[10,1,0]; L0=[-8,8,6]; radius0=1;
C1=[40,-1,0]; L1=[25,-40,60]; radius1=2.5;
C2=[80,0,-1001]; radius2=1000;

md=1.2; ms=1; sk=10; La=10;
back_ground=[0;0;0];
obj_color0=[180;0;0]; 
obj_color1=[0;180;0];
obj_color2=[90;60;40];

light_color=[255;255;255];    

row=1; col=1;
for y1=-0.25:0.001:0.25
    for z1=0.15:-0.001:-0.15
        
        P=[1,y1,z1];
        
        [delta0,xs0,ys0,zs0]=ray_intersection_sphere(O,P,C0,radius0);
        [delta1,xs1,ys1,zs1]=ray_intersection_sphere(O,P,C1,radius1);
        [delta2,xs2,ys2,zs2]=ray_intersection_sphere(O,P,C2,radius2);
        
        S0=[xs0,ys0,zs0];
        S1=[xs1,ys1,zs1];
        S2=[xs2,ys2,zs2];
        
        if delta0>=0  
            
            color=Blinn_Phong_shading(obj_color0, light_color, S0,C0,O,L0,1,md,ms,sk,La);
            color=color+ Blinn_Phong_shading(obj_color0, light_color, S0,C0,O,L1,0.4,md,0.8,30,0);
            I(row,col,1:3)=color; 
            
        elseif delta1>=0 
            
            color=Blinn_Phong_shading(obj_color1 ,light_color ,S1,C1,O,L0,1,md,ms,sk,La);
            color=color+ Blinn_Phong_shading(obj_color1, light_color, S1,C1,O,L1,0.4,md,0.8,30,0);
            I(row,col,1:3)=color; 
        
        elseif delta2>=0
            I(row,col,1:3)=obj_color2;
                       
        else
            I(row,col,1:3)=back_ground;
            
        end            
        row=row+1;
    end
    row=1;
    col=col+1;
end



I=uint8(I);
imshow(I,'initialmagnification','fit')
toc;
%imwrite(I,'balls_floor1.png');
fprintf("%d x %d \n",size(I,2),size(I,1));
clear

