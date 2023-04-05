function knobslider(axeshandle,handles,varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Knob style slider
% This function was developed by Seonghee Cho., shcho89@postech.ac.kr (2018-03-26)
% 

% This function was designed for make knob style slider on MATLAB GUI
% application. User can use their own image for slider. To use this
% function, axes object is required.
% 
% 
% Copyright (c) 2018, Bio optics and acoustics lab, POSTECH
% All rights reserved.
% Last revision data 2018-03-26
% 
%%% How to use %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Syntax
%knobslider(axeshandle, GUIhandle, 'Property',Value)

% Description
% Examples of using all variables are provided in GUI_slider.m and
% figureslider.m. The following explains the use of variables.
% 
% axeshandle is handle name of axes object you want to use as a slide.
% GUI handle is input variable for GUIDE handle struct variable.
% If you want to use figure object only without GUIDE, just insert 0 or
% other dummy value.
% 
% knobslider have 6 properties. 
% 1. value, 2. knobratio, 3. callback, 4. direction, 5.slotimg, 6. knobimg 
% 1. value
% 'value' is a property that defines the position of the knob in the slider.
% The default value is 0. The 'value' is determined between 0 and 1.
% You can use this property to initialize the knob position or set
% the knob position to the desired position. An example of initializing or
% setting a specific position of the knob position is provided in GUI_slider.m.
% See Opening GUI Functions and Button Callback Functions in Example Code.

% 2. knobratio
% The knob ratio defines the aspect ratio of the knob image. The ratio is
% determined by 'sliderlength dimension / slider width dimension'.
% The example is provided in GUI_slider.m.

% 3. callback
% A custom function is required for the input. You can define the slider's
% response when you click the knob or move the knob. The required variables
% of the callback function are value and handle. For example, you can write
% as follows.
% Function (value, handles)
% 	Contents what you want
% End
% The value is determined by the knob position. (0 -1) handle is the handle
% input used in the initialization step.
% 4. direction
% This property determines the orientation of the slider. You can use 'H' for
% the horizontal slider and 'V' for the vertical slider. The default value is 'H'.
% 5. slotimg, knobimg
% You can use these properties to customize the slider using a custom image
% These properties must use the file name string. Only PNG images are allowed
% The default values are 'slot.png' and 'knob.png'.
% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Revision note.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



knobratio=1;
value=0;
dir='H';
slotname = 'slot.png';
knobname='knob.png';
    function defaltcallback(i,handles)
    end
slidecallback=@defaltcallback;
    for i=1:nargin-3
       if ischar(varargin{i})
           switch lower(varargin{i})
               case 'value'
                    value=varargin{i+1};
                    if value>1
                        value=1;
                    elseif value<0
                        value=0;
                    end
               case 'knobratio'
                   knobratio=varargin{i+1};
               case 'callback'
                   slidecallback=varargin{i+1};
               case 'direction'
                   dir=varargin{i+1};
               case 'slotimg'
                   slotname=varargin{i+1};
               case 'knobimg'
                   knobname=varargin{i+1};
           end
           i = i + 1;
       end
    end
set(axeshandle,'NextPlot','replace');
Boxratio=get(axeshandle,'PlotBoxAspectRatio');

axes(axeshandle)
[slideslot.img, slideslot.map, slideslot.alpha]=imread(slotname);
[doticon.img, doticon.map, doticon.alpha]=imread(knobname);

if dir=='H'
    dotdim=Boxratio(2);
    spacelength=Boxratio(1);
    imgslot=image([knobratio*dotdim/2 spacelength-knobratio*dotdim/2],[dotdim*0.35 dotdim*0.65], slideslot.img,'ButtonDownFcn',{@slotcallback});
    set(axeshandle,'NextPlot','add');
    axis off
    axis ([0 Boxratio(1) 0 Boxratio(2)])
    set(imgslot,'AlphaData',slideslot.alpha);    
    dotm=image([value*(spacelength-knobratio*dotdim) value*(spacelength-knobratio*dotdim)+knobratio*dotdim],[ 0 dotdim],doticon.img,'ButtonDownFcn',{@dotcallback});
    set(dotm,'AlphaData',doticon.alpha);
end
if dir=='V'
    dotdim=Boxratio(1);
    spacelength=Boxratio(2);
    imgslot=image([dotdim*0.35 dotdim*0.65],[knobratio*dotdim/2 spacelength-knobratio*dotdim/2], imrotate(slideslot.img,90),'ButtonDownFcn',{@slotcallback});
    set(axeshandle,'NextPlot','add');
    axis off
    axis ([0 Boxratio(1) 0 Boxratio(2)])
    set(imgslot,'AlphaData',imrotate(slideslot.alpha,90));    
    dotm=image([0 dotdim],[ value*(spacelength-knobratio*dotdim) value*(spacelength-knobratio*dotdim)+knobratio*dotdim],doticon.img,'ButtonDownFcn',{@dotcallback});
    set(dotm,'AlphaData',doticon.alpha);
end

oldmotionfunction = get(gcf,'WindowButtonMotionFcn');
oldbuttonupfunction = get(gcf,'WindowButtonUpFcn');
org=0;
Pos_old=0;
    function dotcallback(src, event)
    org=get(axeshandle,'CurrentPoint');
    if dir=='H'
            Pos_old =get(dotm,'XData');
    end
    if dir=='V'
            Pos_old =get(dotm,'YData');
    end
    set(gcf,'WindowButtonMotionFcn',@motion0)
    set(gcf,'WindowButtonUpFcn',@buttonup)
    if dir=='H'
        slidecallback(Pos_old(1)/(spacelength-knobratio*dotdim),handles)
    end
    if dir=='V'
        slidecallback(Pos_old(1)/(spacelength-knobratio*dotdim),handles)
    end
    end

    function slotcallback(src, event)
     a=get(axeshandle,'CurrentPoint');     
        if dir=='H'
            Pos_new =  [a(1,1)-knobratio*dotdim/2 a(1,1)+knobratio*dotdim/2];
        end
        if dir=='V'
           Pos_new =  [a(1,2)-knobratio*dotdim/2 a(1,2)+knobratio*dotdim/2];
        end        
        if Pos_new(1)<0
            Pos_new = [0, knobratio*dotdim];    
        end
        if Pos_new(2)>spacelength
            Pos_new = [spacelength-knobratio*dotdim, spacelength];
        end
        if dir=='H'
            set(dotm,'XData',Pos_new)
        end
        if dir=='V'
            set(dotm,'YData',Pos_new)
        end        
        slidecallback(Pos_new(1)/(spacelength-knobratio*dotdim),handles)        
        set(gcf,'WindowButtonMotionFcn',@motion1) 
        set(gcf,'WindowButtonUpFcn',@buttonup)
    end

    function motion0(src,callbackdata)
        a=get(axeshandle,'CurrentPoint');
        d=a-org;
        if dir=='H'
            Pos_new = Pos_old+[d(1,1) d(1,1)];
        end
        if dir=='V'
            Pos_new = Pos_old+[d(1,2) d(1,2)];
        end        
        if Pos_new(1)<0
            Pos_new = [0, knobratio*dotdim];    
        end
        if Pos_new(2)>spacelength
            Pos_new = [spacelength-knobratio*dotdim, spacelength];
        end
        if dir=='H'
            set(dotm,'XData',Pos_new)
        end
        if dir=='V'
            set(dotm,'YData',Pos_new)
        end
        
        slidecallback(Pos_new(1)/(spacelength-knobratio*dotdim),handles)
    end

    function motion1(src,callbackdata)
        a=get(axeshandle,'CurrentPoint');
        if dir=='H'
            Pos_new =  [a(1,1)-knobratio*dotdim/2 a(1,1)+knobratio*dotdim/2];
        end
        if dir=='V'
           Pos_new =  [a(1,2)-knobratio*dotdim/2 a(1,2)+knobratio*dotdim/2];
        end       
        
       if Pos_new(1)<0
            Pos_new = [0, knobratio*dotdim];    
        end
        if Pos_new(2)>spacelength
            Pos_new = [spacelength-knobratio*dotdim, spacelength];
        end
        if dir=='H'
            set(dotm,'XData',Pos_new)
        end
        if dir=='V'
            set(dotm,'YData',Pos_new)
        end        
        slidecallback(Pos_new(1)/(spacelength-knobratio*dotdim),handles)
    end

    function buttonup(src,callbackdata)        
        set(gcf,'WindowButtonMotionFcn',oldmotionfunction)
        set(gcf,'WindowButtonUpFcn',oldbuttonupfunction)
    end

end


