function ms=mse(a,b)
ms=a-b; 
ms=sqrt((ms(:)' * ms(:)) / length(ms(:)) );

end