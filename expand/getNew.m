function new = getNew( fileIn, w )
%GETNEW(fileIn, w), return 'new' for the result of compression
%   fileIn - the filename inputed
%   w - the Generating Kernel

judgeZ = 0.001;
judgeI = 0.3;
I = imread(fileIn);
subplot(1,2,1);
imshow(I); 
[row, col] = size(I);
rowR = 2*row+4;
colL = 2*col+4;
new = zeros(row, col, 'uint8');
disp 'I am trying...'
for i=1:1:rowR
    for j=1:1:colL
        tmp = 0;
        for m=-2:1:2
            for n=-2:1:2
                tmpI = (i-m)/2;
                tmpJ = (j-n)/2;
                if abs(tmpI - floor(tmpI)) < judgeZ && abs(tmpJ - floor(tmpJ)) < judgeZ
                    if tmpI > judgeI && tmpI <= row
                        if  tmpJ > judgeI && tmpJ <= col
                            tmp = tmp + w(m+3, n+3)*I(tmpI, tmpJ);
                        end
                    end
                end
            end
        end
        new(i, j) = 4*tmp;
    end
end
disp 'Done!!!'
disp '0.0'

end

