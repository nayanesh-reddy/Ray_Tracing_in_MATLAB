function [R,N,L,V,H]=reflected_ray(origin, surface_points, centre, Light_position)

x0=origin(1); y0=origin(2); z0=origin(3);
x=surface_points(1); y=surface_points(2); z=surface_points(3);
xc=centre(1); yc=centre(2); zc=centre(3);
xL=Light_position(1); yL=Light_position(2); zL=Light_position(3);

N=2*[x-xc; y-yc; z-zc]; N=N/norm(N);
L=-[x-xL; y-yL; z-zL]; L=L/norm(L);
V=[x-x0; y-y0; z-z0]; V=V/norm(V);
H=-(L+V); H=H/norm(H);
R=(L-2*dot(L,N).*N) -([x, y, z]+ 0.01.*N); R=R/norm(R);
%R=L*(-dot(L,N)+sqrt(1-dot(L,N)^2)); R=R-[x,y,z]; R=R/norm(R);
end