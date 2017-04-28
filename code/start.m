img1 = imread('body.jpg');
imwrite(img1, 'new.jpg', 'quality', 25);    %Image compression
img2 = imread('new.jpg');
imshow(img1), figure, imshow(img2);

k = imfinfo('body.jpg');
j = imfinfo('new.jpg');
img2Bytes = j.Width*j.Height*j.BitDepth/8;
disp(img2Bytes);
compressed_bytes = k.FileSize;
disp(compressed_bytes);
disp(img2Bytes/compressed_bytes);

[m, n, o] = size(img1);
disp(m);
disp(n);
disp(o);
disp(size(img1));

whos img;

a = input('Input an number: ');
disp('The number you input is: ');
disp(a);
fprintf('Oh! %d\n', a);