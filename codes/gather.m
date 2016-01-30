%gathering the encoded message value
function m_pix=gather(kernel)
  [m n]=size(kernel);
  pos=0;
  ker_pix=dec2bin(zeros(9,1),8);
  mim_bin=dec2bin(zeros(1),8);
  
   for a=1:m
      for b=1:n
          pos=pos+1;
          ker_pix(pos,:)= dec2bin(kernel(a,b),8);
      end
   end
   for i=1:8
      if m*n==9
       if(i<=4) 
           mim_bin(i)=ker_pix(i,8);
       end
       if(i>4)
           mim_bin(i)=ker_pix(i+1,8);
       end 
      end
     if m*n==4
        if rem(i,2)==1 
         mim_bin(i)=ker_pix((floor(i/2)+1),8);
        else 
         mim_bin(i)=ker_pix((i/2),7);
        end 
     end            
  end
       m_pix=uint8(bin2dec(mim_bin));
end      
  