// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.data.BatteryVariableUpdater;
import miui.app.screenelement.data.DateTimeVariableUpdater;
import miui.app.screenelement.data.VariableBinder;
import miui.app.screenelement.data.VariableBinderManager;
import miui.app.screenelement.data.VariableUpdaterManager;
import miui.app.screenelement.elements.ButtonScreenElement;
import miui.app.screenelement.elements.ElementGroup;
import miui.app.screenelement.elements.FramerateController;
import miui.app.screenelement.elements.ScreenElement;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.Task;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement:
//            InteractiveListener, ScreenContext, ScreenElementLoadException, ExternalCommandManager, 
//            ResourceManager, SoundManager, LanguageHelper, RendererController

public class ScreenElementRoot extends ScreenElement
    implements InteractiveListener {

    public ScreenElementRoot(ScreenContext screencontext) {
        super(null, screencontext, null);
        DEFAULT_FRAME_RATE = 30F;
        mNormalFrameRate = DEFAULT_FRAME_RATE;
        mFramerateControllers = new ArrayList();
        super.mRoot = this;
        mVariableUpdaterManager = new VariableUpdaterManager(screencontext);
        mTouchX = new IndexedNumberVariable("touch_x", getContext().mVariables);
        mTouchY = new IndexedNumberVariable("touch_y", getContext().mVariables);
        mTouchBeginX = new IndexedNumberVariable("touch_begin_x", getContext().mVariables);
        mTouchBeginY = new IndexedNumberVariable("touch_begin_y", getContext().mVariables);
        mTouchBeginTime = new IndexedNumberVariable("touch_begin_time", getContext().mVariables);
        mNeedDisallowInterceptTouchEventVar = new IndexedNumberVariable("intercept_sys_touch", getContext().mVariables);
    }

    private void processUseVariableUpdater(Element element) {
        String s = element.getAttribute("useVariableUpdater");
        if(TextUtils.isEmpty(s)) {
            onAddVariableUpdater(mVariableUpdaterManager);
        } else {
            String as[] = s.split(",");
            int i = as.length;
            int j = 0;
            while(j < i)  {
                String s1 = as[j];
                if(s1.equals("DateTime"))
                    mVariableUpdaterManager.add(new DateTimeVariableUpdater(mVariableUpdaterManager));
                else
                if(s1.equals("Battery"))
                    mVariableUpdaterManager.add(new BatteryVariableUpdater(mVariableUpdaterManager));
                j++;
            }
        }
    }

    private void resolveResource(Element element, int i) {
        String s = element.getAttribute("extraResourcesScreenWidth");
        if(TextUtils.isEmpty(s)) goto _L2; else goto _L1
_L1:
        String as[];
        int j;
        int k;
        int l;
        int i1;
        as = s.split(",");
        j = 0x7fffffff;
        k = 0;
        l = as.length;
        i1 = 0;
_L8:
        if(i1 >= l) goto _L4; else goto _L3
_L3:
        String s1 = as[i1];
        int j1;
        int k1;
        j1 = Integer.parseInt(s1);
        k1 = Math.abs(i - j1);
        if(k1 >= j) goto _L6; else goto _L5
_L5:
        j = k1;
        k = j1;
        if(k1 != 0) goto _L6; else goto _L4
_L4:
        if(Math.abs(i - mDefaultScreenWidth) >= j)
            super.mContext.setExtraResource(k);
_L2:
        return;
        NumberFormatException numberformatexception;
        numberformatexception;
_L6:
        i1++;
        if(true) goto _L8; else goto _L7
_L7:
    }

    public void addFramerateController(FramerateController frameratecontroller) {
        mFramerateControllers.add(frameratecontroller);
    }

    protected ElementGroup createElementGroup(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        return new ElementGroup(element, screencontext, this);
    }

    public FramerateTokenList.FramerateToken createFramerateToken(String s) {
        return super.mContext.createToken(s);
    }

    public void doRender(Canvas canvas) {
        if(mElementGroup != null)
            mElementGroup.doRender(canvas);
        mFrames = 1 + mFrames;
        doneRender();
    }

    public void doneRender() {
        super.mContext.doneRender();
    }

    public VariableBinder findBinder(String s) {
        VariableBinder variablebinder;
        if(mVariableBinderManager != null)
            variablebinder = mVariableBinderManager.findBinder(s);
        else
            variablebinder = null;
        return variablebinder;
    }

    public ScreenElement findElement(String s) {
        if(!"__root".equals(s)) {
            ScreenElement screenelement;
            if(mElementGroup != null)
                screenelement = mElementGroup.findElement(s);
            else
                screenelement = null;
            this = screenelement;
        }
        return this;
    }

    public Task findTask(String s) {
        return null;
    }

    /**
     * @deprecated Method finish is deprecated
     */

    public void finish() {
        this;
        JVM INSTR monitorenter ;
        boolean flag = mFinished;
        if(!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if(mElementGroup != null) {
            mElementGroup.finish();
            mElementGroup = null;
        }
        if(mVariableBinderManager != null) {
            mVariableBinderManager.finish();
            mVariableBinderManager = null;
        }
        if(mExternalCommandManager != null) {
            mExternalCommandManager.finish();
            mExternalCommandManager = null;
        }
        if(mVariableUpdaterManager != null) {
            mVariableUpdaterManager.finish();
            mVariableUpdaterManager = null;
        }
        super.mContext.mResourceManager.clear();
        if(mSoundManager != null) {
            mSoundManager.release();
            mSoundManager = null;
        }
        mFinished = true;
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public ScreenContext getContext() {
        return super.mContext;
    }

    public int getDefaultScreenWidth() {
        return mDefaultScreenWidth;
    }

    public int getResourceDensity() {
        return mDefaultResourceDensity;
    }

    public float getScale() {
        float f;
        if(mScale == 0.0F) {
            Log.w("ScreenElementRoot", "scale not initialized!");
            f = 1.0F;
        } else {
            f = mScale;
        }
        return f;
    }

    public int getTargetDensity() {
        return mTargetDensity;
    }

    public void haptic(int i) {
    }

    public void init() {
        super.init();
        if(mVariableUpdaterManager != null)
            mVariableUpdaterManager.init();
        if(mVariableBinderManager != null)
            mVariableBinderManager.init();
        if(mExternalCommandManager != null)
            mExternalCommandManager.init();
        if(mElementGroup != null)
            mElementGroup.init();
        reset();
        requestFramerate(mFrameRate);
    }

    public boolean load() {
        Element element = super.mContext.mResourceManager.getManifestRoot();
        if(element != null) goto _L2; else goto _L1
_L1:
        boolean flag = false;
          goto _L3
_L2:
        int i;
        LanguageHelper.load(super.mContext.mContext.getResources().getConfiguration().locale, super.mContext.mResourceManager, super.mContext.mVariables);
        mNormalFrameRate = Utils.getAttrAsFloat(element, "frameRate", DEFAULT_FRAME_RATE);
        mFrameRate = mNormalFrameRate;
        i = Utils.getAttrAsInt(element, "screenWidth", 0);
        Element element1;
        Display display;
        int j;
        int k;
        int l;
        int i1;
        int j1;
        if(i <= 0)
            i = 480;
        mDefaultScreenWidth = i;
        mDefaultResourceDensity = (240 * mDefaultScreenWidth) / 480;
        super.mContext.setResourceDensity(mDefaultResourceDensity);
        mElementGroup = createElementGroup(element, super.mContext);
        mVariableBinderManager = new VariableBinderManager(Utils.getChild(element, "VariableBinders"), super.mContext);
        element1 = Utils.getChild(element, "ExternalCommands");
        if(element1 != null)
            mExternalCommandManager = new ExternalCommandManager(element1, super.mContext, this);
        display = ((WindowManager)super.mContext.mContext.getSystemService("window")).getDefaultDisplay();
        j = display.getWidth();
        k = display.getHeight();
        l = display.getRotation();
        Exception exception;
        ScreenElementLoadException screenelementloadexception;
        boolean flag1;
        if(l == 1 || l == 3)
            flag1 = true;
        else
            flag1 = false;
        break MISSING_BLOCK_LABEL_488;
_L5:
        if(mTargetDensity == 0) {
            mScale = (float)i1 / (float)mDefaultScreenWidth;
            mTargetDensity = Math.round((float)mDefaultResourceDensity * mScale);
        } else {
            mScale = (float)mTargetDensity / (float)mDefaultResourceDensity;
        }
        Log.i("ScreenElementRoot", (new StringBuilder()).append("init target density: ").append(mTargetDensity).toString());
        super.mContext.setTargetDensity(mTargetDensity);
        Utils.putVariableNumber("raw_screen_width", super.mContext.mVariables, Double.valueOf(i1));
        Utils.putVariableNumber("raw_screen_height", super.mContext.mVariables, Double.valueOf(j1));
        Utils.putVariableNumber("screen_width", super.mContext.mVariables, Double.valueOf((float)i1 / mScale));
        Utils.putVariableNumber("screen_height", super.mContext.mVariables, Double.valueOf((float)j1 / mScale));
        resolveResource(element, i1);
        processUseVariableUpdater(element);
        flag = onLoad(element);
          goto _L3
        screenelementloadexception;
        screenelementloadexception.printStackTrace();
_L4:
        flag = false;
        break; /* Loop/switch isn't completed */
        exception;
        exception.printStackTrace();
        if(true) goto _L4; else goto _L3
_L3:
        return flag;
        if(flag1)
            i1 = k;
        else
            i1 = j;
        if(flag1)
            j1 = j;
        else
            j1 = k;
          goto _L5
    }

    public boolean needDisallowInterceptTouchEvent() {
        return mNeedDisallowInterceptTouchEvent;
    }

    protected void onAddVariableUpdater(VariableUpdaterManager variableupdatermanager) {
        variableupdatermanager.add(new DateTimeVariableUpdater(variableupdatermanager));
    }

    public void onButtonInteractive(ButtonScreenElement buttonscreenelement, miui.app.screenelement.elements.ButtonScreenElement.ButtonAction buttonaction) {
    }

    public void onCommand(String s) {
        if(mExternalCommandManager == null)
            break MISSING_BLOCK_LABEL_15;
        mExternalCommandManager.onCommand(s);
_L1:
        return;
        Exception exception;
        exception;
        Log.e("ScreenElementRoot", exception.toString());
        exception.printStackTrace();
          goto _L1
    }

    protected boolean onLoad(Element element) {
        return true;
    }

    public boolean onTouch(MotionEvent motionevent) {
        boolean flag = false;
        if(mElementGroup != null) goto _L2; else goto _L1
_L1:
        return flag;
_L2:
        float f;
        float f1;
        f = descale(motionevent.getX());
        f1 = descale(motionevent.getY());
        mTouchX.set(f);
        mTouchY.set(f1);
        switch(motionevent.getActionMasked()) {
        case 2: // '\002'
        default:
            break;

        case 0: // '\0'
            break; /* Loop/switch isn't completed */

        case 1: // '\001'
            break;
        }
        break MISSING_BLOCK_LABEL_134;
_L4:
        flag = mElementGroup.onTouch(motionevent);
        requestUpdate();
        if(true) goto _L1; else goto _L3
_L3:
        mTouchBeginX.set(f);
        mTouchBeginY.set(f1);
        mTouchBeginTime.set(System.currentTimeMillis());
        mNeedDisallowInterceptTouchEvent = false;
          goto _L4
        mNeedDisallowInterceptTouchEvent = false;
          goto _L4
    }

    public void pause() {
        super.pause();
        if(mElementGroup != null)
            mElementGroup.pause();
        if(mVariableBinderManager != null)
            mVariableBinderManager.pause();
        if(mExternalCommandManager != null)
            mExternalCommandManager.pause();
        if(mVariableUpdaterManager != null)
            mVariableUpdaterManager.pause();
    }

    public void playSound(String s) {
        if(!TextUtils.isEmpty(s) && shouldPlaySound()) {
            if(mSoundManager == null)
                mSoundManager = new SoundManager(super.mContext.mContext, super.mContext.mResourceManager);
            mSoundManager.playSound(s, true);
        }
    }

    public void reset(long l) {
        super.reset(l);
        if(mElementGroup != null)
            mElementGroup.reset(l);
    }

    public void resume() {
        super.resume();
        if(mElementGroup != null)
            mElementGroup.resume();
        if(mVariableBinderManager != null)
            mVariableBinderManager.resume();
        if(mExternalCommandManager != null)
            mExternalCommandManager.resume();
        if(mVariableUpdaterManager != null)
            mVariableUpdaterManager.resume();
        requestUpdate();
    }

    public void setDefaultFramerate(float f) {
        DEFAULT_FRAME_RATE = f;
    }

    public void setRenderController(RendererController renderercontroller) {
        super.mContext.setRenderController(renderercontroller);
    }

    public void setTargetDensity(int i) {
        mTargetDensity = i;
        super.mContext.setTargetDensity(i);
    }

    protected boolean shouldPlaySound() {
        return true;
    }

    public boolean shouldUpdate() {
        return super.mContext.shouldUpdate();
    }

    public void tick(long l) {
        mVariableUpdaterManager.tick(l);
        if(mElementGroup != null)
            mElementGroup.tick(l);
        Double double1 = mNeedDisallowInterceptTouchEventVar.get();
        if(double1 != null) {
            boolean flag;
            if(double1.doubleValue() > 0.0D)
                flag = true;
            else
                flag = false;
            mNeedDisallowInterceptTouchEvent = flag;
        }
    }

    public void updateFramerate(long l) {
        for(Iterator iterator = mFramerateControllers.iterator(); iterator.hasNext(); ((FramerateController)iterator.next()).updateFramerate(l));
        if(mFrameRateVar == null) {
            mFrameRateVar = new IndexedNumberVariable("frame_rate", super.mContext.mVariables);
            mCheckPoint = 0L;
        }
        if(mCheckPoint != 0L) goto _L2; else goto _L1
_L1:
        mCheckPoint = l;
_L4:
        return;
_L2:
        long l1 = l - mCheckPoint;
        if(l1 >= 1000L) {
            long l2 = (long)(1000 * mFrames) / l1;
            mFrameRateVar.set(l2);
            mFrames = 0;
            mCheckPoint = l;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private static final boolean CALCULATE_FRAME_RATE = true;
    private static final int DEFAULT_SCREEN_WIDTH = 480;
    private static final String LOG_TAG = "ScreenElementRoot";
    private static final int RES_DENSITY = 240;
    private static final String ROOT_NAME = "__root";
    private float DEFAULT_FRAME_RATE;
    private long mCheckPoint;
    private int mDefaultResourceDensity;
    private int mDefaultScreenWidth;
    protected ElementGroup mElementGroup;
    private ExternalCommandManager mExternalCommandManager;
    private boolean mFinished;
    protected float mFrameRate;
    private IndexedNumberVariable mFrameRateVar;
    private ArrayList mFramerateControllers;
    private int mFrames;
    private boolean mNeedDisallowInterceptTouchEvent;
    private IndexedNumberVariable mNeedDisallowInterceptTouchEventVar;
    protected float mNormalFrameRate;
    private float mScale;
    private SoundManager mSoundManager;
    private int mTargetDensity;
    private IndexedNumberVariable mTouchBeginTime;
    private IndexedNumberVariable mTouchBeginX;
    private IndexedNumberVariable mTouchBeginY;
    private IndexedNumberVariable mTouchX;
    private IndexedNumberVariable mTouchY;
    protected VariableBinderManager mVariableBinderManager;
    private VariableUpdaterManager mVariableUpdaterManager;
}
