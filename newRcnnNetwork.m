%R-CNN MÝMARÝSÝ

inputLayer=imageInputLayer([224,224,3]);
filterSize=[5 5];
filterSizeiki=[3 3];
numFilters=32;
numFiltersiki=64;

middleLayers=[

convolution2dLayer(filterSize,numFiltersiki,'Padding',2,'Stride',2)
reluLayer()
averagePooling2dLayer(5,'Padding',2,'Stride',2)

convolution2dLayer(filterSizeiki,numFilters,'Padding',2)
reluLayer()
averagePooling2dLayer(5,'Padding',1)

convolution2dLayer(filterSizeiki,numFilters,'Padding',2)
reluLayer()
averagePooling2dLayer(5,'Padding',1)

];

finalLayers=[
%fullyConnectedLayer(64)
%reluLayer()
fullyConnectedLayer(2)
softmaxLayer()
classificationLayer()

];

layers=[
inputLayer
middleLayers
finalLayers
];

layers(2).Weights = 0.0001 * randn([filterSize 3 numFiltersiki]);