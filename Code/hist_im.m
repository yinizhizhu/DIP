im=imread('bmp\00009.bmp');
if size(im,3)>1 
im=rgb2gray(im);
end
hist_=imhist(im); 
bar(hist_);