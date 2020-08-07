%Tahmin Yapma
%--------------------------------------------------------------------------
%*******************************************************************
%Eðitilen Aðý yükleyeceðiz.
%load(sigaraRcnnTrainingResult);
img = imread('C:\Users\Lenovo\Desktop\newMatlabTez\SigaraTestResimleri\peaky15.jpg'); 
img=imresize(img,[340,365]);
%*******************************************************************
[bbox, score, label] = detect(fastRcnn, img, 'MiniBatchSize', 32);

[score, idx] = max(score);

bbox = bbox(idx, :);
annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
%annotation = sprintf('%s: (Confidence = %f)');

detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, annotation);

figure
imshow(detectedImg)
%--------------------------------------------------------------------------
