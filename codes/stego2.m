mimg=imread(input(' Enter the message image : '));
cimg=imread(input(' Enter the cover image : '));
comp=cimg;
figure;imshow(mimg);
figure;imshow(cimg);
[mc nc t1]=size(cimg);
[mm nm t2]=size(mimg);
encoded=uint8(zeros(mm,nm,3));
loop=0;
temp=0;
key=mm;
while(loop>=0)
    for i=1:3
        for j=1:mm
            for k=1:nm
                encoded(j,k,i)=xor(key,mimg(j,k,i));
            end
        end
        for j=1:mm
            for k=1:nm
                encode=dec2bin(encoded(j,k,i),8);
                temp=encode(1);
                encode(1)=encode(2);
                encode(2)=encode(3);
                encode(3)=encode(4);
                encode(4)=encode(5);
                encode(5)=encode(6);
                encode(6)=encode(7);
                encode(7)=encode(8);
                encode(8)=temp;
                encoded(j,k,i)=bin2dec(encode);
            end
        end
    end
    loop=loop-1;
end

for k=1:3
    for i=1:mm
        for j=1:nm
            
            stre=dec2bin(encoded(i,j,k),8);
            
            str1=dec2bin(cimg(2*i-1,2*j-1,k),8);
            str2=dec2bin(cimg(2*i-1,2*j,k),8);
            str3=dec2bin(cimg(2*i-1,2*j+1,k),8);
            str4=dec2bin(cimg(2*i,2*j-1,k),8);
            str5=dec2bin(cimg(2*i,2*j+1,k),8);
            str6=dec2bin(cimg(2*i+1,2*j-1,k),8);
            str7=dec2bin(cimg(2*i+1,2*j,k),8);
            str8=dec2bin(cimg(2*i+1,2*j+1,k),8);
            
            str1(8)=stre(1);
            str2(8)=stre(2);
            str3(8)=stre(3);
            str4(8)=stre(4);
            str5(8)=stre(5);
            str6(8)=stre(6);
            str7(8)=stre(7);
            str8(8)=stre(8);
            
            cimg(2*i-1,2*j-1,k)=bin2dec(str1);
            cimg(2*i-1,2*j,k)=bin2dec(str2);
            cimg(2*i-1,2*j+1,k)=bin2dec(str3);
            cimg(2*i,2*j-1,k)=bin2dec(str4);
            cimg(2*i,2*j+1,k)=bin2dec(str5);
            cimg(2*i+1,2*j-1,k)=bin2dec(str6);
            cimg(2*i+1,2*j,k)=bin2dec(str7);
            cimg(2*i+1,2*j+1,k)=bin2dec(str8);
        
        end
    end
end
figure;imshow(cimg);
            
