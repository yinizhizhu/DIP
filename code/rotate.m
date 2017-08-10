function rotate()

[T, f] = initial();
[row, col] = size(f);
subplot(2, 2, 1);
imshow(f);

centerX = floor(row/2);
centerY = floor(col/2);

g = zeros(row, col);
g = g-1;
whos g;
for i=1:1:row
    for j=1:1:col
        [m ,n] = getP(T, i, j, centerX, centerY);
        pixel = getV(f, row, col, m, n);
        if pixel >= 0
            g(i, j) = pixel;
        end
    end
end
for i=1:1:row
    for j=1:1:col
        if g(i, j) < 0
%             give the pixel with the nearest pixel
        end
    end
end
subplot(2, 2, 2);
imshow(g);

h = zeros(row, col);
h = h-1;
whos h
for i=1:1:row
    for j=1:1:col
        [m ,n] = getP(T, i, j, centerX, centerY);
        k = 0;
        total = 0;
        [pixel, step] = getV(f, row, col, m, n);
        k = k+step;
        total = total+pixel;
        [pixel, step] = getV(f, row, col, m-1, n);
        k = k+step;
        total = total+pixel;
        [pixel, step] = getV(f, row, col, m+1, n);
        k = k+step;
        total = total+pixel;
        [pixel, step] = getV(f, row, col, m, n-1);
        k = k+step;
        total = total+pixel;
        [pixel, step] = getV(f, row, col, m, n+1);
        k = k+step;
        if k > 0
            total = total+pixel;
            h(i, j) = floor(total/k);
        end
    end
end
subplot(2, 2, 3);
imshow(h);
disp Done!!

end

function [T, f] = initial()
T = zeros(3, 3);
theta = pi/6;
T(1, 1) = cos(theta);
T(2, 2) = cos(theta);
T(1, 2) = sin(theta);
T(2, 1) = -sin(theta);
T(3, 3) = 1;
T = T^-1;
f = 255-imread('hit.jpg');
end

function [m, n] = getP(T, i, j, centerX, centerY)
a = [i-centerX j-centerY 1]*T;
m = floor(a(1))+centerX;
n = floor(a(2))+centerY;
end

function pixel = getV(f, row, col, m, n)
pixel = -1;
if m > 0 && m <= row
    if n > 0 && n <= col
        pixel = f(m, n);
    end
end
end