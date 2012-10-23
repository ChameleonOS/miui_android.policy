// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.content.Context;
import android.os.Handler;
import miui.app.screenelement.data.Variables;
import miui.app.screenelement.elements.ScreenElementFactory;

// Referenced classes of package miui.app.screenelement:
//            ResourceManager, RendererController, ResourceLoader

public class ScreenContext {

    public ScreenContext(Context context, ResourceLoader resourceloader) {
        this(context, new ResourceManager(resourceloader), new ScreenElementFactory());
    }

    public ScreenContext(Context context, ResourceLoader resourceloader, ScreenElementFactory screenelementfactory) {
        this(context, new ResourceManager(resourceloader), screenelementfactory);
    }

    public ScreenContext(Context context, ResourceManager resourcemanager) {
        this(context, resourcemanager, new ScreenElementFactory());
    }

    public ScreenContext(Context context, ResourceManager resourcemanager, ScreenElementFactory screenelementfactory) {
        mVariables = new Variables();
        mHandler = new Handler();
        mContext = context;
        mResourceManager = resourcemanager;
        mFactory = screenelementfactory;
    }

    public FramerateTokenList.FramerateToken createToken(String s) {
        FramerateTokenList.FramerateToken frameratetoken;
        if(mController == null)
            frameratetoken = null;
        else
            frameratetoken = mController.createToken(s);
        return frameratetoken;
    }

    public void doneRender() {
        if(mController != null)
            mController.doneRender();
    }

    public Context getRawContext() {
        if(mApplicationContext == null) goto _L2; else goto _L1
_L1:
        Context context = mApplicationContext;
_L4:
        return context;
_L2:
        if(!mGotApplicationContext) {
            mApplicationContext = mContext.getApplicationContext();
            mGotApplicationContext = true;
            if(mApplicationContext != null) {
                context = mApplicationContext;
                continue; /* Loop/switch isn't completed */
            }
        }
        context = mContext;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public RendererController getRenderController() {
        return mController;
    }

    public void requestUpdate() {
        if(mController != null)
            mController.requestUpdate();
    }

    public void setExtraResource(int i) {
        mResourceManager.setExtraResource(i);
    }

    public void setRenderController(RendererController renderercontroller) {
        mController = renderercontroller;
    }

    public void setResourceDensity(int i) {
        mResourceManager.setResourceDensity(i);
    }

    public void setTargetDensity(int i) {
        mResourceManager.setTargetDensity(i);
    }

    public boolean shouldUpdate() {
        boolean flag;
        if(mController != null)
            flag = mController.shouldUpdate();
        else
            flag = false;
        return flag;
    }

    public static final String MAML_PREFERENCES = "MamlPreferences";
    private Context mApplicationContext;
    public final Context mContext;
    private RendererController mController;
    public final ScreenElementFactory mFactory;
    private boolean mGotApplicationContext;
    public Handler mHandler;
    public final ResourceManager mResourceManager;
    public Variables mVariables;
}
