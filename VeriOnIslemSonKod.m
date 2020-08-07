global sayac;
global artanDeger;
sayac=1;
artanDeger=1;
dosya_uzantisi='.jpg';
goruntu_klasoru=('C:\Users\Lenovo\Desktop\SigaraTestResimleri\');
goruntu_klasoru_icerigi=dir([goruntu_klasoru,'*',dosya_uzantisi]);
dosya_sayisi=size(goruntu_klasoru_icerigi,1);
  blockSizeR = 365; %Sat�rlar�n blok boyutu
  blockSizeC = 340; %S�tunlar�n blok boyutu
for k=1:dosya_sayisi 
    dosya_adi=[goruntu_klasoru,goruntu_klasoru_icerigi(k,1).name];
    rgbImage = imread(dosya_adi);
    %Resmin boyutlar�n� ve katmanlar�n� elde et.
    [rows columns numberOfColorBands] = size(rgbImage);
    %=======================================Bolme Islemi=========================================
    % G�r�nt�y� bloklara b�lmek i�in mat2cell() fonksyionu kullan�lm��t�r.
    if(rows>365&&columns>340)
    %Her sat�r�n ka� blok olaca�� hesaplan�r.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
% Her s�tunun ka� blok olaca�� hesaplan�r.
wholeBlockCols = floor(columns / blockSizeC);



blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];

% ca ad�nda bir cell array olu�turulur. 
% Bu sat�r g�r�nt�n�n bloklara ayr�ld��� k�s�md�r.
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
