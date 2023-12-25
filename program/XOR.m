n=4;
k=2;
r=image;
for i=1:300
    for j=1:300
        r(i,j)=0;
    end
end

%r是前k張疊起來的結果
for z=1:k
    r=xor(r,shares(:,:,z));
end

%r不等於原圖翻轉第k張
for i=1:300
    for j=1:300
        if r(i,j)~=image(i,j)
            shares(i,j,k)=~shares(i,j,k);
        end
    end
end


for i=1:300
    for j=1:300
        
        r=0;
        for z=1:n
            r=xor(r,shares(i,j,z));
        end
        if r~=image(i,j)
            t=randi([k+1,n],1,1);
            shares(i,j,t)=~shares(i,j,t);
        end
    end
end


%第三步
for i=1:300
    for j=1:300
        r=0;
        for z=1:n
            r=xor(r,shares(i,j,z));
        end
        if r~=image(i,j)
            shares(i,j,n)=~shares(i,j,n);
        end
    end
end


%打亂
for i=1:300
    for j=1:300
        for z=1:50
            p=randi([1,n],1,1);
            d=randi([1,n],1,1);
            r=shares(i,j,p);
            shares(i,j,p)=shares(i,j,d);
            shares(i,j,d)=r;
        end
    end
end


for s=1:n

    T=xor(shares(:,:,1),shares(:,:,1));
    T=xor(T,shares(:,:,s));
    imwrite(~T,"out\share"+s+".bmp");
end
