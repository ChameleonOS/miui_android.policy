// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import miui.app.screenelement.*;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ImageScreenElement, TimepanelScreenElement, ImageNumberScreenElement, TextScreenElement, 
//            DateTimeScreenElement, ButtonScreenElement, MusicControlScreenElement, ElementGroup, 
//            VariableElement, VariableArrayElement, SpectrumVisualizerScreenElement, AdvancedSlider, 
//            FramerateController, VirtualScreen, ScreenElement

public class ScreenElementFactory {

    public ScreenElementFactory() {
    }

    public ScreenElement createInstance(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        String s = element.getTagName();
        Object obj;
        if(s.equalsIgnoreCase("Image"))
            obj = new ImageScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("Time"))
            obj = new TimepanelScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("ImageNumber"))
            obj = new ImageNumberScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("Text"))
            obj = new TextScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("DateTime"))
            obj = new DateTimeScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("Button"))
            obj = new ButtonScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("MusicControl"))
            obj = new MusicControlScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("ElementGroup") || s.equalsIgnoreCase("Group"))
            obj = new ElementGroup(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("Var"))
            obj = new VariableElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("VarArray"))
            obj = new VariableArrayElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("SpectrumVisualizer"))
            obj = new SpectrumVisualizerScreenElement(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("Slider"))
            obj = new AdvancedSlider(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("FramerateController"))
            obj = new FramerateController(element, screencontext, screenelementroot);
        else
        if(s.equalsIgnoreCase("VirtualScreen"))
            obj = new VirtualScreen(element, screencontext, screenelementroot);
        else
            obj = null;
        return ((ScreenElement) (obj));
    }
}
