f=fft2(double(im));
f=fftshift(f);
filter=ones(size(im));
filter(256/2-50:256/2+50,256/2-50:256/2+50)=0;
f= f.*filter;
f=ifftshift(f);
im2=uint8(ifft(abs(f)));
imshow(im2);                  
