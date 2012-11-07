// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.*;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement.elements:
//            AnimatedScreenElement, ScreenElement, ElementGroup

public class ButtonScreenElement extends AnimatedScreenElement {
    public static final class ButtonAction extends Enum {

        public static ButtonAction valueOf(String s) {
            return (ButtonAction)Enum.valueOf(miui/app/screenelement/elements/ButtonScreenElement$ButtonAction, s);
        }

        public static ButtonAction[] values() {
            return (ButtonAction[])$VALUES.clone();
        }

        private static final ButtonAction $VALUES[];
        public static final ButtonAction Cancel;
        public static final ButtonAction Double;
        public static final ButtonAction Down;
        public static final ButtonAction Long;
        public static final ButtonAction Other;
        public static final ButtonAction Up;

        static  {
            Down = new ButtonAction("Down", 0);
            Up = new ButtonAction("Up", 1);
            Double = new ButtonAction("Double", 2);
            Long = new ButtonAction("Long", 3);
            Cancel = new ButtonAction("Cancel", 4);
            Other = new ButtonAction("Other", 5);
            ButtonAction abuttonaction[] = new ButtonAction[6];
            abuttonaction[0] = Down;
            abuttonaction[1] = Up;
            abuttonaction[2] = Double;
            abuttonaction[3] = Long;
            abuttonaction[4] = Cancel;
            abuttonaction[5] = Other;
            $VALUES = abuttonaction;
        }

        private ButtonAction(String s, int i) {
            super(s, i);
        }
    }

    public static interface ButtonActionListener {

        public abstract boolean onButtonDoubleClick(String s);

        public abstract boolean onButtonDown(String s);

        public abstract boolean onButtonLongClick(String s);

        public abstract boolean onButtonUp(String s);
    }


    public ButtonScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mTriggers = new ArrayList();
        load(element, screenelementroot);
        if(element != null)
            mListenerName = element.getAttribute("listener");
    }

    private ElementGroup getCur() {
        ElementGroup elementgroup;
        if(mPressed && mTouching && mPressedElements != null)
            elementgroup = mPressedElements;
        else
            elementgroup = mNormalElements;
        return elementgroup;
    }

    private void onCancel() {
        performAction(ButtonAction.Cancel);
    }

    private void performAction(ButtonAction buttonaction) {
        Iterator iterator = mTriggers.iterator();
        do {
            if(!iterator.hasNext())
                break;
            CommandTrigger commandtrigger = (CommandTrigger)iterator.next();
            if(commandtrigger.getAction() == buttonaction)
                commandtrigger.perform();
        } while(true);
        super.mRoot.onButtonInteractive(this, buttonaction);
    }

    public void doRender(Canvas canvas) {
        ElementGroup elementgroup = getCur();
        if(elementgroup != null)
            elementgroup.render(canvas);
    }

    public void finish() {
        if(mNormalElements != null)
            mNormalElements.finish();
        if(mPressedElements != null)
            mPressedElements.finish();
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).finish());
    }

    public void init() {
        ScreenElement screenelement;
        super.init();
        if(mNormalElements != null)
            mNormalElements.init();
        if(mPressedElements != null)
            mPressedElements.init();
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).init());
        if(mListener != null || TextUtils.isEmpty(mListenerName))
            break MISSING_BLOCK_LABEL_101;
        screenelement = super.mRoot.findElement(mListenerName);
        mListener = (ButtonActionListener)screenelement;
_L1:
        return;
        ClassCastException classcastexception;
        classcastexception;
        Log.e("ButtonScreenElement", (new StringBuilder()).append("button listener designated by the name is not actually a listener: ").append(mListenerName).toString());
          goto _L1
    }

    public void load(Element element, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("ButtonScreenElement", "node is null");
            throw new ScreenElementLoadException("node is null");
        }
        Element element1 = Utils.getChild(element, "Normal");
        if(element1 != null)
            mNormalElements = new ElementGroup(element1, super.mContext, screenelementroot);
        Element element2 = Utils.getChild(element, "Pressed");
        if(element2 != null)
            mPressedElements = new ElementGroup(element2, super.mContext, screenelementroot);
        Element element3 = Utils.getChild(element, "Triggers");
        if(element3 != null) {
            NodeList nodelist = element3.getChildNodes();
            int i = 0;
            while(i < nodelist.getLength())  {
                if(nodelist.item(i).getNodeType() == 1) {
                    Element element4 = (Element)nodelist.item(i);
                    if(element4.getNodeName().equals("Trigger"))
                        mTriggers.add(new CommandTrigger(super.mContext, element4, screenelementroot));
                }
                i++;
            }
        }
    }

    public boolean onTouch(MotionEvent motionevent) {
        if(isVisible()) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        flag = false;
        switch(motionevent.getActionMasked()) {
        case 0: // '\0'
            if(touched(f, f1)) {
                mPressed = true;
                mTouching = true;
                if(mListener != null)
                    mListener.onButtonDown(super.mName);
                performAction(ButtonAction.Down);
                if(SystemClock.uptimeMillis() - mPreviousTapUpTime <= (long)ViewConfiguration.getDoubleTapTimeout()) {
                    float f2 = f - mPreviousTapPositionX;
                    float f3 = f1 - mPreviousTapPositionY;
                    float f4 = f2 * f2 + f3 * f3;
                    int i = ViewConfiguration.get(super.mContext.mContext).getScaledDoubleTapSlop();
                    if(f4 < (float)(i * i)) {
                        if(mListener != null)
                            mListener.onButtonDoubleClick(super.mName);
                        performAction(ButtonAction.Double);
                    }
                }
                mPreviousTapPositionX = f;
                mPreviousTapPositionY = f1;
                if(mPressedElements != null)
                    mPressedElements.reset();
                flag = true;
            }
            break;

        case 2: // '\002'
            mTouching = touched(f, f1);
            flag = mTouching;
            break;

        case 1: // '\001'
            if(mPressed) {
                if(touched(f, f1)) {
                    if(mListener != null)
                        mListener.onButtonUp(super.mName);
                    performAction(ButtonAction.Up);
                    mPreviousTapUpTime = SystemClock.uptimeMillis();
                } else {
                    onCancel();
                }
                if(mNormalElements != null)
                    mNormalElements.reset();
                mPressed = false;
                mTouching = false;
                flag = true;
            }
            break;

        case 3: // '\003'
        case 4: // '\004'
            if(mNormalElements != null)
                mNormalElements.reset();
            onCancel();
            mTouching = false;
            mPressed = false;
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void pause() {
        if(mNormalElements != null)
            mNormalElements.pause();
        if(mPressedElements != null)
            mPressedElements.pause();
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).pause());
        mPressed = false;
    }

    public void reset(long l) {
        super.reset(l);
        if(mNormalElements != null)
            mNormalElements.reset(l);
        if(mPressedElements != null)
            mPressedElements.reset(l);
    }

    public void resume() {
        if(mNormalElements != null)
            mNormalElements.resume();
        if(mPressedElements != null)
            mPressedElements.resume();
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).resume());
    }

    public void setListener(ButtonActionListener buttonactionlistener) {
        mListener = buttonactionlistener;
    }

    public void showCategory(String s, boolean flag) {
        if(mNormalElements != null)
            mNormalElements.showCategory(s, flag);
        if(mPressedElements != null)
            mPressedElements.showCategory(s, flag);
    }

    public void tick(long l) {
        super.tick(l);
        if(isVisible()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        ElementGroup elementgroup = getCur();
        if(elementgroup != null)
            elementgroup.tick(l);
        if(true) goto _L1; else goto _L3
_L3:
    }

    public boolean touched(float f, float f1) {
        float f2;
        float f3;
        float f4;
        float f5;
        boolean flag;
        if(super.mParent != null)
            f2 = super.mParent.getX();
        else
            f2 = 0.0F;
        if(super.mParent != null)
            f3 = super.mParent.getY();
        else
            f3 = 0.0F;
        f4 = getX();
        f5 = getY();
        if(f >= f2 + f4 && f <= f2 + f4 + getWidth() && f1 >= f3 + f5 && f1 <= f3 + f5 + getHeight())
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static final String LOG_TAG = "ButtonScreenElement";
    public static final String TAG_NAME = "Button";
    private ButtonActionListener mListener;
    private String mListenerName;
    private ElementGroup mNormalElements;
    private boolean mPressed;
    private ElementGroup mPressedElements;
    private float mPreviousTapPositionX;
    private float mPreviousTapPositionY;
    private long mPreviousTapUpTime;
    private boolean mTouching;
    private ArrayList mTriggers;
}
