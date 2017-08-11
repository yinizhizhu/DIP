%% Ö±·½Í¼¾ùºâ
f = imread('timg.jpg');
g = f(:, :, 1:1);
[row, col] = size(g);
g = g(10:row-5, 30:col/2);

subplot(1, 2, 1);
imshow(g);

%% counter the number of each pixel
[row, col] = size(g);
buket = [1:1:256];
for i=1:1:256
    buket(i) = 0;
end
for i=1:1:row
    for j=1:1:col
        buket(g(i, j))=buket(g(i, j))+1;
    end
end

%% get the T(r)
tmp = 0;
total = row*col;
value = [1:1:256];
for i=1:1:256
    tmp = tmp+buket(i);
    value(i) = round(tmp*255/total);
end

%% mapping
s = g;
for i=1:1:row
    for j=1:1:col
        s(i, j)=value(s(i, j));
    end
end
subplot(1, 2, 2);
imshow(s);