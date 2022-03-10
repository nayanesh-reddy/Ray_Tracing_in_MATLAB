function r=reflected_color(O,L0,S0,C0,radius0,obj_color0,C1,radius1,obj_color1,n)
[R,~]=reflected_ray(O, S0, C0, L0);
[d2,x,y,z]=ray_intersection_sphere(S0,R,C1,radius1);
if d2>=0
    r= obj_color1;
else
    r=[0;0;0];
end
if n==0
    return;
elseif n<0
    r=[0;0;0];
else
r=r+0.8*n*reflected_color(O,R,[x,y,z],C1,radius1,obj_color1,C0,radius0,obj_color0,n-1);
end
end