// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import java.util.ArrayList;
import miui.app.screenelement.*;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement

public class FramerateController extends ScreenElement {
    public static class ControlPoint {

        public int mFramerate;
        public long mTime;

        public ControlPoint(Element element) throws ScreenElementLoadException {
            mTime = Utils.getAttrAsLongThrows(element, "time");
            mFramerate = Utils.getAttrAsInt(element, "frameRate", -1);
        }
    }


    public FramerateController(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mControlPoints = new ArrayList();
        mLock = new Object();
        super.mRoot.addFramerateController(this);
        mLoop = Boolean.parseBoolean(element.getAttribute("loop"));
        NodeList nodelist = element.getElementsByTagName("ControlPoint");
        for(int i = 0; i < nodelist.getLength(); i++) {
            Element element1 = (Element)nodelist.item(i);
            mControlPoints.add(new ControlPoint(element1));
        }

        mTimeRange = ((ControlPoint)mControlPoints.get(-1 + mControlPoints.size())).mTime;
    }

    protected void onVisibilityChange(boolean flag) {
        super.onVisibilityChange(flag);
        if(!flag) {
            mCurFramerate = getFramerate();
            requestFramerate(0.0F);
        } else {
            requestFramerate(mCurFramerate);
        }
    }

    public void render(Canvas canvas) {
    }

    public void reset() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mStartTime = super.mContext.getRenderController().getLastUpdateTime();
        mStopped = false;
        return;
    }

    public void updateFramerate(long l) {
        if(isVisible()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if(!mStopped) goto _L3; else goto _L1
_L3:
        break MISSING_BLOCK_LABEL_34;
        Exception exception;
        exception;
        throw exception;
        long l1 = l - mStartTime;
        if(!mLoop) goto _L5; else goto _L4
_L4:
        long l2 = l1 % mTimeRange;
_L6:
        int i = -1 + mControlPoints.size();
_L7:
        if(i >= 0) {
            ControlPoint controlpoint = (ControlPoint)mControlPoints.get(i);
            if(l2 < controlpoint.mTime)
                break MISSING_BLOCK_LABEL_149;
            requestFramerate(controlpoint.mFramerate);
            if(!mLoop && i == -1 + mControlPoints.size())
                mStopped = true;
        }
        obj;
        JVM INSTR monitorexit ;
          goto _L1
_L5:
        l2 = l1;
          goto _L6
        i--;
          goto _L7
    }

    public static final String INNER_TAG = "ControlPoint";
    public static final String TAG_NAME = "FramerateController";
    private ArrayList mControlPoints;
    private float mCurFramerate;
    private Object mLock;
    private boolean mLoop;
    private long mStartTime;
    private boolean mStopped;
    private long mTimeRange;
}
