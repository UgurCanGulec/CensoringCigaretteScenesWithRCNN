function varargout = BitirmeProjesiArayuz(varargin)
% BITIRMEPROJESIARAYUZ MATLAB code for BitirmeProjesiArayuz.fig
%      BITIRMEPROJESIARAYUZ, by itself, creates a new BITIRMEPROJESIARAYUZ or raises the existing
%      singleton*.
%
%      H = BITIRMEPROJESIARAYUZ returns the handle to a new BITIRMEPROJESIARAYUZ or the handle to
%      the existing singleton*.
%
%      BITIRMEPROJESIARAYUZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BITIRMEPROJESIARAYUZ.M with the given input arguments.
%
%      BITIRMEPROJESIARAYUZ('Property','Value',...) creates a new BITIRMEPROJESIARAYUZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BitirmeProjesiArayuz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BitirmeProjesiArayuz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BitirmeProjesiArayuz

% Last Modified by GUIDE v2.5 27-May-2020 00:03:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BitirmeProjesiArayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @BitirmeProjesiArayuz_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BitirmeProjesiArayuz is made visible.
function BitirmeProjesiArayuz_OpeningFcn(hObject, eventdata, handles, varargin)

    durum1=handles.radiobutton1.Value;  %RCNN 15 KATMAN Benim eðittiðim Að
durum2=handles.radiobutton2.Value; % RCNN 13 KATMAN Ýsanýn Eðittiði Að


if(durum2)
   set(handles.edit1,'String','Fast-Rcnn Seçildi.')
set(handles.edit2,'String','Hýzlý iþlem gücü,fakat düþük MiniBatch oranýna sahip aðda iþlem yapmak üzeresiniz.')
else
    set(handles.edit1,'String','Low-Rcnn Seçildi.')
set(handles.edit2,'String','Yavaþ iþlem gücü,fakat yüksek MiniBatch oranýna sahip aðda iþlem yapmak üzeresiniz.')
end
    
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BitirmeProjesiArayuz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BitirmeProjesiArayuz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global videoObj
 [dosyaAdi,dosyaYolu] = uigetfile({'*.mp4';'*.avi'});
 if dosyaAdi==0
     msgbox(sprintf('Lütfen Bir Video Seçiniz.'),'HATA','Error')
 end
videoObj=VideoReader(string(dosyaYolu)+string(dosyaAdi));
 b=read(videoObj,1);
axes(handles.axes1)
imshow(b);
 set(handles.edit4,'String',string(dosyaAdi))




function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%videoObj=VideoReader('C:\Users\Lenovo\Desktop\lecigaratte.mp4');
durum1=handles.radiobutton1.Value;  %RCNN 15 KATMAN Benim eðittiðim Að
durum2=handles.radiobutton2.Value; % RCNN 13 KATMAN Ýsanýn Eðittiði Að
global videoObj;
if(isempty(videoObj))
     msgbox(sprintf('Lütfen Bir Video Seçiniz.'),'HATA','Error')
     durum1=false;
     durum2=false;
end

if(durum2)
    h=waitbar(0,'Video sansürleniyor. Lütfen bekleyiniz...')
    video=VideoWriter('sansurlenmisVideo.avi');
    open(video);
    condition=true;
    net=evalin('base', 'fastRcnn');
    for img=1:videoObj.NumFrames
    %filename=strcat('frame',num2str(img),'.jpg');
    b=read(videoObj,img);
    %b=imresize(b,[340 365]);
    while(condition)
          %Tahmin Ýþlemi
    [bbox, score, label] = detect(net, b, 'MiniBatchSize', 32);
    [score, idx] = max(score);
    bbox = bbox(idx, :);
    %annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
    annotation = sprintf('%s: (Confidence = %f)');
    detectedImg = insertObjectAnnotation(b, 'rectangle', bbox, annotation);
    waitbar(img/videoObj.NumFrames)
      if(isempty(bbox))
          %imwrite(b,filename);
          writeVideo(video,b);
            break;
      end
       set(handles.edit5,'String','iþleniyor........')
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
else
    
    video=VideoWriter('sansurlenmisVideo.avi');
    open(video);
    condition=true;
    net2=evalin('base', 'lowRcnn');
    for img=1:videoObj.NumFrames
    %filename=strcat('frame',num2str(img),'.jpg');
    b=read(videoObj,img);
    %b=imresize(b,[340 365]);
    while(condition)
          %Tahmin Ýþlemi
    [bbox, score, label] = detect(net2, b, 'MiniBatchSize', 32);
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
    
    
    
    
end
   set(handles.edit5,'String','Sansürleme Ýþlemi Tamamlandý.')







% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
if strcmpi(get(hObject, 'String'),'Sürdür')
     set(hObject, 'String', 'Durdur');
     startTimer(hObject, handles);
 else
    set(hObject, 'String', 'Sürdür');
    stopTimer(hObject, handles);
 end
 function startTimer(hObject, handles)
 handles.timer = timer('Name','MyTimer',               ...
                       'Period',1,                    ... 
                       'StartDelay',0,                 ... 
                       'TasksToExecute',inf,           ... 
                       'ExecutionMode','fixedSpacing', ...
                       'TimerFcn',{@timerCallback,handles.figure1}); 
 guidata(hObject,handles);
 start(handles.timer);
 function stopTimer(hObject, handles)
 if isfield(handles,'timer') && ~isempty(handles.timer)
   stop(handles.timer);
   handles.timer = [];
   guidata(hObject,handles);
 end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
closereq();



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
global deger;
deger=0.5*get(hObject,'Value')-0.5;



% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
durum1=handles.radiobutton1.Value;  %RCNN 15 KATMAN Benim eðittiðim Að
durum2=handles.radiobutton2.Value; % RCNN 13 KATMAN Ýsanýn Eðittiði Að


if(durum2)
   set(handles.edit1,'String','Fast-Rcnn Seçildi.')
set(handles.edit2,'String','Hýzlý iþlem gücü,fakat düþük MiniBatch oranýna sahip aðda iþlem yapmak üzeresiniz.')
else
    set(handles.edit1,'String','Low-Rcnn Seçildi.')
set(handles.edit2,'String','Yavaþ iþlem gücü,fakat yüksek MiniBatch oranýna sahip aðda iþlem yapmak üzeresiniz.')
end
