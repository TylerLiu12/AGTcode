function U = U_calculation(value_vector,bid_vector,v1,v2,w1)
if value_vector(1)==1
    if size(bid_vector,1)==1
        if w1<=(v1+v2)/2
            U=1-v2;
        elseif w1<=(v1+1)/2
            U=1-2*w1+v1;
        else
            U=0;
        end
    else
        x=bid_vector(1,2);
        y=bid_vector(2,2);
        if v1<=y && w1<=(y+v1)/2
            U=1-2*v1;
        elseif v1<=y  && w1<=(x+v1)/2
            U=1-2*w1+y-v1;
        elseif v1<=y && w1<=(x+y)/2
            U=1-4*w1+y+1;
        elseif y<v1 && v2<=y && w1<=(y+v1)/2
            U=1-y;
        elseif y<v2 && v2<=x && w1<=(v1+v2)/2
            U=1-v2;
        elseif v2<=x && (v1+max([v2,y]))/2<w1 && w1<=(v1+x)/2
            U=1-2*w1+v1;
        else
            U=0;
        end
        
    end
    
    
    
else
    theta=value_vector(2);
    if size(bid_vector,1)==1
        if v1<=min([1,2*theta]) && v1+v2<=2*theta && w1<=(v1+v2)/2
            U=2*theta-v1-v2;
        elseif v1<=min([1,2*theta]) && v1+v2<=2*theta && w1<=theta
            U=2*theta-2*w1;
        else
            U=0;
        end
        
    else
        x=bid_vector(1,2);
        y=bid_vector(2,2);
        if v1<=y && w1<=(y+v1)/2
            U=2*theta-2*v1;
        elseif v1<=y && w1<=(1+v1)/2
            U=2*theta-2*w1+y-v1;
        elseif v1<=y && w1<=(1+y)/2
            U=2*theta-4*w1+y+1;
        elseif v2<=y && y<v1 && w1<=(y+v1)/2
            U=-y;
        elseif y<v2 && w1<=(v1+v2)/2
            U=-v2;
        elseif y<v2 && (v1+max([v2,y]))/2<w1 && w1<=(v1+1)/2
            U=-2*w1+v1;
        else
            U=0;
        end
        
        
    end
    
    
    
    
end



end
