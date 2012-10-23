// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.accounts.*;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.text.*;
import android.view.*;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import java.io.IOException;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class AccountUnlockScreen extends RelativeLayout
    implements KeyguardScreen, android.view.View.OnClickListener, TextWatcher {

    public AccountUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils) {
        super(context);
        mCallback = keyguardscreencallback;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater.from(context).inflate(0x109004e, this, true);
        mTopHeader = (TextView)findViewById(0x1020295);
        TextView textview = mTopHeader;
        int i;
        EditText edittext;
        InputFilter ainputfilter[];
        if(mLockPatternUtils.isPermanentlyLocked())
            i = 0x104031f;
        else
            i = 0x104031e;
        textview.setText(i);
        mInstructions = (TextView)findViewById(0x1020297);
        mLogin = (EditText)findViewById(0x1020298);
        edittext = mLogin;
        ainputfilter = new InputFilter[1];
        ainputfilter[0] = new android.text.LoginFilter.UsernameFilterGeneric();
        edittext.setFilters(ainputfilter);
        mLogin.addTextChangedListener(this);
        mPassword = (EditText)findViewById(0x1020299);
        mPassword.addTextChangedListener(this);
        mOk = (Button)findViewById(0x102029a);
        mOk.setOnClickListener(this);
        mUpdateMonitor = keyguardupdatemonitor;
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, true);
    }

    private void asyncCheckPassword() {
        mCallback.pokeWakelock(30000);
        String s = mLogin.getText().toString();
        String s1 = mPassword.getText().toString();
        Account account = findIntendedAccount(s);
        if(account == null) {
            postOnCheckPasswordResult(false);
        } else {
            getProgressDialog().show();
            Bundle bundle = new Bundle();
            bundle.putString("password", s1);
            AccountManager.get(mContext).confirmCredentials(account, bundle, null, new AccountManagerCallback() {

                public void run(AccountManagerFuture accountmanagerfuture) {
                    mCallback.pokeWakelock(30000);
                    boolean flag = ((Bundle)accountmanagerfuture.getResult()).getBoolean("booleanResult");
                    postOnCheckPasswordResult(flag);
                    mLogin.post(new Runnable() {

                        public void run() {
                            getProgressDialog().hide();
                        }

                        final _cls2 this$1;

                     {
                        this$1 = _cls2.this;
                        super();
                    }
                    });
_L1:
                    return;
                    OperationCanceledException operationcanceledexception;
                    operationcanceledexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                      goto _L1
                    IOException ioexception;
                    ioexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                      goto _L1
                    AuthenticatorException authenticatorexception;
                    authenticatorexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                      goto _L1
                    Exception exception;
                    exception;
                    mLogin.post(new _cls1());
                    throw exception;
                }

                final AccountUnlockScreen this$0;

             {
                this$0 = AccountUnlockScreen.this;
                super();
            }
            }, null);
        }
    }

    private Account findIntendedAccount(String s) {
        Account aaccount[] = AccountManager.get(mContext).getAccountsByType("com.google");
        Account account = null;
        int i = 0;
        int j = aaccount.length;
        int k = 0;
        do {
            if(k < j) {
                Account account1 = aaccount[k];
                byte byte0 = 0;
                if(s.equals(account1.name))
                    byte0 = 4;
                else
                if(s.equalsIgnoreCase(account1.name))
                    byte0 = 3;
                else
                if(s.indexOf('@') < 0) {
                    int l = account1.name.indexOf('@');
                    if(l >= 0) {
                        String s1 = account1.name.substring(0, l);
                        if(s.equals(s1))
                            byte0 = 2;
                        else
                        if(s.equalsIgnoreCase(s1))
                            byte0 = 1;
                    }
                }
                if(byte0 > i) {
                    account = account1;
                    i = byte0;
                } else
                if(byte0 == i)
                    account = null;
                k++;
                continue;
            }
            return account;
        } while(true);
    }

    private Dialog getProgressDialog() {
        if(mCheckingDialog == null) {
            mCheckingDialog = new ProgressDialog(mContext);
            mCheckingDialog.setMessage(mContext.getString(0x1040326));
            mCheckingDialog.setIndeterminate(true);
            mCheckingDialog.setCancelable(false);
            mCheckingDialog.getWindow().setType(2009);
        }
        return mCheckingDialog;
    }

    private void postOnCheckPasswordResult(final boolean success) {
        mLogin.post(new Runnable() );
    }

    public void afterTextChanged(Editable editable) {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k) {
    }

    public void cleanUp() {
        if(mCheckingDialog != null)
            mCheckingDialog.hide();
        mUpdateMonitor.removeCallback(this);
        mCallback = null;
        mLockPatternUtils = null;
        mUpdateMonitor = null;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent) {
        boolean flag;
        if(keyevent.getAction() == 0 && keyevent.getKeyCode() == 4) {
            if(mLockPatternUtils.isPermanentlyLocked())
                mCallback.goToLockScreen();
            else
                mCallback.forgotPattern(false);
            flag = true;
        } else {
            flag = dispatchKeyEvent(keyevent);
        }
        return flag;
    }

    public boolean needsInput() {
        return true;
    }

    public void onClick(View view) {
        mCallback.pokeWakelock();
        if(view == mOk)
            asyncCheckPassword();
    }

    public void onPause() {
        mKeyguardStatusViewManager.onPause();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        return mLogin.requestFocus(i, rect);
    }

    public void onResume() {
        mLogin.setText("");
        mPassword.setText("");
        mLogin.requestFocus();
        mKeyguardStatusViewManager.onResume();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k) {
        mCallback.pokeWakelock(30000);
    }

    private static final int AWAKE_POKE_MILLIS = 30000;
    private static final String LOCK_PATTERN_CLASS = "com.android.settings.ChooseLockGeneric";
    private static final String LOCK_PATTERN_PACKAGE = "com.android.settings";
    private KeyguardScreenCallback mCallback;
    private ProgressDialog mCheckingDialog;
    private TextView mInstructions;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private EditText mLogin;
    private Button mOk;
    private EditText mPassword;
    private TextView mTopHeader;
    private KeyguardUpdateMonitor mUpdateMonitor;








}
