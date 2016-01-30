function m_pix=encode(m_pix,k) 
    for i=1:5              
         m_pix= bitxor(m_pix,k);
         mim_bin=dec2bin(m_pix,8);    
         for z=1:i
           temp=mim_bin(8);
                for x=8:-1:2
                 mim_bin(x)=mim_bin(x-1);               
                end
            mim_bin(1)= temp;
         end
         m_pix = uint8(bin2dec(mim_bin));
     end
end       
  