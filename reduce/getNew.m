function new = getNew( fileIn, w )
%GETNEW 此处显示有关此函数的摘要
%   此处显示详细说明

I = imread(fileIn);
subplot(1,2,1);
imshow(I); 
[row, col] = size(I);
row = floor((row-4)/2);
col = floor((col-4)/2)
new = zeros(row, col, 'uint8');
disp 'I am trying...'
for i=1:1:row
    for j=1:1:col
        tmp = 0;
        for m=-2:1:2
            for n=-2:1:2
                tmp = tmp + w(m+3, n+3)*I(2*i+m+1, 2*j+n+1);
            end
        end
        new(i, j) = tmp;
    end
end
disp 'Done!!!'
disp '0.0'

end

