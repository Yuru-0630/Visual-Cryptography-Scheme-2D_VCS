close all
image=imread("input/3.bmp");
%figure('Name',"原圖"),imshow(image);
shares=image;
for i=1:10
    shares=cat(3,shares,image);
end

image=~image;

for z=1:10
    for i=1:300
        for j=1:300
            shares(i,j,z)=randi([0,1],1,1);
        end
    end
end