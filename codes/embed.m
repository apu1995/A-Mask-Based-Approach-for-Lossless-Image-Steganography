function kernel=embed(kernel,m_pix)
            [m n]=size(kernel);
             mim_bin= dec2bin(m_pix,8);
             pos=0;
               for a=1:m
                   for b=1:n
                     pos=pos+1;
                     ker_pix(pos,:)= dec2bin(kernel(a,b),8);
                   end
               end
               for i=1:8
                 if m*n==9  
                   if(i<=4) 
                       ker_pix(i,8)=mim_bin(i);
                   end
                   if(i>4)
                       ker_pix(i+1,8)=mim_bin(i);
                   end
                 end
                 if m*n==4
                    if rem(i,2)==1 
                    ker_pix((floor(i/2)+1),8)=mim_bin(i);
                    else
                    ker_pix((i/2),7)=mim_bin(i);
                    end
                 end   
               end
               pos=0;
               for a=1:m
                   for b=1:n
                     pos=pos+1;
                       kernel(a,b)=bin2dec(ker_pix(pos,:));
                   end
               end
         m_pix=bin2dec(mim_bin);      
end