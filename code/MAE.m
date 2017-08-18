function mae = MAE(a, b)
%MAE Mean Absolute Error
%   Full-reference Image Assessment
a = double(a);
b = double(b);
c = abs(a-b);
mae = mean(mean(c));

end

