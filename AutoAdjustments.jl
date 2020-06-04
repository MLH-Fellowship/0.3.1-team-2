module AutoAdjustments
export autoAdjustments()

using ImageCore

function map_contrast_to_brightness():
    img_n0f16_raw = rawview(img_n0f8)
    img = float.(img_n016_raw)  
#= assigning an image to a matrix object for now. I will be using
high and low contrast values later. =#

#= Compute the laplacian of the gray scale of the image. obtain
the max value using minMacLoc. call it maxval. Estimate your 
sharpness/brightness index as - (maxval * average V channel values)
/ (average of the hist values from 0th channel), as said above. This
would give certain values. Low bright images are usually below 30. 
30 - 50 can b taken as ok images. and above 50 as bright images.=#

    t = size(img)
    rows = t[0]
    columns = t[1]
    h = call_the_channels_function/(rows*columns)
    v = call_the_Channels_function/(rows*columns)

    alow = dark
    ahigh = bright

    brightness = (ahigh * v)/h
    return brightness
    end


end

