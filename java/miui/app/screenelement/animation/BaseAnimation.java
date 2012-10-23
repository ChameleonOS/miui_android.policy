// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import miui.app.screenelement.*;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public abstract class BaseAnimation {
    public static class AnimationItem {

        public double get(int i) {
            double d = 0.0D;
            if(i >= 0 && i < mExps.length && mExps != null) goto _L2; else goto _L1
_L1:
            Log.e("BaseAnimation", (new StringBuilder()).append("fail to get number in AnimationItem:").append(i).toString());
_L4:
            return d;
_L2:
            if(mExps[i] != null)
                d = mExps[i].evaluate(mContext.mVariables);
            if(true) goto _L4; else goto _L3
_L3:
        }

        public AnimationItem load(Element element) throws ScreenElementLoadException {
            try {
                mTime = Long.parseLong(element.getAttribute("time"));
            }
            catch(NumberFormatException numberformatexception) {
                Log.e("BaseAnimation", "fail to get time attribute");
                throw new ScreenElementLoadException("fail to get time attribute");
            }
            if(mAttrs != null) {
                mExps = new Expression[mAttrs.length];
                String as[] = mAttrs;
                int i = as.length;
                int j = 0;
                int l;
                for(int k = 0; j < i; k = l) {
                    String s = as[j];
                    Expression aexpression[] = mExps;
                    l = k + 1;
                    aexpression[k] = Expression.build(element.getAttribute(s));
                    j++;
                }

            }
            return this;
        }

        private String mAttrs[];
        private ScreenContext mContext;
        public Expression mExps[];
        public long mTime;

        public AnimationItem(String as[], ScreenContext screencontext) {
            mAttrs = as;
            mContext = screencontext;
        }
    }


    public BaseAnimation(Element element, String s, ScreenContext screencontext) throws ScreenElementLoadException {
        mItems = new ArrayList();
        mContext = screencontext;
        load(element, s);
    }

    private void load(Element element, String s) throws ScreenElementLoadException {
        mItems.clear();
        String s1 = element.getAttribute("delay");
        NodeList nodelist;
        if(!TextUtils.isEmpty(s1))
            try {
                mDelay = Long.parseLong(s1);
            }
            catch(NumberFormatException numberformatexception) {
                Log.w("BaseAnimation", "invalid delay attribute");
            }
        nodelist = element.getElementsByTagName(s);
        for(int i = 0; i < nodelist.getLength(); i++) {
            Element element1 = (Element)nodelist.item(i);
            mItems.add(onCreateItem().load(element1));
        }

        boolean flag;
        if(mItems.size() > 0)
            flag = true;
        else
            flag = false;
        Utils.asserts(flag, "BaseAnimation: empty items");
        mTimeRange = ((AnimationItem)mItems.get(-1 + mItems.size())).mTime;
        if(mItems.size() > 1)
            mRealTimeRange = ((AnimationItem)mItems.get(-2 + mItems.size())).mTime;
    }

    protected AnimationItem getItem(int i) {
        AnimationItem animationitem;
        if(i < 0 || i >= mItems.size())
            animationitem = null;
        else
            animationitem = (AnimationItem)mItems.get(i);
        return animationitem;
    }

    public void init() {
        reset();
    }

    protected abstract AnimationItem onCreateItem();

    protected abstract void onTick(AnimationItem animationitem, AnimationItem animationitem1, float f);

    public void reset() {
        mStartTime = mContext.getRenderController().getLastUpdateTime();
        mLastFrame = false;
    }

    public final void tick(long l) {
        long l1 = l - mStartTime;
        if(l1 >= mDelay) goto _L2; else goto _L1
_L1:
        onTick(null, null, 0.0F);
_L4:
        return;
_L2:
        long l3;
        AnimationItem animationitem;
        int i;
        long l2 = l1 - mDelay;
        if(mTimeRange >= 0xe8d4a51000L && l2 > mRealTimeRange && mLastFrame)
            continue; /* Loop/switch isn't completed */
        l3 = l2 % mTimeRange;
        animationitem = null;
        i = 0;
_L5:
        if(i < mItems.size()) {
label0:
            {
                AnimationItem animationitem1 = (AnimationItem)mItems.get(i);
                if(l3 > animationitem1.mTime)
                    break label0;
                long l4 = 0L;
                long l5;
                boolean flag;
                float f;
                if(i == 0) {
                    l5 = animationitem1.mTime;
                } else {
                    AnimationItem animationitem2 = (AnimationItem)mItems.get(i - 1);
                    animationitem = animationitem2;
                    l5 = animationitem1.mTime - animationitem2.mTime;
                    l4 = animationitem2.mTime;
                }
                if(i == -1 + mItems.size())
                    flag = true;
                else
                    flag = false;
                mLastFrame = flag;
                if(l5 == 0L)
                    f = 1.0F;
                else
                    f = (float)(l3 - l4) / (float)l5;
                onTick(animationitem, animationitem1, f);
            }
        }
        if(true) goto _L4; else goto _L3
_L3:
        i++;
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }

    private static final long INFINITE_TIME = 0xe8d4a51000L;
    private static final String LOG_TAG = "BaseAnimation";
    protected ScreenContext mContext;
    private long mDelay;
    protected ArrayList mItems;
    private boolean mLastFrame;
    private long mRealTimeRange;
    private long mStartTime;
    private long mTimeRange;
}
