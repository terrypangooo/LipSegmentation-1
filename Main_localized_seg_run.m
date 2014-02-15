close all;
clear all;
filename = input('Enter the name of the image:-->');         %load the image
I1=imread(filename);
I=(I1);
m = false(size(I,1),size(I,2));   %create initial mask
x1=input('Enter the value of X1:-->');
x2=input('Enter the value of X2:-->');
y1=input('Enter the value of Y1:-->');
y2=input('Enter the value of Y2:-->');
IT=input('Enter the value of maximum iterations:-->');

for i=y1 : y2
    for j=x1 : x2
        
         m(i,j) = true;
    end
end

I = imresize(I,.5);  %-- make image smaller 
m = imresize(m,.5);  %   for fast computation

subplot(2,2,1); imshow(I1); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');
I4 = im2graydouble(I); 

seg = localized_seg1(I, m,IT);  %-- run segmentation
seg=~seg;

seg=imsubtract(seg,I4);

subplot(2,2,4); imshow(seg); title('Final Segmentation');




