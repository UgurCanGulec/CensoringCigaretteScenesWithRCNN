options = trainingOptions('sgdm', ...
  'MiniBatchSize', 16, ...
  'InitialLearnRate', 1e-6, ...
  'MaxEpochs', 6);

%A�� E�itme

rcnn = trainRCNNObjectDetector(sigara, layers, options, 'NegativeOverlapRange', [0 0.3]);
%Tahmin Yapma
%--------------------------------------------------------------------------
%*******************************************************************
img = imread('C:\Users\Lenovo\Desktop\Mezuniyet Tezi D�k�manlar�\R-CNN\Par�alanm��T�mSet\9349.parca.jpg'); 
img=imresize(img,[340 365]);
%*******************************************************************
[bbox, score, label] = detect(rcnn, img, 'MiniBatchSize', 32);

[score, idx] = max(score);

bbox = bbox(idx, :);
annotation = sprintf('%s: (Confidence = %f)', label(idx), score);

detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, annotation);

figure
imshow(detectedImg)
%--------------------------------------------------------------------------
%ieee xplore









