function psnr_Value = PSNR(A,B)
% PSNR (Peak Signal to noise ratio)

if (size(A) ~= size(B))
   error('The size of the 2 matrix are unequal')

   psnr_Value = NaN;
   return; 
elseif (A == B)
   disp('Images are identical: PSNR has infinite value')

   psnr_Value = Inf;
   return;   
else

    maxValue = double(max(A(:)));

    % Calculate MSE, mean square error.
    mseImage = (double(A) - double(B)) .^ 2;
    [rows columns] = size(A);
    
    mse = sum(mseImage(:)) / (rows * columns);

    % Calculate PSNR (Peak Signal to noise ratio)
    psnr_Value = 10 * log10( 256^2 / mse);
end


end % function END

%{
function [SNR,MSE]=PSNR(u0,u)

[ny,nx]=size(u0);
A=max(max(u0(:)),max(u(:)));
dif=u0(:)-u(:);

MSE=mean(dif.^2);

SNR=10*log(A*A/MSE)/log(10);
%}