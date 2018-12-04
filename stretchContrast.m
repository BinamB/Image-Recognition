function [ output ] = stretchContrast( image )
    image = double(image);
    image = image - min(min(image));
    image = image / max(max(image));
    image = image * 255;
    output = uint8(image);
end

