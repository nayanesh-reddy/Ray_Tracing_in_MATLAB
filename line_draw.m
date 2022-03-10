function I=line_draw(str,I,initial_pos,final_pos,color1,color2)

x1=initial_pos(1); y1=initial_pos(2); 
x2=final_pos(1); y2=final_pos(2);

dx=x2-x1;dy=y2-y1;

switch(str)
    case 'DDA'   
        
        if abs(dx)>abs(dy)
            step=abs(dx);
        else
            step=abs(dy);
        end

        xinc=dx/step; yinc=dy/step;

        for i=1:step
            I(size(I,1)-round(y1),round(x1),:)=((step-i)/step)*color1+(i/step)*color2;
            x1=x1+xinc;
            y1=y1+yinc;
        end
       
    case 'bresenham'
        
        [x,y]=bresenham(x1,y1,x2,y2);
        step=size(x,1);
        for i=1:step
            I(size(I,1)-round(y(i)),round(x(i)),:)=((step-i)/step)*color1+(i/step)*color2;
        end
end  
end