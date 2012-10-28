// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.security.KeyStore;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.text.method.TextKeyListener;
import android.view.*;
import android.view.inputmethod.*;
import android.widget.*;
import com.android.internal.widget.*;
import java.util.Iterator;
import java.util.List;
import miui.view.inputmethod.CustomizedImeForMiui;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class PasswordUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.widget.TextView.OnEditorActionListener, android.view.View.OnKeyListener {
    static class Injector {

        static void clearPinLockForFindDevice(PasswordUnlockScreen passwordunlockscreen, String s) {
            if(passwordunlockscreen.mIsLockByFindDevice) {
                passwordunlockscreen.getLockPatternUtils().clearLock(false);
                android.provider.Settings.Secure.putInt(passwordunlockscreen.getContext().getContentResolver(), miui.provider.ExtraSettings.Secure.FIND_DEVICE_PIN_LOCK, 0);
                passwordunlockscreen.mIsLockByFindDevice = false;
            } else {
                KeyStore.getInstance().password(s);
            }
        }

        static void hideKeyBoardViewIfNeed(PasswordUnlockScreen passwordunlockscreen) {
            if(CustomizedImeForMiui.defaultImeIsCustomizedForMiui(passwordunlockscreen.getContext().getContentResolver()))
                passwordunlockscreen.getKeyboardView().setVisibility(8);
        }

        static void initLockByFindDevice(PasswordUnlockScreen passwordunlockscreen) {
            boolean flag = true;
            if(android.provider.Settings.Secure.getInt(passwordunlockscreen.getContext().getContentResolver(), miui.provider.ExtraSettings.Secure.FIND_DEVICE_PIN_LOCK, 0) != flag)
                flag = false;
            passwordunlockscreen.mIsLockByFindDevice = flag;
        }

        static void initialize(PasswordUnlockScreen passwordunlockscreen) {
            initLockByFindDevice(passwordunlockscreen);
            hideKeyBoardViewIfNeed(passwordunlockscreen);
        }

        Injector() {
        }
    }


    public PasswordUnlockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback) {
        super(context);
        mCreationHardKeyboardHidden = configuration.hardKeyboardHidden;
        mCreationOrientation = configuration.orientation;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        int i;
        boolean flag;
        boolean flag1;
        View view1;
        final InputMethodManager imm;
        if(mCreationOrientation != 2)
            layoutinflater.inflate(0x1090051, this, true);
        else
            layoutinflater.inflate(0x1090050, this, true);
        mStatusViewManager = new KeyguardStatusViewManager(this, mUpdateMonitor, mLockPatternUtils, mCallback, true);
        i = lockpatternutils.getKeyguardStoredPasswordQuality();
        if(0x40000 == i || 0x50000 == i || 0x60000 == i)
            flag = true;
        else
            flag = false;
        mIsAlpha = flag;
        mPasswordEntry.setOnEditorActionListener(this);
        mPasswordEntry.setOnKeyListener(this);
        mKeyboardHelper = new PasswordEntryKeyboardHelper(context, mKeyboardView, this, false);
        mKeyboardHelper.setEnableHaptics(mLockPatternUtils.isTactileFeedbackEnabled());
        flag1 = false;
        if(mIsAlpha) {
            mKeyboardHelper.setKeyboardMode(0);
            mKeyboardView.setVisibility(8);
        } else {
            mKeyboardHelper.setKeyboardMode(1);
            PasswordEntryKeyboardView passwordentrykeyboardview = mKeyboardView;
            byte byte0;
            View view;
            if(mCreationHardKeyboardHidden == 1)
                byte0 = 4;
            else
                byte0 = 0;
            passwordentrykeyboardview.setVisibility(byte0);
            view = findViewById(0x10202af);
            if(view != null) {
                view.setVisibility(0);
                flag1 = true;
                view.setOnClickListener(new android.view.View.OnClickListener() {

                    public void onClick(View view2) {
                        mKeyboardHelper.handleBackspace();
                    }

                    final PasswordUnlockScreen this$0;

             {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
                });
            }
        }
        mPasswordEntry.requestFocus();
        if(mIsAlpha) {
            mPasswordEntry.setKeyListener(TextKeyListener.getInstance());
            mPasswordEntry.setInputType(0x800081);
        } else {
            mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
            mPasswordEntry.setInputType(0x800012);
        }
        mPasswordEntry.setOnClickListener(new android.view.View.OnClickListener() {

            public void onClick(View view2) {
                mCallback.pokeWakelock();
            }

            final PasswordUnlockScreen this$0;

             {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
        });
        mPasswordEntry.addTextChangedListener(new TextWatcher() {

            public void afterTextChanged(Editable editable) {
                if(!mResuming)
                    mCallback.pokeWakelock();
            }

            public void beforeTextChanged(CharSequence charsequence, int j, int k, int l) {
            }

            public void onTextChanged(CharSequence charsequence, int j, int k, int l) {
            }

            final PasswordUnlockScreen this$0;

             {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
        });
        view1 = findViewById(0x10202b0);
        imm = (InputMethodManager)getContext().getSystemService("input_method");
        if(mIsAlpha && view1 != null && hasMultipleEnabledIMEsOrSubtypes(imm, false)) {
            view1.setVisibility(0);
            flag1 = true;
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                public void onClick(View view2) {
                    mCallback.pokeWakelock();
                    imm.showInputMethodPicker();
                }

                final PasswordUnlockScreen this$0;
                final InputMethodManager val$imm;

             {
                this$0 = PasswordUnlockScreen.this;
                imm = inputmethodmanager;
                super();
            }
            });
        }
        if(!flag1) {
            android.view.ViewGroup.LayoutParams layoutparams = mPasswordEntry.getLayoutParams();
            if(layoutparams instanceof android.view.ViewGroup.MarginLayoutParams) {
                ((android.view.ViewGroup.MarginLayoutParams)layoutparams).leftMargin = 0;
                mPasswordEntry.setLayoutParams(layoutparams);
            }
        }
        Injector.initialize(this);
    }

    private void handleAttemptLockout(long l) {
        mPasswordEntry.setEnabled(false);
        mKeyboardView.setEnabled(false);
        (new CountDownTimer(l - SystemClock.elapsedRealtime(), 1000L) {

            public void onFinish() {
                mPasswordEntry.setEnabled(true);
                mKeyboardView.setEnabled(true);
                mStatusViewManager.resetStatusInfo();
            }

            public void onTick(long l1) {
                int i = (int)(l1 / 1000L);
                Context context = getContext();
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                String s = context.getString(0x104031c, aobj);
                mStatusViewManager.setInstructionText(s);
            }

            final PasswordUnlockScreen this$0;

             {
                this$0 = PasswordUnlockScreen.this;
                super(l, l1);
            }
        }).start();
    }

    private boolean hasMultipleEnabledIMEsOrSubtypes(InputMethodManager inputmethodmanager, boolean flag) {
        int i;
        boolean flag1;
        int j;
        Iterator iterator;
        i = 0;
        flag1 = true;
        List list = inputmethodmanager.getEnabledInputMethodList();
        j = 0;
        iterator = list.iterator();
_L3:
        InputMethodInfo inputmethodinfo;
        if(!iterator.hasNext())
            break MISSING_BLOCK_LABEL_155;
        inputmethodinfo = (InputMethodInfo)iterator.next();
        if(j <= flag1) goto _L2; else goto _L1
_L1:
        return flag1;
_L2:
        List list1 = inputmethodmanager.getEnabledInputMethodSubtypeList(inputmethodinfo, flag1);
        if(list1.isEmpty()) {
            j++;
        } else {
            int k = 0;
            Iterator iterator1 = list1.iterator();
            do {
                if(!iterator1.hasNext())
                    break;
                if(((InputMethodSubtype)iterator1.next()).isAuxiliary())
                    k++;
            } while(true);
            if(list1.size() - k > 0 || flag && k > flag1)
                j++;
        }
          goto _L3
        if(j > flag1 || inputmethodmanager.getEnabledInputMethodSubtypeList(null, false).size() > flag1)
            i = ((flag1) ? 1 : 0);
        flag1 = i;
          goto _L1
    }

    private void verifyPasswordAndUnlock() {
        String s = mPasswordEntry.getText().toString();
        if(!mLockPatternUtils.checkPassword(s)) goto _L2; else goto _L1
_L1:
        mCallback.keyguardDone(true);
        mCallback.reportSuccessfulUnlockAttempt();
        mStatusViewManager.setInstructionText(null);
        Injector.clearPinLockForFindDevice(this, s);
_L4:
        mPasswordEntry.setText("");
        return;
_L2:
        if(s.length() > 3) {
            mCallback.reportFailedUnlockAttempt();
            if(mUpdateMonitor.getFailedAttempts() % 5 == 0)
                handleAttemptLockout(mLockPatternUtils.setLockoutAttemptDeadline());
            mStatusViewManager.setInstructionText(mContext.getString(0x10402ff));
        } else
        if(s.length() > 0)
            mStatusViewManager.setInstructionText(mContext.getString(0x10402ff));
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void cleanUp() {
        mUpdateMonitor.removeCallback(this);
    }

    PasswordEntryKeyboardView getKeyboardView() {
        return mKeyboardView;
    }

    LockPatternUtils getLockPatternUtils() {
        return mLockPatternUtils;
    }

    public boolean isAlphaOrDefaultImeIsCustomizedForMiui() {
        boolean flag;
        if(mIsAlpha || CustomizedImeForMiui.defaultImeIsCustomizedForMiui(getContext().getContentResolver()))
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean needsInput() {
        return isAlphaOrDefaultImeIsCustomizedForMiui();
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Configuration configuration = getResources().getConfiguration();
        if(configuration.orientation != mCreationOrientation || configuration.hardKeyboardHidden != mCreationHardKeyboardHidden)
            mCallback.recreateMe(configuration);
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if(configuration.orientation != mCreationOrientation || configuration.hardKeyboardHidden != mCreationHardKeyboardHidden)
            mCallback.recreateMe(configuration);
    }

    public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent) {
        boolean flag;
        if(i == 0 || i == 6 || i == 5) {
            verifyPasswordAndUnlock();
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    public boolean onKey(View view, int i, KeyEvent keyevent) {
        boolean flag = true;
        if(keyevent.getAction() == flag && i == 5)
            mCallback.takeEmergencyCallAction();
        else
            flag = false;
        return flag;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        mCallback.pokeWakelock();
        return false;
    }

    public void onKeyboardChange(boolean flag) {
        PasswordEntryKeyboardView passwordentrykeyboardview = mKeyboardView;
        byte byte0;
        if(flag)
            byte0 = 4;
        else
            byte0 = 0;
        passwordentrykeyboardview.setVisibility(byte0);
    }

    public void onPause() {
        mStatusViewManager.onPause();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        return mPasswordEntry.requestFocus(i, rect);
    }

    public void onResume() {
        mResuming = true;
        mStatusViewManager.onResume();
        mPasswordEntry.setText("");
        mPasswordEntry.requestFocus();
        long l = mLockPatternUtils.getLockoutAttemptDeadline();
        if(l != 0L)
            handleAttemptLockout(l);
        mResuming = false;
    }

    private static final int MINIMUM_PASSWORD_LENGTH_BEFORE_REPORT = 3;
    private static final String TAG = "PasswordUnlockScreen";
    private final KeyguardScreenCallback mCallback;
    private final int mCreationHardKeyboardHidden;
    private final int mCreationOrientation;
    private final boolean mIsAlpha;
    boolean mIsLockByFindDevice;
    private final PasswordEntryKeyboardHelper mKeyboardHelper;
    private final PasswordEntryKeyboardView mKeyboardView = (PasswordEntryKeyboardView)findViewById(0x1020214);
    private final LockPatternUtils mLockPatternUtils;
    private final EditText mPasswordEntry = (EditText)findViewById(0x10202ae);
    private boolean mResuming;
    private final KeyguardStatusViewManager mStatusViewManager;
    private final KeyguardUpdateMonitor mUpdateMonitor;
    private final boolean mUseSystemIME = true;






}
