function mse = MSE(a, b)
%MSE Mean Squard Error
%   Full-reference Image Assessemnt

a = double(a);
b = double(b);
c = (a-b).^2;
mse = mean(mean(c));

end

