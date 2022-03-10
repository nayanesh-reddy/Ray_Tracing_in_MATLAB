
I=uint8(zeros(1000,1000,3));

p1=[100,900]; p2=[900,800]; p3=[500,200];

I=line_draw('DDA',I,p1,p2,[255;0;0],[0;255;0]);
I=line_draw('DDA',I,p2,p3,[0;255;0],[0;0;255]);
I=line_draw('DDA',I,p3,p1,[0;0;255],[255;0;0]);


for i=1:size(I,1)
    c=0;
    for j=1:size(I,2)
        if I(i,j,:)==[0;0;0]
            continue;
        else
            if c==0
                c=c+1;
                J=j;
            else
                d=j-J;
                s=0;
                for col=J:j
                    I(i,col,:)=((d-s)/d).*I(i,J,:)+(s/d).*I(i,j,:);
                    s=s+1;
                end
                break;
            end
        end
    end

end
imshow(I,'initialmagnification','fit')
clc
