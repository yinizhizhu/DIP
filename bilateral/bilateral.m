function bilateral(imageFileName,sigma_d,sigma_r)

%   Usage: V = bilateral(U,SIGMA_D,SIGMA_R);
%   MYBILATERAL performs bilateral filtering on monochrome images. Both the
%   domain and range filters are gaussian filters. (Can be extended to
%   color images by filtering color channels separately).
%       imageFileName: the fileName of inputting image
%       SIGMA_D: Std. deviation of domain filter (in pixels).
%                (Sub-pixel values quantized to even fractions, i.e. in
%                steps of 0.2)
%       SIGMA_R: Std. deviation of range filter. Value between 0 and 1.
%               (Relative to colorspace range which is normalized to 0 - 1)

U = imread(imageFileName);

subplot(1,2,1);
imshow(U);

U = im2double(U);   % Normalize image range to 0 - 1
[y,x] = size(U);
V = zeros(y,x); % Initialize output;

% Initialize domain filter kernel
d_filter = gausswin(5*sigma_d);  % see "doc gausswin" for details
filtlength = length(d_filter);   % filter length determined by domain
if filtlength == 0
    return;
end
d_filter = d_filter*d_filter';  % 2D filter

% Initialize range filter
if sigma_r == 0
    sigma_r = eps;
end
mu_r = U;       % Extract means for range filter
U = padarray(U, floor(filtlength/2)*[1,1]);    % zero-padding for filtering
k = zeros(size(V));     % Initialize normalizing factor

% Filter using sliding window and accumulate.
% (More efficient than px by px)
for a = 1:filtlength
    for b = 1:filtlength
        win = U(a:a+y-1,b:b+x-1);    % Sliding window
        r_coeffs = exp(-((win-mu_r).^2)./(2*sigma_r^2));  % Range filter coefficients
        d_coeff = d_filter(a,b);    % Domain filter coefficient
        V = V + d_coeff*r_coeffs.*win;  % Accumulate
        k = k + d_coeff*r_coeffs;
    end
end

V = V./k;   % Normalize filter to zero gain

subplot(1,2,2);
imshow(V);
imwrite(V, horzcat('new',imageFileName), 'jpg');

end
