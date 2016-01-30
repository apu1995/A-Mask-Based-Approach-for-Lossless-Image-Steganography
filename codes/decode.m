function m_pix=decode(m_pix,k)
      for i=5:-1:1
         mim_bin=dec2bin(m_pix,8);              
         for z=1:i
           temp=mim_bin(1);
                for x=1:7
                 mim_bin(x)=mim_bin(x+1);               
                end
            mim_bin(8)= temp;
         end
         m_pix = uint8(bin2dec(mim_bin));
         m_pix= bitxor(m_pix,k);
     end
        
end       
  