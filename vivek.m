close all;
clear all;
%filename = input('Enter the name of the image:-->');         %load the image
I1=imread('8.png');
I=(I1);
I4=im2graydouble(I1);
m = false(size(I,1),size(I,2));   %create initial mask
x1=60;
x2=259;
y1=68;
y2=149;
IT=10;

for i=y1 : y2
    for j=x1 : x2
        
         m(i,j) = true;
    end
end

I = imresize(I,.5);  %-- make image smaller 
m = imresize(m,.5);  %   for fast computation

subplot(2,3,1); imshow(I1); title('Input Image');
subplot(2,3,2); imshow(m); title('Initialization');
subplot(2,3,3); title('Segmentation');


seg = localized_seg1(I, m,IT);  %-- run segmentation
seg=~seg;
subplot(2,3,4); imshow(seg); title('Final Segmentation');
seg= imresize(m,2);
seg = im2double(seg);
for i=1:240
    for j=1:320
        if seg(i,j)==1;
            seg(i,j)=I4(i,j);
        end
    end
end
subplot(2,3,5); imshow(seg); title('Final Segmentation3');



