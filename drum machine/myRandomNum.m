fig = uifigure("Position",[100 100 300 160]);
h = uihtml(fig,"Position",[50 50 200 60]);

h.HTMLSource = "generateJSRandomNumber.html";
h.HTMLEventReceivedFcn = @displayNumber;

function displayNumber(src,event)
name = event.HTMLEventName;
if strcmp(name,'ButtonClicked')
    number = event.HTMLEventData;
    disp(number);
end
end