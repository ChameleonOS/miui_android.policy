// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Handler;
import android.os.SystemClock;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.util.Log;
import java.util.Calendar;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ImageScreenElement, AnimatedScreenElement, ScreenElement

public class TimepanelScreenElement extends ImageScreenElement {

    public TimepanelScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mFormat = "kk:mm";
        mCalendar = Calendar.getInstance();
        mFormat = element.getAttribute("format");
        mHandler = screencontext.mHandler;
    }

    private void createBitmap() {
        int i;
        int j;
        int k;
        i = 0;
        j = 0;
        k = 0;
_L5:
        if(k >= "0123456789:".length()) goto _L2; else goto _L1
_L1:
        Bitmap bitmap = getDigitBmp("0123456789:".charAt(k));
        if(bitmap != null) goto _L4; else goto _L3
_L3:
        mLoadResourceFailed = true;
        Log.e("TimepanelScreenElement", (new StringBuilder()).append("Failed to load digit bitmap: ").append("0123456789:".charAt(k)).toString());
_L6:
        return;
_L4:
        if(i < bitmap.getWidth())
            i = bitmap.getWidth();
        if(mBmpHeight < bitmap.getHeight())
            mBmpHeight = bitmap.getHeight();
        if(j == 0)
            j = bitmap.getDensity();
        k++;
          goto _L5
_L2:
        super.mBitmap = Bitmap.createBitmap(i * 5, mBmpHeight, android.graphics.Bitmap.Config.ARGB_8888);
        super.mBitmap.setDensity(j);
        setActualHeight(mBmpHeight);
        super.mBitmapChanged = true;
          goto _L6
    }

    private Bitmap getDigitBmp(char c) {
        String s;
        String s1;
        if(TextUtils.isEmpty(super.mAni.getSrc()))
            s = "time.png";
        else
            s = super.mAni.getSrc();
        if(c == ':')
            s1 = "dot";
        else
            s1 = String.valueOf(c);
        return super.mContext.mResourceManager.getBitmap(Utils.addFileNameSuffix(s, s1));
    }

    private void setDateFormat() {
        if(TextUtils.isEmpty(mFormat)) {
            String s;
            if(DateFormat.is24HourFormat(super.mContext.mContext))
                s = "kk:mm";
            else
                s = "hh:mm";
            mFormat = s;
        }
    }

    private void updateTime() {
        if(!mLoadResourceFailed) goto _L2; else goto _L1
_L1:
        return;
_L2:
        long l = SystemClock.elapsedRealtime();
        if(l - mLastUpdateTimeMillis >= 1000L) {
            if(super.mBitmap == null)
                createBitmap();
            if(super.mBitmap != null) {
                mCalendar.setTimeInMillis(System.currentTimeMillis());
                CharSequence charsequence = DateFormat.format(mFormat, mCalendar);
                if(!charsequence.equals(mPreTime)) {
                    mPreTime = charsequence;
                    Canvas canvas = new Canvas(super.mBitmap);
                    canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
                    int i = 0;
                    for(int j = 0; j < charsequence.length(); j++) {
                        Bitmap bitmap = getDigitBmp(charsequence.charAt(j));
                        if(bitmap != null) {
                            canvas.drawBitmap(bitmap, i, 0.0F, null);
                            i += bitmap.getWidth();
                        }
                    }

                    mBmpWidth = i;
                    setActualWidth(descale(mBmpWidth));
                    requestUpdate();
                    mLastUpdateTimeMillis = l;
                }
            }
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public void finish() {
        mHandler.removeCallbacks(mTimeUpdater);
    }

    protected int getBitmapWidth() {
        return mBmpWidth;
    }

    public void init() {
        super.init();
        setDateFormat();
        mHandler.post(mTimeUpdater);
    }

    public void pause() {
        mHandler.removeCallbacks(mTimeUpdater);
    }

    public void resume() {
        mCalendar = Calendar.getInstance();
        mHandler.post(mTimeUpdater);
    }

    private static final String LOG_TAG = "TimepanelScreenElement";
    private static final String M12 = "hh:mm";
    private static final String M24 = "kk:mm";
    public static final String TAG_NAME = "Time";
    private int mBmpHeight;
    private int mBmpWidth;
    protected Calendar mCalendar;
    private String mFormat;
    private Handler mHandler;
    private long mLastUpdateTimeMillis;
    private boolean mLoadResourceFailed;
    private CharSequence mPreTime;
    private final Runnable mTimeUpdater = new Runnable() {

        public void run() {
            updateTime();
            mHandler.postDelayed(this, 5000L);
        }

        final TimepanelScreenElement this$0;

             {
                this$0 = TimepanelScreenElement.this;
                super();
            }
    };


}
