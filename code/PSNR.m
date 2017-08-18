function psnr = PSNR(a, b, bits)
%PSNR Peak Signal-to-noise Ratio
%   Full-reference Image Assessment

mse = MSE(a, b);
L = power(2, bits)-1;
psnr = 10*log10(L*L/mse);

end

