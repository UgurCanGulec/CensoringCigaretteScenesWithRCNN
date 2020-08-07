%R-CNN MÝMARÝSÝ

inputLayer=imageInputLayer([340,365,3]);
filterSize=[5 5];
numFilters=32;

middleLayers=[

convolution2dLayer(filterSize,numFilters,'Padding',2)
reluLayer()
maxPooling2dLayer(3,'Stride',2)

convolution2dLayer(filterSize,numFilters,'Padding',2)
reluLayer()
maxPooling2dLayer(3,'Stride',2)

convolution2dLayer(filterSize,numFilters*2,'Padding',2)
reluLayer()
maxPooling2dLayer(3,'Stride',2)

];

finalLayers=[
fullyConnectedLayer(64)
reluLayer()
fullyConnectedLayer(2)
softmaxLayer()
classificationLayer()

];

layers=[
inputLayer
middleLayers
finalLayers
];

layers(2).Weights = 0.0001 * randn([filterSize 3 numFilters]);













