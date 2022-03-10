function [delta,x,y,z]=ray_intersection_sphere(ray_origin,ray_position,centre_of_sphere,Radius)

r=Radius;
x0=ray_origin(1); x1=ray_position(1); xc=centre_of_sphere(1); 
y0=ray_origin(2); y1=ray_position(2); yc=centre_of_sphere(2);
z0=ray_origin(3); z1=ray_position(3); zc=centre_of_sphere(3);

a=(x1-x0)^2 + (y1-y0)^2 + (z1-z0)^2;
b = 2*((x1-x0)*(x0-xc) + (y1-y0)*(y0-yc) + (z1-z0)*(z0-zc));
c = xc^2 + yc^2 + zc^2 + x0^2 + y0^2 + z0^2 - ...
     2*(xc*x0 + yc*y0 + zc*z0) - r^2;
 
delta = b^2-4*a*c;
root1=(-b-sqrt(delta))/2*a;
root2=(-b+sqrt(delta))/2*a;

if root1<=root2
    x=x0+root1*(x1-x0);
    y=y0+root1*(y1-y0);
    z=z0+root1*(z1-z0);
else
    x=x0+root2*(x1-x0);
    y=y0+root2*(y1-y0);
    z=z0+root2*(z1-z0);
end
end