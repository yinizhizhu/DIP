function expand(fileIn, fileOut, a)
%expand the image with Laplacian Praymid operator
%   expand(fileIn, fileOut, a)
%   fileIn - the filename which is original Image
%   fileOut - the filename which stores the result of compression
%   a - the basic value for computation

%set the Generating Kernel
w = getW(a);

%get the picture
new = getNew(fileIn, w);

%Save the result
subplot(1,2,2);
imshow(new);
imwrite(new, fileOut, 'jpg');

end