function w = getW(a)
%getW(a), calculate the Generating Kernel 'w'
%   w - the Generating Kernel
%   weight - the basic weighting function
%   a - the parameter which is basic value for computing

w = zeros(5);
weight = [0.25-a/4, 0.25, a, 0.25, 0.25-a/4];
for i=1:1:5
    for j=1:1:5
        w(i, j) = weight(i)*weight(j);
    end
end

end

