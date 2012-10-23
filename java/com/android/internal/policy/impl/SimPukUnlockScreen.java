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
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardUpdateMonitor, KeyguardScreenCallback

public class SimPukUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.view.View.OnClickListener, android.view.View.OnFocusChangeListener {
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
            mPukText.setText("");
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
        final SimPukUnlockScreen this$0;

        private TouchInput() {
            this$0 = SimPukUnlockScreen.this;
            super();
            mZero = (TextView)findViewById(0x1020357);
            mOne = (TextView)findViewById(0x102034e);
            mTwo = (TextView)findViewById(0x102034f);
            mThree = (TextView)findViewById(0x1020350);
            mFour = (TextView)findViewById(0x1020351);
            mFive = (TextView)findViewById(0x1020352);
            mSix = (TextView)findViewById(0x1020353);
            mSeven = (TextView)findViewById(0x1020354);
            mEight = (TextView)findViewById(0x1020355);
            mNine = (TextView)findViewById(0x1020356);
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

    private abstract class CheckSimPuk extends Thread {

        abstract void onSimLockChangedResponse(boolean flag);

        public void run() {
            final boolean result = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPuk(mPuk, mPin);
            post(new Runnable() {

                public void run() {
                    onSimLockChangedResponse(result);
                }

                final CheckSimPuk this$1;
                final boolean val$result;

                 {
                    this$1 = CheckSimPuk.this;
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

                final CheckSimPuk this$1;

                 {
                    this$1 = CheckSimPuk.this;
                    super();
                }
            });
              goto _L1
        }

        private final String mPin;
        private final String mPuk;
        final SimPukUnlockScreen this$0;

        protected CheckSimPuk(String s, String s1) {
            this$0 = SimPukUnlockScreen.this;
            super();
            mPuk = s;
            mPin = s1;
        }
    }


    public SimPukUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils) {
        super(context);
        mSimUnlockProgressDialog = null;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCreationOrientation = configuration.orientation;
        mKeyboardHidden = configuration.hardKeyboardHidden;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if(mKeyboardHidden == 1) {
            layoutinflater.inflate(0x1090054, this, true);
        } else {
            layoutinflater.inflate(0x1090055, this, true);
            new TouchInput();
        }
        mHeaderText = (TextView)findViewById(0x10202b6);
        mPukText = (TextView)findViewById(0x10202bf);
        mPinText = (TextView)findViewById(0x10202b8);
        mDelPukButton = findViewById(0x10202c0);
        mDelPinButton = findViewById(0x10202af);
        mOkButton = findViewById(0x102029a);
        mDelPinButton.setOnClickListener(this);
        mDelPukButton.setOnClickListener(this);
        mOkButton.setOnClickListener(this);
        mHeaderText.setText(0x10402ed);
        mHeaderText.setSelected(true);
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, true);
        mPinText.setFocusableInTouchMode(true);
        mPinText.setOnFocusChangeListener(this);
        mPukText.setFocusableInTouchMode(true);
        mPukText.setOnFocusChangeListener(this);
    }

    private void checkPuk() {
        if(mPukText.getText().length() < 8) {
            mHeaderText.setText(0x10400d3);
            mPukText.setText("");
        } else
        if(mPinText.getText().length() < 4 || mPinText.getText().length() > 8) {
            mHeaderText.setText(0x10400d2);
            mPinText.setText("");
        } else {
            getSimUnlockProgressDialog().show();
            (new CheckSimPuk(mPukText.getText().toString(), mPinText.getText().toString()) {

                void onSimLockChangedResponse(final boolean success) {
                    mPinText.post(new Runnable() {

                        public void run() {
                            if(mSimUnlockProgressDialog != null)
                                mSimUnlockProgressDialog.hide();
                            if(success) {
                                mUpdateMonitor.reportSimUnlocked();
                                mCallback.goToUnlockScreen();
                            } else {
                                mHeaderText.setText(0x10400d0);
                                mPukText.setText("");
                                mPinText.setText("");
                            }
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

                final SimPukUnlockScreen this$0;

             {
                this$0 = SimPukUnlockScreen.this;
                super(s, s1);
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
        mFocusedEntry.append(Integer.toString(i));
    }

    public void cleanUp() {
        if(mSimUnlockProgressDialog != null) {
            mSimUnlockProgressDialog.dismiss();
            mSimUnlockProgressDialog = null;
        }
        mUpdateMonitor.removeCallback(this);
    }

    public boolean needsInput() {
        return false;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    public void onClick(View view) {
        if(view != mDelPukButton) goto _L2; else goto _L1
_L1:
        if(mFocusedEntry != mPukText)
            mPukText.requestFocus();
        Editable editable1 = mPukText.getEditableText();
        int j = editable1.length();
        if(j > 0)
            editable1.delete(j - 1, j);
_L4:
        mCallback.pokeWakelock(5000);
        return;
_L2:
        if(view == mDelPinButton) {
            if(mFocusedEntry != mPinText)
                mPinText.requestFocus();
            Editable editable = mPinText.getEditableText();
            int i = editable.length();
            if(i > 0)
                editable.delete(i - 1, i);
        } else
        if(view == mOkButton)
            checkPuk();
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public void onFocusChange(View view, boolean flag) {
        if(flag)
            mFocusedEntry = (TextView)view;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        boolean flag = true;
        if(i == 4) {
            mCallback.goToLockScreen();
        } else {
            char c = keyevent.getMatch(DIGITS);
            if(c != 0)
                reportDigit(c + -48);
            else
            if(i == 67) {
                mFocusedEntry.onKeyDown(i, keyevent);
                Editable editable = mFocusedEntry.getEditableText();
                int j = editable.length();
                if(j > 0)
                    editable.delete(j - 1, j);
                mCallback.pokeWakelock(5000);
            } else
            if(i == 66)
                checkPuk();
            else
                flag = false;
        }
        return flag;
    }

    public void onPause() {
        mKeyguardStatusViewManager.onPause();
    }

    public void onResume() {
        mHeaderText.setText(0x10402ed);
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
    private final KeyguardScreenCallback mCallback;
    private int mCreationOrientation;
    private View mDelPinButton;
    private View mDelPukButton;
    private TextView mFocusedEntry;
    private TextView mHeaderText;
    private int mKeyboardHidden;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private View mOkButton;
    private TextView mPinText;
    private TextView mPukText;
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







}
