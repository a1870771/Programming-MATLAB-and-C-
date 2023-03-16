function varargout = GUI_Slider(varargin)
% GUI_SLIDER MATLAB code for GUI_Slider.fig
%      GUI_SLIDER, by itself, creates a new GUI_SLIDER or raises the existing
%      singleton*.
%
%      H = GUI_SLIDER returns the handle to a new GUI_SLIDER or the handle to
%      the existing singleton*.
%
%      GUI_SLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SLIDER.M with the given input arguments.
%
%      GUI_SLIDER('Property','Value',...) creates a new GUI_SLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Slider

% Last Modified by GUIDE v2.5 26-Mar-2018 16:50:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Slider_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Slider_OutputFcn, ...
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


% --- Executes just before GUI_Slider is made visible.
function GUI_Slider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Slider (see VARARGIN)

% Choose default command line output for GUI_Slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


knobslider(handles.axes1,handles,'callback',@slidercallback1,'value',0)
knobslider(handles.axes2,handles,'direction','H','callback',@slidercallback2,'value',0.5)
knobslider(handles.axes3,handles,'knobratio',2,'knobimg','knob_V.png','direction','V','callback',@slidercallback3,'value',0.5)
knobslider(handles.axes4,handles,'knobratio',2,'knobimg','knob_H.png','callback',@slidercallback4,'value',0.5)



axes(handles.axes5)
set(handles.axes5,'NextPlot','add');
set(handles.axes5,'xlim',[-50 50]);
set(handles.axes5,'ylim',[-5 5]);
grid on
data.x=linspace(-50,50,1024);
data.A=0;
data.B=0;
data.a=0;
data.b=0;
data.y=plot(data.x,data.A*exp(data.B*(data.x-data.a)).*sin(data.x-data.a)+data.b);
setappdata(handles.figure1,'data',data);
set(handles.A,'String',data.A)
set(handles.B,'String',data.B)
set(handles.aa,'String',data.a)
set(handles.bb,'String',data.b)
% UIWAIT makes GUI_Slider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Slider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function slidercallback1(i,handles)
data=getappdata(handles.figure1,'data');
data.A=i*3;
set(data.y,'YData',data.A*exp(data.B*(data.x-data.a)).*sin(data.x-data.a)+data.b);
setappdata(handles.figure1,'data',data);
 set(handles.A,'String',data.A)

function slidercallback2(i,handles)
data=getappdata(handles.figure1,'data');
data.B=0.1*(i-0.5);
set(data.y,'YData',data.A*exp(data.B*(data.x-data.a)).*sin(data.x-data.a)+data.b);
setappdata(handles.figure1,'data',data);
 set(handles.B,'String',data.B)

function slidercallback3(i,handles)
data=getappdata(handles.figure1,'data');
data.b=-5*2*(i-0.5);
set(data.y,'YData',data.A*exp(data.B*(data.x-data.a)).*sin(data.x-data.a)+data.b);
setappdata(handles.figure1,'data',data);
 set(handles.bb,'String',data.b)

 
function slidercallback4(i,handles)
data=getappdata(handles.figure1,'data');
data.a=50*2*(i-0.5);
set(data.y,'YData',data.A*exp(data.B*(data.x-data.a)).*sin(data.x-data.a)+data.b);
setappdata(handles.figure1,'data',data);
 set(handles.aa,'String',data.a)
 


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=str2double(get(handles.A,'String'))/3;
knobslider(handles.axes1,handles,'callback',@slidercallback1,'value',i)
slidercallback1(i,handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=str2double(get(handles.B,'String'))*10+0.5;
knobslider(handles.axes2,handles,'direction','H','callback',@slidercallback2,'value',i)
slidercallback2(i,handles)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=str2double(get(handles.bb,'String'))/10+0.5;
knobslider(handles.axes3,handles,'knobratio',2,'knobimg','knob_V.png','direction','V','callback',@slidercallback3,'value',i)
slidercallback3(i,handles)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=str2double(get(handles.aa,'String'))/100+0.5;
knobslider(handles.axes4,handles,'knobratio',2,'knobimg','knob_H.png','callback',@slidercallback4,'value',i)
slidercallback4(i,handles)
