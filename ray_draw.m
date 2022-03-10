function I=ray_draw(I,initial_pos,final_pos,color1,color2)

x1=initial_pos(1); y1=initial_pos(2); 
x2=final_pos(1); y2=final_pos(2);

dx=x2-x1;dy=y2-y1;
if abs(dx)>abs(dy)
    step=abs(dx);
else
    step=abs(dy);
end

xinc=dx/step; yinc=dy/step;
c=0;
for i=1:step
    
    if I(size(I,1)-round(y1),round(x1),:)~=0 && c==1
        break;
    end
    I(size(I,1)-round(y1),round(x1),:)=((step-i)/step)*color1+(i/step)*color2;
    x1=x1+xinc;
    y1=y1+yinc;
    
    if c==0
        c=c+1;
    end
end
end