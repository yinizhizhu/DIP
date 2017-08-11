%% ÃİÂÉ±ä»»
f = imread('hit.jpg');
[row, col] = size(f);
subplot(2, 4, 1);
imshow(f);
g1 = f;
for i=1:1:row
    for j=1:1:col
        g1(i, j) = floor(double(f(i, j))^0.9);
    end
end
subplot(2, 4, 2);
imshow(g1);

g2 = f;
for i=1:1:row
    for j=1:1:col
        g2(i, j) =  floor(double(f(i, j))^0.6);
    end
end
subplot(2, 4, 3);
imshow(g2);

g3 = f;
for i=1:1:row
    for j=1:1:col
        g3(i, j) =  floor(double(f(i, j))^0.4);
    end
end
subplot(2, 4, 4);
imshow(g3);

g4 = f;
for i=1:1:row
    for j=1:1:col
        s =  floor(double(f(i, j))^1.2);
        if s > 255
            s = 255;
        end
        g4(i, j) = s;
    end
end
subplot(2, 4, 5);
imshow(g4);

g5 = f;
for i=1:1:row
    for j=1:1:col
        s =  floor(double(f(i, j))^1.5);
        if s > 255
            s = 255;
        end
        g5(i, j) = s;
    end
end
subplot(2, 4, 6);
imshow(g5);

g6 = f;
for i=1:1:row
    for j=1:1:col
        s =  floor(double(f(i, j))^1.8);
        if s > 255
            s = 255;
        end
        g6(i, j) = s;
    end
end
subplot(2, 4, 7);
imshow(g6);

g7 = f;
for i=1:1:row
    for j=1:1:col
        s =  floor(double(f(i, j))^2.1);
        if s > 255
            s = 255;
        end
        g7(i, j) = s;
    end
end
subplot(2, 4, 8);
imshow(g7);