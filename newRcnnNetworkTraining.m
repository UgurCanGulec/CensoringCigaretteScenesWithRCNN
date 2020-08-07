load('sigaraRcnnTrainingAg3','sigara','layers');
options = trainingOptions('sgdm', ...%onceki kullanýlan algoritma sgdm dir.
  'MiniBatchSize', 8, ...%normal deger 32,10'dan onceki deðer 8
  'InitialLearnRate', 1e-6, ...%1e-6 onceki deðer
  'MaxEpochs', 6);%normal epoch deger 10

%Aðý Eðitme

rcnn = trainRCNNObjectDetector(sigara, layers, options, 'NegativeOverlapRange', [0 0.3]);