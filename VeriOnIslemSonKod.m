global sayac;
global artanDeger;
sayac=1;
artanDeger=1;
dosya_uzantisi='.jpg';
goruntu_klasoru=('C:\Users\Lenovo\Desktop\SigaraTestResimleri\');
goruntu_klasoru_icerigi=dir([goruntu_klasoru,'*',dosya_uzantisi]);
dosya_sayisi=size(goruntu_klasoru_icerigi,1);
  blockSizeR = 365; %Satýrlarýn blok boyutu
  blockSizeC = 340; %Sütunlarýn blok boyutu
for k=1:dosya_sayisi 
    dosya_adi=[goruntu_klasoru,goruntu_klasoru_icerigi(k,1).name];
    rgbImage = imread(dosya_adi);
    %Resmin boyutlarýný ve katmanlarýný elde et.
    [rows columns numberOfColorBands] = size(rgbImage);
    %=======================================Bolme Islemi=========================================
    % Görüntüyü bloklara bölmek için mat2cell() fonksyionu kullanýlmýþtýr.
    if(rows>365&&columns>340)
    %Her satýrýn kaç blok olacaðý hesaplanýr.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
% Her sütunun kaç blok olacaðý hesaplanýr.
wholeBlockCols = floor(columns / blockSizeC);



blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];

% ca adýnda bir cell array oluþturulur. 
% Bu satýr görüntünün bloklara ayrýldýðý kýsýmdýr.
if numberOfColorBands > 1
    %Renkli bir resim ise;
    ca = mat2cell(rgbImage, blockVectorR, blockVectorC, numberOfColorBands);
else
    ca = mat2cell(rgbImage, blockVectorR, blockVectorC); %Renksiz bir resim ise
end
 
[cellrow,cellcolumn]=size(ca);
forsize=cellrow*cellcolumn;

for i=1:forsize
    if(~isempty(ca{i}))
        parcaliresim=ca{i};
        Yazdir(parcaliresim,sayac,artanDeger);
    end
end
       
    
    end
  
end
