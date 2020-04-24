net = googlenet;

inputsize = net.Layers(1).InputSize;
classNames = net.Layers(end).ClassNames;

I= imread("sampleImages\agama90.jpg");
figure, clf
imshow(I)
I = imresize(I,inputsize(1:2));
figure,clf
imshow(I)

[label,scores] = classify(net,I);

[value,idx] = sort(scores,'descend');


classNamesTop = classNames(idx(1:10));
scoresTop = scores(idx(1:10));

figure
barh(scoresTop)
xlim([0 1])
title('Top 3 Predictions')
xlabel('Probability')
yticklabels(classNamesTop)



files = dir('sampleImages\*.jpg');
for i=1:length(files)
    imageLocation  = [files(i).folder '\' files(i).name];
    I = imread(imageLocation);
    I = imresize(I,inputsize(1:2));
    [label,scores]= classify(net,I);
    %newName=label + i+ strrep(num2str(scores(classNames == label)),"0.","")+".jpg";
    
    newName=string(label) + i+ ".jpg";
    newImageLocation=files(i).folder + "\" + newName;
    
    movefile(imageLocation,newImageLocation)
    
end


net = alexnet;