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
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.*;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import java.io.IOException;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class MiuiAccountUnlockScreen extends RelativeLayout
    implements KeyguardScreen, android.view.View.OnClickListener, TextWatcher {
    private final class ViewHolder {

        public ImageView mAccountIcon;
        public TextView mAccountId;
        final MiuiAccountUnlockScreen this$0;

        private ViewHolder() {
            this$0 = MiuiAccountUnlockScreen.this;
            super();
        }

    }


    public MiuiAccountUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils) {
        super(context);
        mAccounts = new ArrayList();
        mCallback = keyguardscreencallback;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater.from(context).inflate(0x6030038, this, true);
        mTopHeader = (TextView)findViewById(0x60b0077);
        TextView textview = mTopHeader;
        int i;
        BaseAdapter baseadapter;
        if(mLockPatternUtils.isPermanentlyLocked())
            i = 0x60c01d7;
        else
            i = 0x60c01d8;
        textview.setText(i);
        mInstructions = (TextView)findViewById(0x60b0078);
        mLogin = (Spinner)findViewById(0x60b0079);
        findAccounts();
        baseadapter = new BaseAdapter() {

            public int getCount() {
                return mAccounts.size();
            }

            public Object getItem(int j) {
                return null;
            }

            public long getItemId(int j) {
                return 0L;
            }

            public View getView(int j, View view, ViewGroup viewgroup) {
                ViewHolder viewholder;
                if(view == null) {
                    viewholder = new ViewHolder();
                    view = LayoutInflater.from(getContext()).inflate(0x6030039, null);
                    viewholder.mAccountIcon = (ImageView)view.findViewById(0x60b007c);
                    viewholder.mAccountId = (TextView)view.findViewById(0x60b007d);
                    view.setTag(viewholder);
                } else {
                    viewholder = (ViewHolder)view.getTag();
                }
                if(j < mGoogleAccountSize)
                    viewholder.mAccountIcon.setImageDrawable(mGoogleIcon);
                else
                    viewholder.mAccountIcon.setImageDrawable(mXiaomiIcon);
                viewholder.mAccountId.setText(((Account)mAccounts.get(j)).name);
                return view;
            }

            final MiuiAccountUnlockScreen this$0;

             {
                this$0 = MiuiAccountUnlockScreen.this;
                super();
            }
        };
        mLogin.setAdapter(baseadapter);
        mLogin.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {

            public void onItemSelected(AdapterView adapterview, View view, int j, long l) {
                mCurAccount = (Account)mAccounts.get(j);
            }

            public void onNothingSelected(AdapterView adapterview) {
                mCurAccount = null;
            }

            final MiuiAccountUnlockScreen this$0;

             {
                this$0 = MiuiAccountUnlockScreen.this;
                super();
            }
        });
        mPassword = (EditText)findViewById(0x60b007a);
        mPassword.addTextChangedListener(this);
        mOk = (Button)findViewById(0x60b007b);
        mOk.setOnClickListener(this);
        mUpdateMonitor = keyguardupdatemonitor;
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, true);
    }

    private void asyncCheckPassword() {
        mCallback.pokeWakelock(30000);
        String s = mPassword.getText().toString();
        if(mCurAccount == null) {
            postOnCheckPasswordResult(false);
        } else {
            getProgressDialog().show();
            Bundle bundle = new Bundle();
            bundle.putString("password", s);
            AccountManager.get(mContext).confirmCredentials(mCurAccount, bundle, null, new AccountManagerCallback() {

                public void run(AccountManagerFuture accountmanagerfuture) {
                    mCallback.pokeWakelock(30000);
                    boolean flag = ((Bundle)accountmanagerfuture.getResult()).getBoolean("booleanResult");
                    postOnCheckPasswordResult(flag);
                    mLogin.post(new Runnable() {

                        public void run() {
                            getProgressDialog().hide();
                        }

                        final _cls4 this$1;

                     {
                        this$1 = _cls4.this;
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

                final MiuiAccountUnlockScreen this$0;

             {
                this$0 = MiuiAccountUnlockScreen.this;
                super();
            }
            }, null);
        }
    }

    private void findAccounts() {
        AuthenticatorDescription aauthenticatordescription[] = AccountManager.get(mContext).getAuthenticatorTypes();
        int i = aauthenticatordescription.length;
        int j = 0;
        do {
            if(j < i) {
                AuthenticatorDescription authenticatordescription = aauthenticatordescription[j];
                Account aaccount[];
                int k;
                int l;
                Account aaccount1[];
                int i1;
                int j1;
                Account account;
                Account account1;
                try {
                    Context context = mContext.createPackageContext(authenticatordescription.packageName, 0);
                    if(authenticatordescription.type.equals("com.google"))
                        mGoogleIcon = context.getResources().getDrawable(authenticatordescription.iconId);
                    else
                    if(authenticatordescription.type.equals("com.xiaomi"))
                        mXiaomiIcon = context.getResources().getDrawable(authenticatordescription.iconId);
                }
                catch(android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
                catch(android.content.res.Resources.NotFoundException notfoundexception) { }
            } else {
                aaccount = AccountManager.get(mContext).getAccountsByType("com.google");
                mGoogleAccountSize = aaccount.length;
                k = aaccount.length;
                for(l = 0; l < k; l++) {
                    account1 = aaccount[l];
                    mAccounts.add(account1);
                }

                aaccount1 = AccountManager.get(mContext).getAccountsByType("com.xiaomi");
                i1 = aaccount1.length;
                for(j1 = 0; j1 < i1; j1++) {
                    account = aaccount1[j1];
                    mAccounts.add(account);
                }

                return;
            }
            j++;
        } while(true);
    }

    private Dialog getProgressDialog() {
        if(mCheckingDialog == null) {
            mCheckingDialog = new ProgressDialog(mContext);
            mCheckingDialog.setMessage(mContext.getString(0x60c01da));
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
        return mPassword.requestFocus(i, rect);
    }

    public void onResume() {
        mPassword.setText("");
        mPassword.requestFocus();
        mKeyguardStatusViewManager.onResume();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k) {
        mCallback.pokeWakelock(30000);
    }

    private static final int AWAKE_POKE_MILLIS = 30000;
    private static final String LOCK_PATTERN_CLASS = "com.android.settings.ChooseLockGeneric";
    private static final String LOCK_PATTERN_PACKAGE = "com.android.settings";
    private ArrayList mAccounts;
    private KeyguardScreenCallback mCallback;
    private ProgressDialog mCheckingDialog;
    private Account mCurAccount;
    private int mGoogleAccountSize;
    private Drawable mGoogleIcon;
    private TextView mInstructions;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private Spinner mLogin;
    private Button mOk;
    private EditText mPassword;
    private TextView mTopHeader;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private Drawable mXiaomiIcon;










/*
    static Account access$502(MiuiAccountUnlockScreen miuiaccountunlockscreen, Account account) {
        miuiaccountunlockscreen.mCurAccount = account;
        return account;
    }

*/




}
