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
        mHandler = new Handler();
        mFormat = element.getAttribute("format");
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
        long l = SystemClock.elapsedRealtime();
        if(l - mLastUpdateTimeMillis >= 1000L) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(super.mBitmap == null) {
            Bitmap bitmap1 = getDigitBmp('0');
            Bitmap bitmap2 = getDigitBmp(':');
            if(bitmap1 == null || bitmap2 == null)
                continue; /* Loop/switch isn't completed */
            mBmpHeight = bitmap1.getHeight();
            super.mBitmap = Bitmap.createBitmap(4 * bitmap1.getWidth() + bitmap2.getWidth(), bitmap1.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
            super.mBitmap.setDensity(bitmap1.getDensity());
            setActualHeight(mBmpHeight);
        }
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
            setActualWidth(mBmpWidth);
            requestUpdate();
            mLastUpdateTimeMillis = l;
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public void finish() {
        mHandler.removeCallbacks(mTimeUpdater);
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
