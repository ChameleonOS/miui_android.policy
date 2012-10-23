// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.*;
import android.widget.TextView;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl:
//            IconUtilities

public class RecentApplicationsDialog extends Dialog
    implements android.view.View.OnClickListener {
    class RecentTag {

        android.app.ActivityManager.RecentTaskInfo info;
        Intent intent;
        final RecentApplicationsDialog this$0;

        RecentTag() {
            this$0 = RecentApplicationsDialog.this;
            super();
        }
    }


    public RecentApplicationsDialog(Context context) {
        super(context, 0x10302f3);
        mBroadcastIntentFilter = new IntentFilter("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        mHandler = new Handler();
        mCleanup = new Runnable() {

            public void run() {
                TextView atextview[] = mIcons;
                int i = atextview.length;
                for(int j = 0; j < i; j++) {
                    TextView textview = atextview[j];
                    textview.setCompoundDrawables(null, null, null, null);
                    textview.setTag(null);
                }

            }

            final RecentApplicationsDialog this$0;

             {
                this$0 = RecentApplicationsDialog.this;
                super();
            }
        };
        mBroadcastReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                if("android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(intent.getAction()) && !"recentapps".equals(intent.getStringExtra("reason")))
                    dismiss();
            }

            final RecentApplicationsDialog this$0;

             {
                this$0 = RecentApplicationsDialog.this;
                super();
            }
        };
    }

    private void reloadButtons() {
        Context context = getContext();
        PackageManager packagemanager = context.getPackageManager();
        List list = ((ActivityManager)context.getSystemService("activity")).getRecentTasks(16, 2);
        ActivityInfo activityinfo = (new Intent("android.intent.action.MAIN")).addCategory("android.intent.category.HOME").resolveActivityInfo(packagemanager, 0);
        IconUtilities iconutilities = new IconUtilities(getContext());
        int i = 0;
        int j = list.size();
        int k = 0;
        while(k < j && i < 8)  {
            android.app.ActivityManager.RecentTaskInfo recenttaskinfo = (android.app.ActivityManager.RecentTaskInfo)list.get(k);
            Intent intent = new Intent(recenttaskinfo.baseIntent);
            if(recenttaskinfo.origActivity != null)
                intent.setComponent(recenttaskinfo.origActivity);
            if(activityinfo == null || !activityinfo.packageName.equals(intent.getComponent().getPackageName()) || !activityinfo.name.equals(intent.getComponent().getClassName())) {
                intent.setFlags(0x10000000 | 0xffdfffff & intent.getFlags());
                ResolveInfo resolveinfo = packagemanager.resolveActivity(intent, 0);
                if(resolveinfo != null) {
                    ActivityInfo activityinfo1 = resolveinfo.activityInfo;
                    String s = activityinfo1.loadLabel(packagemanager).toString();
                    android.graphics.drawable.Drawable drawable = activityinfo1.loadIcon(packagemanager);
                    if(s != null && s.length() > 0 && drawable != null) {
                        TextView textview = mIcons[i];
                        textview.setText(s);
                        textview.setCompoundDrawables(null, iconutilities.createIconDrawable(drawable), null, null);
                        RecentTag recenttag = new RecentTag();
                        recenttag.info = recenttaskinfo;
                        recenttag.intent = intent;
                        textview.setTag(recenttag);
                        textview.setVisibility(0);
                        textview.setPressed(false);
                        textview.clearFocus();
                        i++;
                    }
                }
            }
            k++;
        }
        View view = mNoAppsText;
        int l;
        if(i == 0)
            l = 0;
        else
            l = 8;
        view.setVisibility(l);
        for(; i < 8; i++)
            mIcons[i].setVisibility(8);

    }

    private void switchTo(RecentTag recenttag) {
        if(recenttag.info.id < 0) goto _L2; else goto _L1
_L1:
        ((ActivityManager)getContext().getSystemService("activity")).moveTaskToFront(recenttag.info.id, 1);
_L4:
        return;
_L2:
        if(recenttag.intent != null) {
            recenttag.intent.addFlags(0x104000);
            try {
                getContext().startActivity(recenttag.intent);
            }
            catch(ActivityNotFoundException activitynotfoundexception) {
                Log.w("Recent", "Unable to launch recent task", activitynotfoundexception);
            }
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void dismissAndSwitch() {
        int i;
        RecentTag recenttag;
        int j;
        i = mIcons.length;
        recenttag = null;
        j = 0;
_L5:
        if(j < i && mIcons[j].getVisibility() == 0) goto _L2; else goto _L1
_L1:
        if(recenttag != null)
            switchTo(recenttag);
        dismiss();
        return;
_L2:
        if(j != 0 && !mIcons[j].hasFocus())
            break; /* Loop/switch isn't completed */
        recenttag = (RecentTag)mIcons[j].getTag();
        if(mIcons[j].hasFocus()) goto _L1; else goto _L3
_L3:
        j++;
        if(true) goto _L5; else goto _L4
_L4:
    }

    public void onClick(View view) {
        TextView atextview[] = mIcons;
        int i = atextview.length;
        int j = 0;
        do {
label0:
            {
                if(j < i) {
                    TextView textview = atextview[j];
                    if(textview != view)
                        break label0;
                    switchTo((RecentTag)textview.getTag());
                }
                dismiss();
                return;
            }
            j++;
        } while(true);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context context = getContext();
        if(sStatusBar == null)
            sStatusBar = (StatusBarManager)context.getSystemService("statusbar");
        Window window = getWindow();
        window.requestFeature(1);
        window.setType(2008);
        window.setFlags(0x20000, 0x20000);
        window.setTitle("Recents");
        setContentView(0x1090090);
        android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
        layoutparams.width = -1;
        layoutparams.height = -1;
        window.setAttributes(layoutparams);
        window.setFlags(0, 2);
        mIcons[0] = (TextView)findViewById(0x1020310);
        mIcons[1] = (TextView)findViewById(0x1020019);
        mIcons[2] = (TextView)findViewById(0x102001a);
        mIcons[3] = (TextView)findViewById(0x102001b);
        mIcons[4] = (TextView)findViewById(0x1020311);
        mIcons[5] = (TextView)findViewById(0x1020312);
        mIcons[6] = (TextView)findViewById(0x1020313);
        mIcons[7] = (TextView)findViewById(0x1020314);
        mNoAppsText = findViewById(0x102030f);
        TextView atextview[] = mIcons;
        int i = atextview.length;
        for(int j = 0; j < i; j++)
            atextview[j].setOnClickListener(this);

    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        boolean flag;
        boolean flag1;
        int k;
        flag = true;
        if(i != 61)
            break MISSING_BLOCK_LABEL_177;
        flag1 = keyevent.isShiftPressed();
        int j = mIcons.length;
        for(k = 0; k < j && mIcons[k].getVisibility() == 0; k++);
        if(k == 0) goto _L2; else goto _L1
_L1:
        int l;
        int i1;
        int j1;
        if(flag1)
            l = k - 1;
        else
            l = 0;
        i1 = 0;
_L7:
        if(i1 >= k) goto _L4; else goto _L3
_L3:
        if(!mIcons[i1].hasFocus()) goto _L6; else goto _L5
_L5:
        if(flag1)
            l = (-1 + (i1 + k)) % k;
        else
            l = (i1 + 1) % k;
_L4:
        if(flag1)
            j1 = ((flag) ? 1 : 0);
        else
            j1 = 2;
        if(mIcons[l].requestFocus(j1))
            mIcons[l].playSoundEffect(SoundEffectConstants.getContantForFocusDirection(j1));
_L2:
        return flag;
_L6:
        i1++;
          goto _L7
        flag = super.onKeyDown(i, keyevent);
          goto _L2
    }

    public void onStart() {
        super.onStart();
        reloadButtons();
        if(sStatusBar != null)
            sStatusBar.disable(0x10000);
        getContext().registerReceiver(mBroadcastReceiver, mBroadcastIntentFilter);
        mHandler.removeCallbacks(mCleanup);
    }

    public void onStop() {
        super.onStop();
        if(sStatusBar != null)
            sStatusBar.disable(0);
        getContext().unregisterReceiver(mBroadcastReceiver);
        mHandler.postDelayed(mCleanup, 100L);
    }

    private static final boolean DBG_FORCE_EMPTY_LIST = false;
    private static final int MAX_RECENT_TASKS = 16;
    private static final int NUM_BUTTONS = 8;
    private static StatusBarManager sStatusBar;
    IntentFilter mBroadcastIntentFilter;
    private BroadcastReceiver mBroadcastReceiver;
    Runnable mCleanup;
    Handler mHandler;
    final TextView mIcons[] = new TextView[8];
    View mNoAppsText;
}
