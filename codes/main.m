clear all
cim= imread(input('enter cover image'));
cim2=cim;
mim= imread(input('enter message image'));
mim2=mim;
[mc nc kc]=size(cim);
[mm nm km]=size(mim);
%encryption process
for k=1:km
   mim(:,:,k)=arnold(mim(:,:,k),1); 
    for i=1:mm
        for j=1:nm  
           mim(i,j,k)=encode(mim(i,j,k),mm);
        end
    end
end
kernel= zeros(3,3,'uint8');
for k=1:kc
   a=1;
    for i=1:3:(mc-2)
      b=1;  
        for j=1:3:(nc-2)
            kernel = cim(i:i+2,j:j+2,k);
            if((a<=mm)&&(b<=nm))
             kernel=embed(kernel,mim(a,b,k));
            end 
            cim(i:i+2,j:j+2,k)=kernel;
            b=b+1; 
        end
      a=a+1;  
    end   
end
psnr_cim = PSNR(cim,cim2)


%decryption process
kernel= zeros(3,3,'uint8');


for k=1:kc
   a=1;
    for i=1:3:(mc-2)
      b=1;  
        for j=1:3:(nc-2)
            kernel = cim(i:i+2,j:j+2,k);
            if((a<=mm)&&(b<=nm))
             mim(a,b,k)=gather(kernel);
            end 
            b=b+1; 
        end
      a=a+1;  
    end
end
for k=1:km
    for i=1:mm
        for j=1:nm
           mim(i,j,k)=decode(mim(i,j,k),mm);
        end    
    end 
  mim(:,:,k)=in_arnold(mim(:,:,k),1);  
end
figure;imshow(mim);
psnr_mim = PSNR(mim,mim2)