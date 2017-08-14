f = zeros(16,16);
step = 1;
for i=1:1:16
    for j=1:1:16
        f(i, j) = step;
        step = step+1;
    end
end
subplot(1,3,1);
imshow(uint8(f));

w = zeros(3, 3);
step = 1;
res = 0;
for i=1:1:3
    for j=1:1:3
        w(i, j) = step;
        res = res + step;
        step = step+1;
    end
end
w = w/res;

g = f;
for i=1:1:16
    for j=1:1:16
        tmp = 0;
        for s = -1:1:1
            for t = -1:1:1
                if i+s > 0 && i+s < 17
                    if j+t > 0 && j+t < 17
                        tmp = tmp+f(i+s, j+t)*w(s+2, t+2);
                    end
                end
            end
        end
        if tmp > 256
            g(i, j) = 255;
        else
            g(i, j) = tmp;
        end
    end
end
subplot(1,3,2);
imshow(uint8(g));

g2 = f;
for i=1:1:16
    for j=1:1:16
        tmp = 0;
        for s = -1:1:1
            for t = -1:1:1
                if i-s > 0 && i-s < 17
                    if j-t > 0 && j-t < 17
                        tmp = tmp+f(i-s, j-t)*w(s+2, t+2);
                    end
                end
            end
        end
        if tmp > 256
            g2(i, j) = 255;
        else
            g2(i, j) = tmp;
        end
    end
end
subplot(1,3,3);
imshow(uint8(g2));