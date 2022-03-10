tic;
clear; clc;

O=[0,0,0]; 
C0=[40,3.3,-0.4]; L0=[-20,35,14]; radius0=2.85;
C1=[33,-1.9,-1.85]; L1=[80,-80,260]; radius1=1.85;
C2=[100,-50,-1000]; radius2=1000;

md=1; ms=0.8; sk=10; La=10;
back_ground=[0;0;0];
obj_color0=[180;30;0]; 
obj_color1=[100;60;255];
obj_color2=[0;100;0];

light_color=[25;255;255];    

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
            
            r=reflected_color(O,L0,S0,C0,radius0,obj_color0,C1,radius1,obj_color1,0);
            
            color= Blinn_Phong_shading(obj_color0, light_color, S0,C0,O,L0,1,md,ms*0.8,sk,La);
            color=color+ Blinn_Phong_shading(obj_color0, light_color, S0,C0,O,L1,0.5,md,0.6,30,0);
            
            if sum(r)==0
                I(row,col,1:3)=color;
            else
                I(row,col,1:3)=0.75*color + 0.25*r;
            end
                
        elseif delta1>=0           
            
            r=reflected_color(O,L0,S1,C1,radius1,obj_color1,C0,radius0,obj_color0,0); 
            
            color=Blinn_Phong_shading(obj_color1 ,light_color ,S1,C1,O,L0,1,md*0.5,ms*0.6,sk,La);
            color=color+ Blinn_Phong_shading(obj_color1, light_color, S1,C1,O,L1,0.4,md*0.9,0.4,18,0);
            
            if sum(r)==0
                I(row,col,1:3)=color;
            else
                I(row,col,1:3)=0.94*color + 0.2*r;
            end             
        
        elseif delta2>=0
            
            [d0,~]=ray_intersection_sphere(S2,L0,C0,radius0);
            [d1,~]=ray_intersection_sphere(S2,L1,C0,radius0);
            [d2,~]=ray_intersection_sphere(S2,L0,C1,radius1);
            [d3,~]=ray_intersection_sphere(S2,L1,C1,radius1);
            if d0>=0
                I(row,col,1:3)=0.6*obj_color2;
            elseif d1>=0
                I(row,col,1:3)=0.8*obj_color2;
            elseif d2>=0
                I(row,col,1:3)=0.6*obj_color2;
            elseif d3>=0
                I(row,col,1:3)=0.8*obj_color2;
            else
                I(row,col,1:3)=obj_color2;
            end
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
%imwrite(I,'balls_shadow3.png');
fprintf("%d x %d \n",size(I,2),size(I,1));
clear


