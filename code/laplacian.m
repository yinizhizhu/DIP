function laplacian(filename)
w = zeros(3,3);
w1 = w;
w1(1,2) = 1;
w1(2,1) = 1;
w1(2,2) = -4;
w1(2,3) = 1;
w1(3,2) = 1;

w2 = w;
for i=1:1:3
    for j=1:1:3
        w2(i, j) = 1;
    end
end
w2(2,2) = -8;

f = imread(filename);
subplot(3,2,1);
imshow(f);
fprintf('Start...\n');

f = double(f);

deltaf1 = delta(f, w1);
g1 = f-deltaf1;
subplot(3,2,3);
imshow(uint8(deltaf1));
subplot(3,2,4);
imshow(uint8(g1));
fprintf('Try another one...\n');

deltaf2 = delta(f, w2);
g2 = f-deltaf2;
subplot(3,2,5);
imshow(uint8(deltaf2));
subplot(3,2,6);
imshow(uint8(g2));
fprintf('Done!\n');
end

function deltaf = delta(f, w)
fprintf('In function...\n');
[row, col] = size(f);
deltaf = f;
for i=2:1:row-1
    for j=2:1:col-1
        tmp=0;
        for s=-1:1:1
            for t=-1:1:1
                tmp=tmp+f(i+s,j+t)*w(s+2,t+2);
            end
        end
        deltaf(i, j) = tmp;
    end
end
fprintf('Out function\n');
end
