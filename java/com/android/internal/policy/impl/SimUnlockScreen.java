// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.text.Editable;
import android.view.*;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class SimUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.view.View.OnClickListener {
    private class TouchInput
        implements android.view.View.OnClickListener {

        private int checkDigit(View view) {
            byte byte0 = -1;
            if(view != mZero) goto _L2; else goto _L1
_L1:
            byte0 = 0;
_L4:
            return byte0;
_L2:
            if(view == mOne)
                byte0 = 1;
            else
            if(view == mTwo)
                byte0 = 2;
            else
            if(view == mThree)
                byte0 = 3;
            else
            if(view == mFour)
                byte0 = 4;
            else
            if(view == mFive)
                byte0 = 5;
            else
            if(view == mSix)
                byte0 = 6;
            else
            if(view == mSeven)
                byte0 = 7;
            else
            if(view == mEight)
                byte0 = 8;
            else
            if(view == mNine)
                byte0 = 9;
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void onClick(View view) {
            if(view != mCancelButton) goto _L2; else goto _L1
_L1:
            mPinText.setText("");
            mCallback.goToLockScreen();
_L4:
            return;
_L2:
            int i = checkDigit(view);
            if(i >= 0) {
                mCallback.pokeWakelock(5000);
                reportDigit(i);
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        private TextView mCancelButton;
        private TextView mEight;
        private TextView mFive;
        private TextView mFour;
        private TextView mNine;
        private TextView mOne;
        private TextView mSeven;
        private TextView mSix;
        private TextView mThree;
        private TextView mTwo;
        private TextView mZero;
        final SimUnlockScreen this$0;

        private TouchInput() {
            this$0 = SimUnlockScreen.this;
            super();
            mZero = (TextView)findViewById(0x102035c);
            mOne = (TextView)findViewById(0x1020353);
            mTwo = (TextView)findViewById(0x1020354);
            mThree = (TextView)findViewById(0x1020355);
            mFour = (TextView)findViewById(0x1020356);
            mFive = (TextView)findViewById(0x1020357);
            mSix = (TextView)findViewById(0x1020358);
            mSeven = (TextView)findViewById(0x1020359);
            mEight = (TextView)findViewById(0x102035a);
            mNine = (TextView)findViewById(0x102035b);
            mCancelButton = (TextView)findViewById(0x1020269);
            mZero.setText("0");
            mOne.setText("1");
            mTwo.setText("2");
            mThree.setText("3");
            mFour.setText("4");
            mFive.setText("5");
            mSix.setText("6");
            mSeven.setText("7");
            mEight.setText("8");
            mNine.setText("9");
            mZero.setOnClickListener(this);
            mOne.setOnClickListener(this);
            mTwo.setOnClickListener(this);
            mThree.setOnClickListener(this);
            mFour.setOnClickListener(this);
            mFive.setOnClickListener(this);
            mSix.setOnClickListener(this);
            mSeven.setOnClickListener(this);
            mEight.setOnClickListener(this);
            mNine.setOnClickListener(this);
            mCancelButton.setOnClickListener(this);
        }

    }

    private abstract class CheckSimPin extends Thread {

        abstract void onSimLockChangedResponse(boolean flag);

        public void run() {
            final boolean result = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPin(mPin);
            post(new Runnable() {

                public void run() {
                    onSimLockChangedResponse(result);
                }

                final CheckSimPin this$1;
                final boolean val$result;

                 {
                    this$1 = CheckSimPin.this;
                    result = flag;
                    super();
                }
            });
_L1:
            return;
            RemoteException remoteexception;
            remoteexception;
            post(new Runnable() {

                public void run() {
                    onSimLockChangedResponse(false);
                }

                final CheckSimPin this$1;

                 {
                    this$1 = CheckSimPin.this;
                    super();
                }
            });
              goto _L1
        }

        private final String mPin;
        final SimUnlockScreen this$0;

        protected CheckSimPin(String s) {
            this$0 = SimUnlockScreen.this;
            super();
            mPin = s;
        }
    }


    public SimUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils) {
        super(context);
        int ai[] = new int[8];
        ai[0] = 0;
        ai[1] = 0;
        ai[2] = 0;
        ai[3] = 0;
        ai[4] = 0;
        ai[5] = 0;
        ai[6] = 0;
        ai[7] = 0;
        mEnteredPin = ai;
        mEnteredDigits = 0;
        mSimUnlockProgressDialog = null;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCreationOrientation = configuration.orientation;
        mKeyboardHidden = configuration.hardKeyboardHidden;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if(mKeyboardHidden == 1) {
            layoutinflater.inflate(0x1090052, this, true);
        } else {
            layoutinflater.inflate(0x1090053, this, true);
            new TouchInput();
        }
        mHeaderText = (TextView)findViewById(0x10202b6);
        mPinText = (TextView)findViewById(0x10202b8);
        mBackSpaceButton = findViewById(0x10202b9);
        mBackSpaceButton.setOnClickListener(this);
        mOkButton = (TextView)findViewById(0x102029a);
        mHeaderText.setText(0x10402ec);
        mPinText.setFocusable(false);
        mOkButton.setOnClickListener(this);
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, false);
        setFocusableInTouchMode(true);
    }

    private void checkPin() {
        if(mEnteredDigits < 4) {
            mHeaderText.setText(0x10400d2);
            mPinText.setText("");
            mEnteredDigits = 0;
            mCallback.pokeWakelock();
        } else {
            getSimUnlockProgressDialog().show();
            (new CheckSimPin(mPinText.getText().toString()) {

                void onSimLockChangedResponse(final boolean success) {
                    mPinText.post(new Runnable() {

                        public void run() {
                            if(mSimUnlockProgressDialog != null)
                                mSimUnlockProgressDialog.hide();
                            if(success) {
                                mUpdateMonitor.reportSimUnlocked();
                                mCallback.goToUnlockScreen();
                            } else {
                                mHeaderText.setText(0x10402f3);
                                mPinText.setText("");
                                mEnteredDigits = 0;
                            }
                            mCallback.pokeWakelock();
                        }

                        final _cls1 this$1;
                        final boolean val$success;

                     {
                        this$1 = _cls1.this;
                        success = flag;
                        super();
                    }
                    });
                }

                final SimUnlockScreen this$0;

             {
                this$0 = SimUnlockScreen.this;
                super(s);
            }
            }).start();
        }
    }

    private Dialog getSimUnlockProgressDialog() {
        if(mSimUnlockProgressDialog == null) {
            mSimUnlockProgressDialog = new ProgressDialog(mContext);
            mSimUnlockProgressDialog.setMessage(mContext.getString(0x1040315));
            mSimUnlockProgressDialog.setIndeterminate(true);
            mSimUnlockProgressDialog.setCancelable(false);
            mSimUnlockProgressDialog.getWindow().setType(2009);
        }
        return mSimUnlockProgressDialog;
    }

    private void reportDigit(int i) {
        if(mEnteredDigits == 0)
            mPinText.setText("");
        if(mEnteredDigits != 8) {
            mPinText.append(Integer.toString(i));
            int ai[] = mEnteredPin;
            int j = mEnteredDigits;
            mEnteredDigits = j + 1;
            ai[j] = i;
        }
    }

    public void cleanUp() {
        if(mSimUnlockProgressDialog != null) {
            mSimUnlockProgressDialog.dismiss();
            mSimUnlockProgressDialog = null;
        }
        mUpdateMonitor.removeCallback(this);
    }

    public boolean needsInput() {
        return true;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    public void onClick(View view) {
        if(view != mBackSpaceButton) goto _L2; else goto _L1
_L1:
        Editable editable = mPinText.getEditableText();
        int i = editable.length();
        if(i > 0) {
            editable.delete(i - 1, i);
            mEnteredDigits = -1 + mEnteredDigits;
        }
        mCallback.pokeWakelock();
_L4:
        return;
_L2:
        if(view == mOkButton)
            checkPin();
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        boolean flag = true;
        if(i != 4) goto _L2; else goto _L1
_L1:
        mCallback.goToLockScreen();
_L4:
        return flag;
_L2:
        char c = keyevent.getMatch(DIGITS);
        if(c != 0)
            reportDigit(c + -48);
        else
        if(i == 67) {
            if(mEnteredDigits > 0) {
                mPinText.onKeyDown(i, keyevent);
                mEnteredDigits = -1 + mEnteredDigits;
            }
        } else
        if(i == 66)
            checkPin();
        else
            flag = false;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void onPause() {
        mKeyguardStatusViewManager.onPause();
    }

    public void onResume() {
        mHeaderText.setText(0x10402ec);
        mPinText.setText("");
        mEnteredDigits = 0;
        mKeyguardStatusViewManager.onResume();
    }

    void updateConfiguration() {
        Configuration configuration = getResources().getConfiguration();
        if(configuration.orientation == mCreationOrientation) goto _L2; else goto _L1
_L1:
        mCallback.recreateMe(configuration);
_L4:
        return;
_L2:
        if(configuration.hardKeyboardHidden != mKeyboardHidden)
            mKeyboardHidden = configuration.hardKeyboardHidden;
        if(true) goto _L4; else goto _L3
_L3:
    }

    private static final char DIGITS[];
    private static final int DIGIT_PRESS_WAKE_MILLIS = 5000;
    private View mBackSpaceButton;
    private final KeyguardScreenCallback mCallback;
    private int mCreationOrientation;
    private int mEnteredDigits;
    private final int mEnteredPin[];
    private TextView mHeaderText;
    private int mKeyboardHidden;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private TextView mOkButton;
    private TextView mPinText;
    private ProgressDialog mSimUnlockProgressDialog;
    private final KeyguardUpdateMonitor mUpdateMonitor;

    static  {
        char ac[] = new char[10];
        ac[0] = '0';
        ac[1] = '1';
        ac[2] = '2';
        ac[3] = '3';
        ac[4] = '4';
        ac[5] = '5';
        ac[6] = '6';
        ac[7] = '7';
        ac[8] = '8';
        ac[9] = '9';
        DIGITS = ac;
    }







/*
    static int access$602(SimUnlockScreen simunlockscreen, int i) {
        simunlockscreen.mEnteredDigits = i;
        return i;
    }

*/

}
