load('sigaraRcnnTrainingAg3','sigara','layers');
options = trainingOptions('sgdm', ...%onceki kullan�lan algoritma sgdm dir.
  'MiniBatchSize', 8, ...%normal deger 32,10'dan onceki de�er 8
  'InitialLearnRate', 1e-6, ...%1e-6 onceki de�er
  'MaxEpochs', 6);%normal epoch deger 10

%A�� E�itme

rcnn = trainRCNNObjectDetector(sigara, layers, options, 'NegativeOverlapRange', [0 0.3]);