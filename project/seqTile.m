classdef seqTile < matlab.ui.componentcontainer.ComponentContainer
    properties
        color 
    end
    properties (Access = private, Transient, NonCopyable) 
        Button matlab.ui.control.Button 
    end
    events (HasCallbackProperty, NotifyAccess = protected)
        colorChanged
    end 
    methods (Access = protected) 
        function setup(comp) 
            comp.Button = uibutton('Text',' ', ... 
                'ButtonPushedFcn',@(o,e) comp.getColorFromUser());            
        end 
        function update(comp)     
            % Update edit field and button colors 
            set([comp.Button],'BackgroundColor',comp.color)         
        end 
    end
    methods (Access = private) 
        function getColorFromUser(comp) 
            % Update the Value property 
            comp.color = [0 0 1];              

            % Execute user callbacks and listeners
            notify(comp,'colorChanged'); 
        end         
    end 
end