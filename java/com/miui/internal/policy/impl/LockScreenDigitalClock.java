// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl;

import android.content.*;
import android.os.Handler;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.widget.*;
import java.util.Calendar;
import java.util.HashMap;

public class LockScreenDigitalClock extends LinearLayout {

    public LockScreenDigitalClock(Context context) {
        this(context, null);
    }

    public LockScreenDigitalClock(Context context, AttributeSet attributeset) {
        super(context, attributeset);
        mHandler = new Handler();
        mIntentReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                if(intent.getAction().equals("android.intent.action.TIMEZONE_CHANGED"))
                    mCalendar = Calendar.getInstance();
                mHandler.post(new Runnable() {

                    public void run() {
                        updateTime();
                    }

                    final _cls1 this$1;

                     {
                        this$1 = _cls1.this;
                        super();
                    }
                });
            }

            final LockScreenDigitalClock this$0;

             {
                this$0 = LockScreenDigitalClock.this;
                super();
            }
        };
    }

    private void setDateFormat() {
        String s;
        if(DateFormat.is24HourFormat(getContext()))
            s = "kk:mm";
        else
            s = "h:mm";
        mFormat = s;
    }

    private void updateTime() {
        CharSequence charsequence;
        int i;
        mCalendar.setTimeInMillis(System.currentTimeMillis());
        charsequence = DateFormat.format(mFormat, mCalendar);
        i = 0;
        if(charsequence.length() != 4) goto _L2; else goto _L1
_L1:
        mFirstDigital.setVisibility(8);
_L4:
        int k = ((Integer)sDigital2ResId.get(String.valueOf(charsequence.charAt(i)))).intValue();
        mSecondDigital.setImageResource(k);
        int l = ((Integer)sDigital2ResId.get(String.valueOf(charsequence.charAt(i + 2)))).intValue();
        mThirdDigital.setImageResource(l);
        int i1 = ((Integer)sDigital2ResId.get(String.valueOf(charsequence.charAt(i + 3)))).intValue();
        mFouthDigital.setImageResource(i1);
        CharSequence charsequence1 = DateFormat.format(mContext.getString(0x60c002d), mCalendar);
        mDate.setVisibility(0);
        mDate.setText(charsequence1);
        return;
_L2:
        if(charsequence.length() == 5) {
            int j = ((Integer)sDigital2ResId.get(String.valueOf(charsequence.charAt(0)))).intValue();
            mFirstDigital.setImageResource(j);
            mFirstDigital.setVisibility(0);
            i = 1;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if(!mAttached) {
            mAttached = true;
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.TIME_TICK");
            intentfilter.addAction("android.intent.action.TIME_SET");
            intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
            mContext.registerReceiver(mIntentReceiver, intentfilter);
            updateTime();
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if(mAttached) {
            mAttached = false;
            mContext.unregisterReceiver(mIntentReceiver);
        }
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        mFirstDigital = (ImageView)findViewById(0x60b0038);
        mSecondDigital = (ImageView)findViewById(0x60b0039);
        mThirdDigital = (ImageView)findViewById(0x60b003a);
        mFouthDigital = (ImageView)findViewById(0x60b003b);
        mDate = (TextView)findViewById(0x60b003c);
        mCalendar = Calendar.getInstance();
        setDateFormat();
    }

    void updateTime(Calendar calendar) {
        mCalendar = calendar;
        updateTime();
    }

    private static final String M12 = "h:mm";
    private static final String M24 = "kk:mm";
    private static HashMap sDigital2ResId;
    private boolean mAttached;
    private Calendar mCalendar;
    private TextView mDate;
    private ImageView mFirstDigital;
    private String mFormat;
    private ImageView mFouthDigital;
    private final Handler mHandler;
    private final BroadcastReceiver mIntentReceiver;
    private ImageView mSecondDigital;
    private ImageView mThirdDigital;

    static  {
        sDigital2ResId = new HashMap();
        sDigital2ResId.put("0", Integer.valueOf(0x602007a));
        sDigital2ResId.put("1", Integer.valueOf(0x602007b));
        sDigital2ResId.put("2", Integer.valueOf(0x602007c));
        sDigital2ResId.put("3", Integer.valueOf(0x602007d));
        sDigital2ResId.put("4", Integer.valueOf(0x602007e));
        sDigital2ResId.put("5", Integer.valueOf(0x602007f));
        sDigital2ResId.put("6", Integer.valueOf(0x6020080));
        sDigital2ResId.put("7", Integer.valueOf(0x6020081));
        sDigital2ResId.put("8", Integer.valueOf(0x6020082));
        sDigital2ResId.put("9", Integer.valueOf(0x6020083));
    }


/*
    static Calendar access$002(LockScreenDigitalClock lockscreendigitalclock, Calendar calendar) {
        lockscreendigitalclock.mCalendar = calendar;
        return calendar;
    }

*/


}
