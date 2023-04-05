function figureslider()
    figure,
    h0=axes;
    h1=axes;
    h2=axes;
    h3=axes;
    set(h0,'Position',[0.1 0.1 0.8 0.05])
    set(h1,'Position',[0.1 0.2 0.8 0.05])
    set(h2,'Position',[0.1 0.3 0.8 0.05])

    knobslider(h0,0,'callback',@callback_B)
    knobslider(h1,0,'callback',@callback_G)
    knobslider(h2,0,'callback',@callback_R)
    color(:,:,1)=0;
    color(:,:,2)=0;
    color(:,:,3)=0;
    set(h3,'Position',[0.3 0.4 0.4 0.4])
    set(h3,'NextPlot','add')
    axes(h3)
    axis off
    img=imshow(color);

    function callback_R (i,handles)
        color(1)=i;
        set(img,'CData',color);
        drawnow
    end

function callback_G (i,handles)
        color(2)=i;
        set(img,'CData',color);
        drawnow
end

function callback_B (i,handles)
        color(3)=i;
        set(img,'CData',color);
        drawnow
    end
end