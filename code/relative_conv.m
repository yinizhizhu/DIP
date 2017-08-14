f = uint8(ans);
subplot(1,3,1);
imshow(f);
w = zeros(3, 3, 'uint8');
step = 1;
for i=1:1:3
    for j=1:1:3
        w(i, j) = step;
        step = step+1;
    end
end
w = w-5;

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
imshow(g);

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
imshow(g2);