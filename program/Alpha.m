%R=xor(shares(:,:,1),shares(:,:,2));
%R=xor(R,shares(:,:,3));
%R=xor(R,shares(:,:,4));
%R=xor(R,shares(:,:,5));
%R=xor(R,shares(:,:,6));
%R=xor(R,shares(:,:,7));
%R=shares(:,:,7);

for g=2:n

    R=shares(:,:,1);
    for h=2:g
        R=xor(R,shares(:,:,h));
    end
    sum=0;
    white_right=0;
    black_error=0;
    white=0;
    black=0;
    for i=1:300
        for j=1:300
            if R(i,j)==image(i,j)
                sum=sum+1;
            end
            if (image(i,j)==0) && (R(i,j)==0)
                white_right=white_right+1;
            elseif (image(i,j)==1) && (R(i,j)==0)
                black_error=black_error+1;
            end
            if image(i,j)==0
                white=white+1;
            elseif image(i,j)==1
                black=black+1;
            end
        end
    end

    name="("+n+","+k+")";
    A=sum/(300*300);
    white_right=white_right/white;
    black_error=black_error/black;
    B=((white_right)-(black_error))/(1+(black_error));
    %figure('Name',name),imshow(~R)
    %title("正確率: "+A+" 對比度"+B);
    name="out//xor"+g+".bmp";
    imwrite(~R,name);

end


for g=2:n

    R=shares(:,:,1);
    for h=2:g
        R=or(R,shares(:,:,h));
    end
    sum=0;
    white_right=0;
    black_error=0;
    white=0;
    black=0;
    for i=1:300
        for j=1:300
            if R(i,j)==image(i,j)
                sum=sum+1;
            end
            if (image(i,j)==0) && (R(i,j)==0)
                white_right=white_right+1;
            elseif (image(i,j)==1) && (R(i,j)==0)
                black_error=black_error+1;
            end
            if image(i,j)==0
                white=white+1;
            elseif image(i,j)==1
                black=black+1;
            end
        end
    end

    name="("+n+","+k+")";
    A=sum/(300*300);
    white_right=white_right/white;
    black_error=black_error/black;
    B=((white_right)-(black_error))/(1+(black_error));
    %figure('Name',name),imshow(~R)
    %title("對比度"+B);
    name="out//or"+g+".bmp";
    imwrite(~R,name);
    

end

