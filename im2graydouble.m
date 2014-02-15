function img = im2graydouble(img)    
  [dimy, dimx, c] = size(img);
  if(isfloat(img))
    if(c==3) 
      img = rgb2gray(uint8(img)); 
    end
  else           
    if(c==3) 
      img = rgb2gray(img); 
    end
    img = double(img);
  end