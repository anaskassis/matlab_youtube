net = googlenet;

inputsize = net.Layers(1).InputSize;

images = dir('images\*.jpg');

for i=1:length(images)
    imageLocation = [images(i).folder '\' images(i).name];
    I = imread(imageLocation);
    I = imresize(I,inputsize(1:2));
    [label, score ] = classify(net,I);
    
    newName = string(label) + i+".jpg";
    newImagelocation = images(i).folder+"\"+newName;
    movefile(imageLocation,newImagelocation)
    
    
end


