video=VideoWriter('sansurlenmisVideo.avi');
videoObj=VideoReader('C:\Users\Lenovo\Desktop\lecigaratte.mp4');
open(video);
condition=true;
for img=1:videoObj.NumFrames

     filename=strcat('frame',num2str(img),'.jpg');
    b=read(videoObj,img);
    b=imresize(b,[340 365]);
    while(condition)
          %Tahmin Ýþlemi
    [bbox, score, label] = detect(rcnn, b, 'MiniBatchSize', 32);
    [score, idx] = max(score);
    bbox = bbox(idx, :);
    %annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
    annotation = sprintf('%s: (Confidence = %f)');
    detectedImg = insertObjectAnnotation(b, 'rectangle', bbox, annotation);
      if(isempty(bbox))
          %imwrite(b,filename);
          writeVideo(video,b);
            break;
      end
        Q=detectedImg;
        a=bbox2points(bbox);
        [boy,en,kanal]=size(Q);
        if(a(1)==0)
            a(1)=1;
        end
        if(a(2)==0)
            a(2)=1;
        end
        if(a(3)==0)
            a(3)=1;
        end
        if(a(4)==0)
            a(4)=1;
        end
        if(a(5)==0)
            a(5)=1;
        end
        if(a(6)==0)
            a(6)=1;
        end
        if(a(7)==0)
            a(7)=1;
        end
        if(a(8)==0)
            a(8)=1;
        end
        
        if(a(1)<0)
            a(1)=-a(1);
        end
         if(a(2)<0)
            a(2)=-a(2);
         end
         if(a(3)<0)
            a(3)=-a(3);
         end
         if(a(4)<0)
            a(4)=-a(4);
         end
         if(a(5)<0)
            a(5)=-a(5);
         end
         if(a(6)<0)
            a(6)=-a(6);
         end
         if(a(7)<0)
            a(7)=-a(7);
         end
         if(a(8)<0)
            a(8)=-a(8);
        end
        if(a(1)>en)
            a(1)=en;
        end
        if(a(2)>en)
            a(2)=en;
        end
        if(a(3)>en)
            a(3)=en;
        end
        if(a(4)>en)
            a(4)=en;
        end
        if(a(5)>boy)
            a(5)=boy;
        end
        if(a(6)>boy)
            a(6)=boy;
        end
        if(a(7)>boy)
            a(7)=boy;
        end
        if(a(8)>boy)
            a(8)=boy;
        end
        
        partOfImage=Q(a(5):a(7),a(1):a(2),:);
        partOfImage=im2double(partOfImage);
        windowSize=15;
        avg3=ones(windowSize)/windowSize^2;
        blurredImage=imfilter(partOfImage,avg3,'conv');
        Q(a(5):a(7),a(1):a(2),:)=blurredImage*90;
       %imwrite(Q,filename);
       writeVideo(video,Q);
       break;
    end
    
end
close(video);




