// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.INotificationManager;
import android.app.NotificationManager;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.*;
import android.graphics.*;
import android.media.AudioSystem;
import android.net.Uri;
import android.os.*;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.*;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import com.google.android.mms.pdu.EncodedStringValue;
import com.miui.internal.policy.impl.*;
import java.io.*;
import java.lang.ref.SoftReference;
import java.util.*;
import miui.net.FirewallManager;
import miui.security.ChooseLockSettingsHelper;
import miui.telephony.PhoneNumberUtils;
import miui.util.AudioOutputHelper;
import miui.util.HapticFeedbackUtil;
import miui.widget.SpectrumVisualizer;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, QcomCallback, KeyguardUpdateMonitor

public class MiuiLockScreen extends FrameLayout
    implements KeyguardScreen, KeyguardUpdateMonitor.InfoCallback, KeyguardUpdateMonitor.SimStateCallback, com.miui.internal.policy.impl.SlidingPanel.OnTriggerListener, QcomCallback {
    private class MusicController
        implements android.view.View.OnTouchListener {

        private void enableMusicControl(boolean flag) {
            View view = mMusicControl;
            int i;
            if(flag)
                i = 0;
            else
                i = 8;
            view.setVisibility(i);
            if(!flag) goto _L2; else goto _L1
_L1:
            mControlViewType = 4;
            setControlView(mMusicControl, null);
_L4:
            return;
_L2:
            mMusicStatus = 0;
            if(mControlViewType == 4)
                updateControlView();
            if(true) goto _L4; else goto _L3
_L3:
        }

        private void hideAlbum() {
            mAlbumView.clearAnimation();
            mTempAlbumView.clearAnimation();
            mTempAlbumView.setVisibility(8);
            mAlbumView.setDisplayBitmap(null);
            mTempAlbumView.setDisplayBitmap(null);
            updateBackground();
        }

        private boolean isAlbumShow() {
            boolean flag;
            if(mAlbumBm != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        private void requestAlbum() {
            if(mAlbumChanged) {
                Intent intent = new Intent("lockscreen.action.SONG_METADATA_REQUEST");
                
// JavaClassFileOutputException: get_constant: invalid tag

        private void requestAlbum(Intent intent) {
            requestAlbum(intent, false);
        }

        private void sendMediaButtonBroadcast(int i, int j) {
            long l = SystemClock.uptimeMillis();
            KeyEvent keyevent = new KeyEvent(l, l, i, j, 0);
            Intent intent = new Intent("android.intent.action.MEDIA_BUTTON", null);
            intent.putExtra("forbid_double_click", true);
            intent.putExtra("android.intent.extra.KEY_EVENT", KeyEvent.changeFlags(keyevent, 8));
            
// JavaClassFileOutputException: get_constant: invalid tag

        private void setAlbumInfo(Intent intent) {
            if(mEnable) goto _L2; else goto _L1
_L1:
            return;
_L2:
            mAlbumChanged = false;
            mAlbumName = intent.getStringExtra("album");
            mArtistName = intent.getStringExtra("artist");
            String s = intent.getStringExtra("tmp_album_path");
            if(s == null)
                break MISSING_BLOCK_LABEL_119;
            Bitmap bitmap = BitmapFactory.decodeFile(s);
            if(bitmap == null)
                break MISSING_BLOCK_LABEL_119;
            mAlbumBm = bitmap;
_L3:
            OutOfMemoryError outofmemoryerror;
            if(mAlbumBm != null) {
                mAlbumView.setDisplayBitmap(mAlbumBm);
                mMusicBatteryIndicator.setVisibility(8);
            } else {
                mAlbumView.setDisplayBitmap(mDefaultAlbum);
                mMusicBatteryIndicator.setVisibility(0);
            }
            if(mTempAlbumBm != null)
                mTempAlbumView.setDisplayBitmap(mTempAlbumBm);
            else
                mTempAlbumView.setDisplayBitmap(mDefaultAlbum);
            startTrackChangeAnim();
              goto _L1
            mAlbumBm = null;
              goto _L3
            outofmemoryerror;
            mAlbumBm = null;
            if(mAlbumBm != null) {
                mAlbumView.setDisplayBitmap(mAlbumBm);
                mMusicBatteryIndicator.setVisibility(8);
            } else {
                mAlbumView.setDisplayBitmap(mDefaultAlbum);
                mMusicBatteryIndicator.setVisibility(0);
            }
            if(mTempAlbumBm != null)
                mTempAlbumView.setDisplayBitmap(mTempAlbumBm);
            else
                mTempAlbumView.setDisplayBitmap(mDefaultAlbum);
            startTrackChangeAnim();
              goto _L1
            Exception exception;
            exception;
            if(mAlbumBm != null) {
                mAlbumView.setDisplayBitmap(mAlbumBm);
                mMusicBatteryIndicator.setVisibility(8);
            } else {
                mAlbumView.setDisplayBitmap(mDefaultAlbum);
                mMusicBatteryIndicator.setVisibility(0);
            }
            if(mTempAlbumBm != null)
                mTempAlbumView.setDisplayBitmap(mTempAlbumBm);
            else
                mTempAlbumView.setDisplayBitmap(mDefaultAlbum);
            startTrackChangeAnim();
            throw exception;
        }

        private void setTrackInfo(Intent intent) {
            String s;
            String s1;
            s = intent.getStringExtra("track");
            s1 = intent.getStringExtra("artist");
            mIsOnlineSongBlocking = false;
            if(!TextUtils.isEmpty(s) || !TextUtils.isEmpty(s1)) goto _L2; else goto _L1
_L1:
            mMusicTitle.setVisibility(8);
_L4:
            return;
_L2:
            if(!TextUtils.isEmpty(s))
                break; /* Loop/switch isn't completed */
            mMusicTitle.setText(s1);
_L5:
            mMusicTitle.setVisibility(0);
            mMusicTitle.setSelected(true);
            if(true) goto _L4; else goto _L3
_L3:
            if(TextUtils.isEmpty(s1)) {
                mMusicTitle.setText(s);
            } else {
                TextView textview = mMusicTitle;
                Object aobj[] = new Object[2];
                aobj[0] = s;
                aobj[1] = s1;
                textview.setText(String.format("%s-%s", aobj));
            }
              goto _L5
            if(true) goto _L4; else goto _L6
_L6:
        }

        private void setupMusicControl() {
            mMusicControl = View.inflate(
// JavaClassFileOutputException: get_constant: invalid tag

        private void showAlbum() {
            mTempAlbumView.setVisibility(8);
            mAlbumView.setVisibility(0);
            if(mAlbumBm != null) {
                mAlbumView.setDisplayBitmap(mAlbumBm);
                mMusicBatteryIndicator.setVisibility(8);
            } else {
                mAlbumView.setDisplayBitmap(mDefaultAlbum);
                mMusicBatteryIndicator.setVisibility(0);
            }
            updateBackground();
        }

        private void startAlbumAnim(int i) {
            mAlbumView.clearAnimation();
            i;
            JVM INSTR tableswitch 0 2: default 36
        //                       0 69
        //                       1 37
        //                       2 55;
               goto _L1 _L2 _L3 _L4
_L1:
            return;
_L3:
            mMusicControl.startAnimation(mAlbumFadeInAnim);
            showAlbum();
            continue; /* Loop/switch isn't completed */
_L4:
            mMusicControl.startAnimation(mAlbumFadeOutAnim);
            continue; /* Loop/switch isn't completed */
_L2:
            mMusicControl.clearAnimation();
            if(true) goto _L1; else goto _L5
_L5:
        }

        private void startTrackChangeAnim() {
            mAlbumView.clearAnimation();
            mTempAlbumView.clearAnimation();
            updateBackground();
            mTempAlbumView.setVisibility(0);
            mTempAlbumView.startAnimation(mAlbumFadeOutAnim);
        }

        private void updateMusic() {
            if(mMusicControl != null) goto _L2; else goto _L1
_L1:
            return;
_L2:
            boolean flag = AudioSystem.isStreamActive(3, 0);
            boolean flag1 = flag;
            if(mIsOnlineSongBlocking)
                flag1 = true;
            ImageView imageview = mMusicPlayPauseButton;
            int i;
            if(flag1)
                i = 0x60200ae;
            else
                i = 0x60200b1;
            imageview.setImageResource(i);
            switch(mMusicStatus) {
            case 1: // '\001'
                if(flag)
                    mMusicStatus = 2;
                break;

            case 2: // '\002'
                if(!flag)
                    mMusicStatus = 1;
                break;
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        private void updateSpectrumVisualizer() {
            boolean flag = false;
            if(mSpectrumVisualizer != null) {
                if(AudioSystem.isStreamActive(3, 0) && mMusicControl.getVisibility() == 0 && !isPaused)
                    flag = true;
                mSpectrumVisualizer.enableUpdate(flag);
            }
        }

        public void addCheckStreamCallbacks() {
            addCheckStreamCallbacks(1000);
        }

        public void addCheckStreamCallbacks(int i) {
            removeCheckStreamCallbacks();
            postDelayed(mCheckStreamMusicRunnable, i);
        }

        public void clearAnimation() {
            if(mMusicControl != null)
                mMusicControl.clearAnimation();
        }

        public void enableAlbum(boolean flag) {
            mEnable = flag;
            if(mAlbumChanged) {
                mAlbumBm = null;
                mTempAlbumBm = null;
            }
            if(flag) {
                boolean flag1 = AudioSystem.isStreamActive(3, 0);
                if(mIsOnlineSongBlocking || flag1)
                    requestAlbum();
            }
        }

        public View getMusicControl() {
            if(mMusicControl == null)
                setupMusicControl();
            updateMusic();
            return mMusicControl;
        }

        public void init() {
            mAlbumFadeInAnim = AnimationUtils.loadAnimation(
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean isMusicControlVisible() {
            boolean flag;
            if(mMusicControl != null && mMusicControl.getVisibility() == 0)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public boolean isMusicStatusNone() {
            boolean flag;
            if(mMusicStatus == 0)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public void onPause() {
            removeCallbacks(mEnableSpectrumVisualizerRunnable);
            if(mMusicControl != null) {
                enableMusicControl(false);
                enableAlbum(false);
            }
            removeCheckStreamCallbacks();
            updateSpectrumVisualizer();
        }

        public void onResume() {
            if(!AudioOutputHelper.hasActiveReceivers(
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean onTouch(View view, MotionEvent motionevent) {
            boolean flag;
            byte byte0;
            flag = false;
            byte0 = 85;
            view.getId();
            JVM INSTR tableswitch 101384258 101384259: default 32
        //                       101384258 72
        //                       101384259 79;
               goto _L1 _L2 _L3
_L1:
            break; /* Loop/switch isn't completed */
_L3:
            break MISSING_BLOCK_LABEL_79;
_L4:
            int i = 0xff & motionevent.getAction();
            if(i == 0) {
                mSelector.requestDisallowInterceptTouchEvent(true);
                sendMediaButtonBroadcast(0, byte0);
                view.setPressed(true);
            } else
            if(i == 1 || i == 3) {
                sendMediaButtonBroadcast(1, byte0);
                view.setPressed(false);
                if(byte0 == 85 && mMusicStatus == 2)
                    flag = true;
                ImageView imageview = mMusicPlayPauseButton;
                int j;
                int k;
                if(flag)
                    j = 0x60200b1;
                else
                    j = 0x60200ae;
                imageview.setImageResource(j);
                if(flag)
                    k = 1;
                else
                    k = 2;
                mMusicStatus = k;
                mSpectrumVisualizer.enableUpdate(true);
                addCheckStreamCallbacks(3000);
            }
            return true;
_L2:
            byte0 = 88;
              goto _L4
            byte0 = 87;
              goto _L4
        }

        public void registerPlayerStatusListener() {
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("com.miui.player.metachanged");
            intentfilter.addAction("lockscreen.action.SONG_METADATA_UPDATED");
            intentfilter.addAction("com.miui.player.refreshprogress");
            intentfilter.addAction("com.miui.player.playstatechanged");
            
// JavaClassFileOutputException: get_constant: invalid tag

        public void removeCheckStreamCallbacks() {
            removeCallbacks(mCheckStreamMusicRunnable);
        }

        public void requestAlbum(Intent intent, boolean flag) {
            mAlbumChanged = true;
            if(mEnable) goto _L2; else goto _L1
_L1:
            return;
_L2:
            String s;
            String s1;
            s = intent.getStringExtra("album");
            s1 = intent.getStringExtra("artist");
            if(s == null)
                s = "";
            if(s1 == null)
                s1 = "";
            if(!flag && (s.equals(mAlbumName) && s1.equals(mArtistName) && mAlbumBm != null || !mEnable)) goto _L4; else goto _L3
_L3:
            Uri uri;
            boolean flag1;
            uri = (Uri)intent.getParcelableExtra("album_uri");
            flag1 = false;
            if(uri == null) goto _L6; else goto _L5
_L5:
            flag1 = true;
_L7:
            mTempAlbumBm = mAlbumBm;
            mAlbumBm = null;
            mTempAlbumView.setDisplayBitmap(null);
            if(flag1)
                requestAlbum();
            else
                startTrackChangeAnim();
_L4:
            if(true) goto _L1; else goto _L6
_L6:
            if(intent.getStringExtra("album_path") != null)
                flag1 = true;
              goto _L7
        }

        public void setBatteryIndicator(int i) {
            if(mMusicBatteryIndicator != null)
                mMusicBatteryIndicator.setImageResource(mMusicBatteryIndicatorId);
        }

        public boolean shouldShowMusic() {
            boolean flag = true;
            if(mMusicStatus == 2 || mMusicStatus == flag) {
                if(mMusicControl == null)
                    setupMusicControl();
            } else {
                flag = false;
            }
            return flag;
        }

        public void toggleMusicControl() {
            int i = 2;
            if(mMusicControl == null)
                setupMusicControl();
            boolean flag;
            boolean flag1;
            if(mMusicControl.getVisibility() == 0)
                flag = true;
            else
                flag = false;
            flag1 = AudioSystem.isStreamActive(3, 0);
            if(!flag) {
                mControlViewType = 4;
                if(flag1)
                    mMusicStatus = i;
                else
                    mMusicStatus = 1;
                enableMusicControl(true);
                enableAlbum(true);
                startAlbumAnim(1);
            } else {
                mMusicStatus = 0;
                mControlViewType = 0;
                enableAlbum(false);
                if(mShowingBatteryInfo)
                    i = 0;
                startAlbumAnim(i);
                enableMusicControl(false);
            }
        }

        public void unregisterPlayerStatusListener() {
            
// JavaClassFileOutputException: get_constant: invalid tag

        private static final int ANIM_FADEIN = 1;
        private static final int ANIM_FADEOUT = 2;
        private static final int ANIM_NONE = 0;
        private static final int CHECK_STREAM_MUSIC_DELAY = 1000;
        private static final int MUSIC_SHOW_NONE = 0;
        private static final int MUSIC_SHOW_PLAY = 2;
        private static final int MUSIC_SHOW_STOP = 1;
        private Bitmap mAlbumBm;
        private boolean mAlbumChanged;
        private Animation mAlbumFadeInAnim;
        private Animation mAlbumFadeOutAnim;
        private String mAlbumName;
        private AlbumFrameView mAlbumView;
        private String mArtistName;
        private Runnable mCheckStreamMusicRunnable;
        private Bitmap mDefaultAlbum;
        private boolean mEnable;
        private Runnable mEnableSpectrumVisualizerRunnable;
        private final Handler mHandler = new Handler();
        private boolean mIsOnlineSongBlocking;
        private ImageView mMusicBatteryIndicator;
        private int mMusicBatteryIndicatorId;
        private View mMusicControl;
        private ImageView mMusicPlayPauseButton;
        private int mMusicStatus;
        private TextView mMusicTitle;
        private BroadcastReceiver mPlayerStatusListener;
        private SpectrumVisualizer mSpectrumVisualizer;
        private Bitmap mTempAlbumBm;
        private AlbumFrameView mTempAlbumView;
        final MiuiLockScreen this$0;














/*
        static boolean access$3002(MusicController musiccontroller, boolean flag) {
            musiccontroller.mIsOnlineSongBlocking = flag;
            return flag;
        }

*/




        public MusicController() {
            this$0 = MiuiLockScreen.this;
            super();
            mCheckStreamMusicRunnable = new Runnable() {

                public void run() {
                    updateMusic();
                    updateSpectrumVisualizer();
                    addCheckStreamCallbacks();
                }

                final MusicController this$1;

                 {
                    this$1 = MusicController.this;
                    super();
                }
            };
            mPlayerStatusListener = new BroadcastReceiver() {

                public void onReceive(Context context, Intent intent) {
                    if(mMusicControl != null) goto _L2; else goto _L1
_L1:
                    return;
_L2:
                    String s = intent.getAction();
                    if(intent.getBooleanExtra("playing", false))
                        if("com.miui.player.metachanged".equals(s)) {
                            String s1 = intent.getStringExtra("other");
                            if("meta_changed_track".equals(s1)) {
                                setTrackInfo(intent);
                                requestAlbum(intent);
                            } else
                            if("meta_changed_album".equals(s1))
                                requestAlbum(intent, true);
                        } else
                        if("lockscreen.action.SONG_METADATA_UPDATED".equals(s)) {
                            setTrackInfo(intent);
                            setAlbumInfo(intent);
                        } else
                        if("com.miui.player.refreshprogress".equals(s))
                            mIsOnlineSongBlocking = intent.getBooleanExtra("blocking", false);
                        else
                        if("com.miui.player.playstatechanged".equals(s) && mMusicTitle.getVisibility() == 8) {
                            setTrackInfo(intent);
                            requestAlbum(intent);
                        }
                    if(true) goto _L1; else goto _L3
_L3:
                }

                final MusicController this$1;

                 {
                    this$1 = MusicController.this;
                    super();
                }
            };
            mEnableSpectrumVisualizerRunnable = new Runnable() {

                public void run() {
                    removeCallbacks(mEnableSpectrumVisualizerRunnable);
                    updateSpectrumVisualizer();
                }

                final MusicController this$1;

                 {
                    this$1 = MusicController.this;
                    super();
                }
            };
        }

        // Unreferenced inner class com/android/internal/policy/impl/MiuiLockScreen$MusicController$1

/* anonymous class */
        class _cls1
            implements android.view.animation.Animation.AnimationListener {

            public void onAnimationEnd(Animation animation) {
                if(mAlbumBm != null) {
                    mAlbumView.setDisplayBitmap(mAlbumBm);
                    mMusicBatteryIndicator.setVisibility(8);
                } else {
                    mAlbumView.setDisplayBitmap(mDefaultAlbum);
                    mMusicBatteryIndicator.setVisibility(0);
                }
                mAlbumView.setVisibility(0);
                mTempAlbumView.setDisplayBitmap(null);
                mTempAlbumView.setVisibility(8);
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }

            final MusicController this$1;

                 {
                    this$1 = MusicController.this;
                    super();
                }
        }

    }

    private static final class QueryHandler extends AsyncQueryHandler {
        protected class CatchingWorkerHandler extends android.content.AsyncQueryHandler.WorkerHandler {

            public void handleMessage(Message message) {
                handleMessage(message);
_L1:
                return;
                SQLiteDiskIOException sqlitediskioexception;
                sqlitediskioexception;
                Log.w("LockScreen", "Exception on background worker thread", sqlitediskioexception);
                  goto _L1
                SQLiteFullException sqlitefullexception;
                sqlitefullexception;
                Log.w("LockScreen", "Exception on background worker thread", sqlitefullexception);
                  goto _L1
                SQLiteDatabaseCorruptException sqlitedatabasecorruptexception;
                sqlitedatabasecorruptexception;
                Log.w("LockScreen", "Exception on background worker thread", sqlitedatabasecorruptexception);
                  goto _L1
            }

            final QueryHandler this$0;

            public CatchingWorkerHandler(Looper looper) {
                this$0 = QueryHandler.this;
                super(QueryHandler.this, looper);
            }
        }


        public void closeCursor() {
            mAdapter.changeCursor(null);
        }

        protected Handler createHandler(Looper looper) {
            return new CatchingWorkerHandler(looper);
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor) {
            int j = 0;
            mAdapter.setLoading(false);
            mAdapter.changeCursor(cursor);
            PreviewCursorAdpater previewcursoradpater = mAdapter;
            if(cursor != null)
                j = cursor.getCount();
            previewcursoradpater.onQueryResultCount(j);
        }

        private final PreviewCursorAdpater mAdapter;

        public QueryHandler(Context context, PreviewCursorAdpater previewcursoradpater) {
            super(context.getContentResolver());
            mAdapter = previewcursoradpater;
        }
    }

    private class SmsPreviewListAdapter extends PreviewCursorAdpater {
        public final class ListItemViews {

            TextView dateView;
            TextView line1View;
            TextView textView;
            final SmsPreviewListAdapter this$1;

            public ListItemViews() {
                this$1 = SmsPreviewListAdapter.this;
                super();
            }
        }


        public void bindView(View view, Context context, Cursor cursor) {
            ListItemViews listitemviews;
            String s;
            long l;
            String s1;
            listitemviews = (ListItemViews)view.getTag();
            s = cursor.getString(1);
            l = cursor.getLong(2);
            int i = cursor.getInt(3);
            s1 = cursor.getString(4);
            if(s1 == null)
                s1 = "";
            if(i <= 7 || TextUtils.isEmpty(s1))
                break MISSING_BLOCK_LABEL_114;
            String s4;
            Integer integer = Integer.valueOf(cursor.getInt(5));
            if(integer == null)
                break MISSING_BLOCK_LABEL_114;
            s4 = (new EncodedStringValue(integer.intValue(), s1.getBytes("iso-8859-1"))).getString();
            s1 = s4;
_L2:
            PreviewCursorAdpater.ContactInfo contactinfo = getContact(s);
            ChooseLockSettingsHelper chooselocksettingshelper;
            boolean flag;
            TextView textview1;
            if(contactinfo != null && !TextUtils.isEmpty(contactinfo.name)) {
                listitemviews.line1View.setText((new StringBuilder()).append(contactinfo.name).append("  ").append(getValidatedNumber(s)).toString());
            } else {
                String s2 = PhoneNumberUtils.parseTelocationString(super.mContext, s);
                TextView textview = listitemviews.line1View;
                String s3;
                if(TextUtils.isEmpty(s2))
                    s3 = getValidatedNumber(s);
                else
                    s3 = (new StringBuilder()).append(getValidatedNumber(s)).append("  ").append(s2).toString();
                textview.setText(s3);
            }
            chooselocksettingshelper = new ChooseLockSettingsHelper(context);
            if(android.provider.Settings.System.getInt(context.getContentResolver(), "pref_key_enable_notification_body", 1) == 1 && (!FirewallManager.isAccessControlProtected(context, "com.android.mms") || !chooselocksettingshelper.isACLockEnabled()) && !chooselocksettingshelper.isPrivacyModeEnabled())
                flag = true;
            else
                flag = false;
            textview1 = listitemviews.textView;
            if(!flag)
                s1 = "";
            textview1.setText(s1);
            listitemviews.dateView.setText(formatDate(l));
            return;
            UnsupportedEncodingException unsupportedencodingexception;
            unsupportedencodingexception;
            if(true) goto _L2; else goto _L1
_L1:
        }

        public void markRead(Context context, int i) {
            Cursor cursor = (Cursor)getItem(i);
            long l = cursor.getLong(0);
            int j = cursor.getInt(3);
            ContentValues contentvalues = new ContentValues();
            if(j < 7) {
                contentvalues.put("seen", Integer.valueOf(1));
                ContentResolver contentresolver1 = context.getContentResolver();
                Uri uri1 = android.provider.Telephony.Sms.Inbox.CONTENT_URI;
                String as1[] = new String[1];
                as1[0] = String.valueOf(l);
                contentresolver1.update(uri1, contentvalues, "_id=?", as1);
            } else {
                contentvalues.put("seen", Integer.valueOf(1));
                ContentResolver contentresolver = context.getContentResolver();
                Uri uri = android.provider.Telephony.Mms.Inbox.CONTENT_URI;
                String as[] = new String[1];
                as[0] = String.valueOf(l);
                contentresolver.update(uri, contentvalues, "_id=?", as);
            }
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewgroup) {
            View view = newView(context, cursor, viewgroup);
            ListItemViews listitemviews = new ListItemViews();
            listitemviews.line1View = (TextView)view.findViewById(0x60b0033);
            listitemviews.textView = (TextView)view.findViewById(0x60b0037);
            listitemviews.dateView = (TextView)view.findViewById(0x60b0035);
            view.setTag(listitemviews);
            return view;
        }

        protected void onContentChanged() {
            onContentChanged();
            if(getCount() > 0 && android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "pref_key_enable_notification", 1) == 1 && android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "pref_key_enable_wake_up_screen", 1) == 1)
                mCallback.pokeWakelock(25000);
        }

        protected void onQueryResultCount(int i) {
            if(i <= 0) goto _L2; else goto _L1
_L1:
            mSelector.setSliderText(2, String.valueOf(i));
_L4:
            return;
_L2:
            if(mSelector.getSliderTextVisibility(2) == 0) {
                mSelector.setSliderText(2, null);
                Intent intent = new Intent("android.provider.Telephony.DISMISS_NEW_MESSAGE_NOTIFICATION");
                super.mContext.sendBroadcast(intent);
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        final MiuiLockScreen this$0;

        public SmsPreviewListAdapter(Context context, Cursor cursor) {
            this$0 = MiuiLockScreen.this;
            super(context, 0x6030015, cursor);
        }
    }

    private class CallLogPreviewListAdapter extends PreviewCursorAdpater {
        public final class ListItemViews {

            TextView dateView;
            TextView durationView;
            TextView line1View;
            TextView numberView;
            final CallLogPreviewListAdapter this$1;

            public ListItemViews() {
                this$1 = CallLogPreviewListAdapter.this;
                super();
            }
        }


        private String formatRingDuration(Context context, long l) {
            long l1 = 1L + l / 5L;
            Object aobj[] = new Object[1];
            aobj[0] = Long.valueOf(l1);
            return context.getString(0x60c003f, aobj);
        }

        public void bindView(View view, Context context, Cursor cursor) {
            ListItemViews listitemviews = (ListItemViews)view.getTag();
            String s = cursor.getString(1);
            String s1 = cursor.getString(4);
            PreviewCursorAdpater.ContactInfo contactinfo = getContact(s);
            if(contactinfo != null && !TextUtils.isEmpty(contactinfo.name))
                s1 = contactinfo.name;
            String s2 = PhoneNumberUtils.parseTelocationString(super.mContext, s);
            if(TextUtils.isEmpty(s2))
                s2 = "";
            long l;
            long l1;
            if(!TextUtils.isEmpty(s1)) {
                listitemviews.line1View.setText(s1);
                String s3 = getValidatedNumber(s);
                TextView textview = listitemviews.numberView;
                Object aobj[] = new Object[2];
                aobj[0] = s3;
                aobj[1] = s2;
                textview.setText(String.format("%s  %s", aobj));
            } else {
                listitemviews.line1View.setText(getValidatedNumber(s));
                listitemviews.numberView.setText(s2);
            }
            l = cursor.getLong(2);
            listitemviews.dateView.setText(formatDate(l));
            l1 = cursor.getLong(3);
            listitemviews.durationView.setText(formatRingDuration(super.mContext, l1));
        }

        public void markRead(Context context, int i) {
            long l = ((Cursor)getItem(i)).getLong(0);
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("new", Integer.valueOf(0));
            ContentResolver contentresolver = context.getContentResolver();
            Uri uri = android.provider.CallLog.Calls.CONTENT_URI;
            String as[] = new String[1];
            as[0] = String.valueOf(l);
            contentresolver.update(uri, contentvalues, "_id=?", as);
        }

        public View newView(Context context, Cursor cursor, ViewGroup viewgroup) {
            View view = newView(context, cursor, viewgroup);
            ListItemViews listitemviews = new ListItemViews();
            listitemviews.line1View = (TextView)view.findViewById(0x60b0033);
            listitemviews.numberView = (TextView)view.findViewById(0x60b0034);
            listitemviews.dateView = (TextView)view.findViewById(0x60b0035);
            listitemviews.durationView = (TextView)view.findViewById(0x60b0036);
            view.setTag(listitemviews);
            return view;
        }

        protected void onQueryResultCount(int i) {
            if(i <= 0) goto _L2; else goto _L1
_L1:
            mSelector.setSliderText(0, String.valueOf(i));
_L4:
            return;
_L2:
            if(mSelector.getSliderTextVisibility(0) == 0) {
                mSelector.setSliderText(0, null);
                try {
                    NotificationManager.getService().cancelNotificationWithTag("com.android.phone", null, 1);
                }
                catch(RemoteException remoteexception) {
                    remoteexception.printStackTrace();
                }
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        static final int CALLER_NAME_COLUMN_INDEX = 4;
        static final int DATE_COLUMN_INDEX = 2;
        static final int DURATION_COLUMN_INDEX = 3;
        static final int ID_COLUMN_INDEX = 0;
        static final int NUMBER_COLUMN_INDEX = 1;
        final MiuiLockScreen this$0;

        public CallLogPreviewListAdapter(Context context, Cursor cursor) {
            this$0 = MiuiLockScreen.this;
            super(context, 0x6030011, cursor);
        }
    }

    private abstract class PreviewCursorAdpater extends ResourceCursorAdapter {
        protected class ContactInfo {

            public String name;
            final PreviewCursorAdpater this$1;

            protected ContactInfo() {
                this$1 = PreviewCursorAdpater.this;
                super();
                name = "";
            }
        }


        public void bindView(View view, Context context, Cursor cursor) {
        }

        public void enableDefaultCount(boolean flag) {
            mUseDefaultCount = flag;
        }

        protected String formatDate(long l) {
            String s;
            String s1;
            String s2;
            if(DateFormat.is24HourFormat(mContext))
                s = "MMM d, kk:mm";
            else
                s = "MMM d,aa h:mm";
            s1 = DateFormat.format(s, l).toString();
            if(s1.startsWith(DateFormat.format("MMM d", Calendar.getInstance().getTimeInMillis()).toString()))
                s2 = s1.split(",")[1].trim();
            else
                s2 = (new StringBuilder()).append(s1.split(",")[0]).append(mContext.getString(0x60c0040)).toString();
            return s2;
        }

        protected ContactInfo getContact(String s) {
            ContactInfo contactinfo = null;
            if(!mContacts.containsKey(s)) goto _L2; else goto _L1
_L1:
            contactinfo = (ContactInfo)((SoftReference)mContacts.get(s)).get();
            if(contactinfo == null) goto _L2; else goto _L3
_L3:
            ContactInfo contactinfo1 = contactinfo;
_L6:
            return contactinfo1;
_L2:
            Cursor cursor = null;
            Uri uri = Uri.withAppendedPath(android.provider.ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(s));
            ContentResolver contentresolver = mContext.getContentResolver();
            String as[] = new String[1];
            as[0] = "display_name";
            cursor = contentresolver.query(uri, as, null, null, null);
            if(cursor == null || !cursor.moveToFirst()) goto _L5; else goto _L4
_L4:
            ContactInfo contactinfo2 = new ContactInfo();
            contactinfo2.name = cursor.getString(0);
            contactinfo = contactinfo2;
_L8:
            if(contactinfo == null)
                break MISSING_BLOCK_LABEL_148;
            mContacts.put(s, new SoftReference(contactinfo));
            if(cursor != null)
                cursor.close();
_L9:
            contactinfo1 = contactinfo;
              goto _L6
_L5:
            if(cursor == null)
                break MISSING_BLOCK_LABEL_174;
            cursor.close();
            miui.telephony.PhoneNumberUtils.PhoneNumber phonenumber = miui.telephony.PhoneNumberUtils.PhoneNumber.parse(s);
            String s1 = s;
            if(phonenumber != null && !TextUtils.isEmpty(phonenumber.getEffectiveNumber()))
                s1 = phonenumber.getEffectiveNumber();
            ContentResolver contentresolver1 = mContext.getContentResolver();
            Uri uri1 = Uri.parse("content://yellowpage/sp");
            String as1[] = new String[1];
            as1[0] = "name";
            String as2[] = new String[1];
            as2[0] = s1;
            cursor = contentresolver1.query(uri1, as1, "addr=?", as2, null);
            if(cursor == null || !cursor.moveToFirst()) goto _L8; else goto _L7
_L7:
            contactinfo2 = new ContactInfo();
            contactinfo2.name = cursor.getString(0);
            contactinfo = contactinfo2;
              goto _L8
            Exception exception1;
            exception1;
_L12:
            Log.e("LockScreen", exception1.toString());
            if(cursor != null)
                cursor.close();
              goto _L9
            Exception exception;
            exception;
_L11:
            if(cursor != null)
                cursor.close();
            throw exception;
            exception;
            contactinfo2;
            if(true) goto _L11; else goto _L10
_L10:
            exception1;
            contactinfo = contactinfo2;
              goto _L12
        }

        public int getCount() {
            if(!mUseDefaultCount) goto _L2; else goto _L1
_L1:
            int i = getCount();
_L4:
            return i;
_L2:
            Cursor cursor = getCursor();
            if(cursor == null) {
                i = 0;
            } else {
                i = cursor.getCount();
                if(i > 2)
                    i = 2;
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        String getValidatedNumber(String s) {
            if(!s.equals("-1")) goto _L2; else goto _L1
_L1:
            s = mContext.getString(0x60c003c);
_L4:
            return s;
_L2:
            if(s.equals("-2"))
                s = mContext.getString(0x60c003d);
            else
            if(s.equals("-3"))
                s = mContext.getString(0x60c003e);
            if(true) goto _L4; else goto _L3
_L3:
        }

        public boolean isEmpty() {
            boolean flag;
            if(mLoading)
                flag = false;
            else
                flag = isEmpty();
            return flag;
        }

        public abstract void markRead(Context context, int i);

        protected void onContentChanged() {
            onContentChanged();
            onQueryResultCount(getCount());
            notifyDataSetChanged();
        }

        protected abstract void onQueryResultCount(int i);

        void setLoading(boolean flag) {
            mLoading = flag;
        }

        private HashMap mContacts;
        private boolean mLoading;
        private boolean mUseDefaultCount;
        final MiuiLockScreen this$0;

        public PreviewCursorAdpater(Context context, int i, Cursor cursor) {
            this$0 = MiuiLockScreen.this;
            super(context, i, cursor);
            mContacts = new HashMap();
            mLoading = true;
            mUseDefaultCount = true;
        }
    }

    static final class Status extends Enum {

        public static Status valueOf(String s) {
            return (Status)Enum.valueOf(com/android/internal/policy/impl/MiuiLockScreen$Status, s);
        }

        public static Status[] values() {
            return (Status[])$VALUES.clone();
        }

        public boolean showStatusLines() {
            return mShowStatusLines;
        }

        private static final Status $VALUES[];
        public static final Status NetworkLocked;
        public static final Status Normal;
        public static final Status SimLocked;
        public static final Status SimMissing;
        public static final Status SimMissingLocked;
        public static final Status SimPukLocked;
        private final boolean mShowStatusLines;

        static  {
            Normal = new Status("Normal", 0, true);
            NetworkLocked = new Status("NetworkLocked", 1, true);
            SimMissing = new Status("SimMissing", 2, false);
            SimMissingLocked = new Status("SimMissingLocked", 3, false);
            SimPukLocked = new Status("SimPukLocked", 4, false);
            SimLocked = new Status("SimLocked", 5, true);
            Status astatus[] = new Status[6];
            astatus[0] = Normal;
            astatus[1] = NetworkLocked;
            astatus[2] = SimMissing;
            astatus[3] = SimMissingLocked;
            astatus[4] = SimPukLocked;
            astatus[5] = SimLocked;
            $VALUES = astatus;
        }

        private Status(String s, int i, boolean flag) {
            super(s, i);
            mShowStatusLines = flag;
        }
    }


    public MiuiLockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback) {
        FrameLayout(context);
        mStatus = Status.Normal;
        mLastGrabTime = 0x7fffffffffffffffL;
        mShowingBatteryInfo = false;
        mPluggedIn = false;
        mBatteryLevel = 100;
        isPaused = false;
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mEnableMenuKeyInLockScreen = shouldEnableMenuKey();
        mCreationOrientation = configuration.orientation;
        mKeyboardHidden = configuration.hardKeyboardHidden;
        ImageView imageview = new ImageView(mContext);
        imageview.setImageResource(0x60200a2);
        imageview.setScaleType(android.widget.ImageView.ScaleType.FIT_XY);
        addView(imageview, new LayoutParams(-1, -1, 80));
        mBackgroundMask = new ImageView(mContext);
        mBackgroundMask.setImageResource(0x602008a);
        mBackgroundMask.setVisibility(8);
        mBackgroundMask.setScaleType(android.widget.ImageView.ScaleType.FIT_XY);
        addView(mBackgroundMask, new LayoutParams(-1, -1, 80));
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        layoutinflater.inflate(0x6030004, this, true);
        mCarrier = (TextView)findViewById(0x60b002c);
        mCarrier.setSelected(true);
        mScreenLocked = (TextView)findViewById(0x60b002d);
        mEmergencyCallText = (Button)findViewById(0x60b002e);
        mEmergencyCall = (View)mEmergencyCallText.getParent();
        mEmergencyCall.setOnClickListener(new android.view.View.OnClickListener() {

            public void onClick(View view) {
                mCallback.takeEmergencyCallAction();
            }

            final MiuiLockScreen this$0;

             {
                this$0 = MiuiLockScreen.this;
                super();
            }
        });
        mUnlockIccCard = findViewById(0x60b002f);
        mUnlockIccCard.setOnClickListener(new android.view.View.OnClickListener() {

            public void onClick(View view) {
            }

            final MiuiLockScreen this$0;

             {
                this$0 = MiuiLockScreen.this;
                super();
            }
        });
        mMusicController = new MusicController();
        mTimeView = layoutinflater.inflate(0x6030017, null);
        mHintView = inflate(mContext, 0x6030016, null);
        mFadeoutAnim = AnimationUtils.loadAnimation(mContext, 0x6040004);
        setupSlidingPanel();
        setupBatteryInfo();
        mCallsAdapter = new CallLogPreviewListAdapter(mContext, null);
        mCallsHandler = new QueryHandler(mContext, mCallsAdapter);
        mSmsAdapter = new SmsPreviewListAdapter(mContext, null);
        mSmsHandler = new QueryHandler(mContext, mSmsAdapter);
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x60000);
        setChildrenDrawnWithCacheEnabled(true);
        keyguardupdatemonitor.registerInfoCallback(this);
        keyguardupdatemonitor.registerSimStateCallback(this);
        resetStatusInfo(keyguardupdatemonitor);
        ImageView imageview1 = new ImageView(mContext);
        imageview1.setScaleType(android.widget.ImageView.ScaleType.FIT_XY);
        imageview1.setBackgroundResource(0x60200bd);
        addView(imageview1, new LayoutParams(-1, -2, 48));
        mPowerManager = (PowerManager)mContext.getSystemService("power");
        mHapticFeedbackUtil = new HapticFeedbackUtil(mContext, true);
        onPause();
    }

    private void callAndSmsHandle(ListView listview, PreviewCursorAdpater previewcursoradpater, View view) {
        if(!mCallback.isSecure() && previewcursoradpater.getCount() > 0) {
            mAdapter = previewcursoradpater;
            mAdapter.enableDefaultCount(false);
            mCurrentPreviewList = listview;
            markReadDelayVibrate();
            listview.setAdapter(previewcursoradpater);
        } else {
            listview.setAdapter(null);
        }
        setControlView(view, null);
    }

    static CharSequence getCarrierString(CharSequence charsequence, CharSequence charsequence1) {
        if(charsequence == null)
            if(charsequence1 != null)
                charsequence = charsequence1;
            else
                charsequence = "";
        return charsequence;
    }

    private Status getCurrentStatus(com.android.internal.telephony.IccCard.State state) {
        boolean flag;
        Status status;
        if(!mUpdateMonitor.isDeviceProvisioned() && state == com.android.internal.telephony.IccCard.State.ABSENT)
            flag = true;
        else
            flag = false;
        if(!flag && state != com.android.internal.telephony.IccCard.State.NETWORK_LOCKED) goto _L2; else goto _L1
_L1:
        status = Status.SimMissingLocked;
_L4:
        return status;
_L2:
        class _cls4 {

            static final int $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[];
            static final int $SwitchMap$com$android$internal$telephony$IccCard$State[];

            static  {
                $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status = new int[Status.values().length];
                NoSuchFieldError nosuchfielderror11;
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.Normal.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.NetworkLocked.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.SimMissing.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.SimMissingLocked.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror3) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.SimLocked.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror4) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status[Status.SimPukLocked.ordinal()] = 6;
                }
                catch(NoSuchFieldError nosuchfielderror5) { }
                $SwitchMap$com$android$internal$telephony$IccCard$State = new int[com.android.internal.telephony.IccCard.State.values().length];
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.ABSENT.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror6) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.NOT_READY.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror7) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PIN_REQUIRED.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror8) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PUK_REQUIRED.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror9) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.READY.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror10) { }
                $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.UNKNOWN.ordinal()] = 6;
_L2:
                return;
                nosuchfielderror11;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        switch(_cls4..SwitchMap.com.android.internal.telephony.IccCard.State[state.ordinal()]) {
        default:
            status = Status.SimMissing;
            break;

        case 1: // '\001'
            status = Status.SimMissing;
            break;

        case 2: // '\002'
            status = Status.SimMissing;
            break;

        case 3: // '\003'
            status = Status.SimLocked;
            break;

        case 4: // '\004'
            status = Status.SimPukLocked;
            break;

        case 5: // '\005'
            status = Status.Normal;
            break;

        case 6: // '\006'
            status = Status.SimMissing;
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private void markReadDelayVibrate() {
        if(mLastGrabTime == 0x7fffffffffffffffL) {
            mLastGrabTime = System.currentTimeMillis();
            postDelayed(sLongPressVibration, 2000L);
        }
    }

    private void noHandle() {
        removeCallbacks(sLongPressVibration);
        if(System.currentTimeMillis() - mLastGrabTime <= 2000L || mAdapter == null) goto _L2; else goto _L1
_L1:
        Intent intent;
        int i = 1 + (mCurrentPreviewList.getLastVisiblePosition() - mCurrentPreviewList.getFirstVisiblePosition() - mCurrentPreviewList.getHeaderViewsCount());
        for(int j = i - 1; j >= 0; j--)
            mAdapter.markRead(mContext, j);

        mAdapter.enableDefaultCount(true);
        int k = mAdapter.getCount();
        intent = new Intent("android.intent.action.APPLICATION_MESSAGE_UPDATE");
        String s;
        if(k > i)
            s = String.valueOf(k - i);
        else
            s = null;
        intent.putExtra("android.intent.extra.update_application_message_text", s);
        if(mAdapter != mCallsAdapter) goto _L4; else goto _L3
_L3:
        intent.putExtra("android.intent.extra.update_application_component_name", "com.android.contacts/.TwelveKeyDialer");
_L6:
        mContext.sendBroadcast(intent);
_L2:
        mLastGrabTime = 0x7fffffffffffffffL;
        return;
_L4:
        if(mAdapter == mSmsAdapter)
            intent.putExtra("android.intent.extra.update_application_component_name", "com.android.mms/.ui.MmsTabActivity");
        if(true) goto _L6; else goto _L5
_L5:
    }

    private void refreshBatteryStringAndIcon() {
        String s = null;
        byte byte0 = 0;
        int i = 0x60200a5;
        if(mShowingBatteryInfo)
            if(mPluggedIn) {
                if(mBatteryLevel >= 100) {
                    s = getContext().getString(0x60c017f);
                    byte0 = 3;
                } else {
                    Context context1 = getContext();
                    Object aobj1[] = new Object[1];
                    aobj1[0] = Integer.valueOf(mBatteryLevel);
                    s = context1.getString(0x60c017e, aobj1);
                    byte0 = 2;
                    i = 0x60200a4;
                }
            } else {
                Context context = getContext();
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(mBatteryLevel);
                s = context.getString(0x60c0180, aobj);
                byte0 = 1;
                i = 0x60200a6;
            }
        setBatteryInfo(s);
        mSelector.setBatteryLevel(mBatteryLevel);
        mSelector.setBackgroundFor(byte0);
        mMusicController.setBatteryIndicator(i);
        updateControlView();
    }

    private void resetStatusInfo(KeyguardUpdateMonitor keyguardupdatemonitor) {
        mShowingBatteryInfo = keyguardupdatemonitor.shouldShowBatteryInfo();
        mPluggedIn = keyguardupdatemonitor.isDevicePluggedIn();
        mBatteryLevel = keyguardupdatemonitor.getBatteryLevel();
        mStatus = getCurrentStatus(keyguardupdatemonitor.getSimState());
        updateLayout(mStatus);
        refreshBatteryStringAndIcon();
    }

    private void setControlView(View view, android.view.ViewGroup.MarginLayoutParams marginlayoutparams) {
        if(view == null) goto _L2; else goto _L1
_L1:
        boolean flag;
        flag = false;
        if(marginlayoutparams != null)
            break MISSING_BLOCK_LABEL_40;
        marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
        if(marginlayoutparams == null)
            marginlayoutparams = new LayoutParams(-1, -2, 80);
        break MISSING_BLOCK_LABEL_108;
_L3:
        mControlView.setVisibility(0);
        ViewGroup viewgroup = (ViewGroup)view.getParent();
        if(!mControlView.equals(viewgroup) || !flag) {
            mControlView.removeAllViews();
            mControlView.addView(view, marginlayoutparams);
        }
        break MISSING_BLOCK_LABEL_114;
_L2:
        mControlView.setVisibility(4);
        break MISSING_BLOCK_LABEL_114;
        IllegalStateException illegalstateexception;
        illegalstateexception;
        break MISSING_BLOCK_LABEL_114;
        flag = true;
          goto _L3
    }

    private void setupBatteryInfo() {
        mBatteryInfo = inflate(mContext, 0x603000e, null);
        mBatteryInfoText = (TextView)mBatteryInfo.findViewById(0x60b0032);
    }

    private void setupCallsPreviewList() {
        mCallsControlView = inflate(mContext, 0x6030010, null);
        mCallsPreviewList = (ListView)mCallsControlView.findViewById(0x60b0030);
        mCallsPreviewList.setItemsCanFocus(false);
        mCallsPreviewList.setVerticalScrollBarEnabled(false);
        mCallsPreviewList.setDrawingCacheEnabled(true);
        View view = inflate(mContext, 0x603000f, null);
        mCallsPreviewList.addHeaderView(view);
        mCallsPreviewList.setAdapter(mCallsAdapter);
    }

    private void setupSlidingPanel() {
        mSelector = new SlidingPanel(mContext);
        addView(mSelector, new LayoutParams(-1, -2, 83));
        mSelector.setTimeView(mTimeView, null);
        mSelector.setOnTriggerListener(this);
        mControlView = mSelector.getControlView();
    }

    private void setupSmsPreviewList() {
        mSmsControlView = inflate(mContext, 0x6030014, null);
        mSmsPreviewList = (ListView)mSmsControlView.findViewById(0x60b0031);
        mSmsPreviewList.setItemsCanFocus(false);
        mSmsPreviewList.setVerticalScrollBarEnabled(false);
        mSmsPreviewList.setDrawingCacheEnabled(true);
        View view = inflate(mContext, 0x6030013, null);
        mSmsPreviewList.addHeaderView(view);
        mSmsPreviewList.setAdapter(mSmsAdapter);
    }

    private boolean shouldEnableMenuKey() {
        boolean flag = false;
        boolean flag1 = getResources().getBoolean(0x6090006);
        boolean flag2 = SystemProperties.getBoolean("ro.monkey", false);
        boolean flag3 = (new File("/data/local/enable_menu_key")).exists();
        if(!flag1 || flag2 || flag3)
            flag = true;
        return flag;
    }

    private void startCallsQuery() {
        mCallsAdapter.setLoading(true);
        mCallsHandler.cancelOperation(53);
        StringBuilder stringbuilder = new StringBuilder(" type=");
        stringbuilder.append(3);
        stringbuilder.append(" AND new=1 ");
        mCallsHandler.startQuery(53, null, android.provider.CallLog.Calls.CONTENT_URI, CallLog_COLUMNS, stringbuilder.toString(), null, "date DESC");
    }

    private void startSmsQuery() {
        mSmsAdapter.setLoading(true);
        mSmsHandler.cancelOperation(53);
        mSmsHandler.startQuery(53, null, miui.provider.ExtraTelephony.MmsSms.CONTENT_PREVIEW_URI, null, null, null, null);
    }

    private void updateBackground() {
        int i;
        i = 0;
        byte byte0 = 1;
        if(mMusicController.isMusicControlVisible())
            if(mMusicController.isAlbumShow())
                byte0 = 2;
            else
                byte0 = 3;
        byte0;
        JVM INSTR tableswitch 0 3: default 56
    //                   0 83
    //                   1 83
    //                   2 62
    //                   3 62;
           goto _L1 _L2 _L2 _L3 _L3
_L1:
        return;
_L3:
        mBackgroundMask.setImageResource(0x60200a7);
        mBackgroundMask.setVisibility(0);
        continue; /* Loop/switch isn't completed */
_L2:
        mBackgroundMask.setImageResource(0x602008a);
        ImageView imageview = mBackgroundMask;
        if(!mShowingBatteryInfo)
            i = 8;
        imageview.setVisibility(i);
        if(mControlViewType == 0 && mShowingBatteryInfo)
            mControlViewType = 5;
        if(true) goto _L1; else goto _L4
_L4:
    }

    private void updateControlView() {
        if(mControlViewType == 4 && mMusicController.isMusicStatusNone())
            mControlViewType = 0;
        if(mControlViewType != 0 && mMusicController.shouldShowMusic())
            mMusicController.showAlbum();
        else
            updateBackground();
        mMusicController.clearAnimation();
        mControlViewType;
        JVM INSTR tableswitch 1 5: default 92
    //                   1 151
    //                   2 121
    //                   3 181
    //                   4 106
    //                   5 193;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        setControlView(null, null);
_L8:
        return;
_L5:
        setControlView(mMusicController.getMusicControl(), null);
        continue; /* Loop/switch isn't completed */
_L3:
        if(mSmsControlView == null)
            setupSmsPreviewList();
        callAndSmsHandle(mSmsPreviewList, mSmsAdapter, mSmsControlView);
        continue; /* Loop/switch isn't completed */
_L2:
        if(mCallsControlView == null)
            setupCallsPreviewList();
        callAndSmsHandle(mCallsPreviewList, mCallsAdapter, mCallsControlView);
        continue; /* Loop/switch isn't completed */
_L4:
        setControlView(mHintView, null);
        continue; /* Loop/switch isn't completed */
_L6:
        setControlView(mBatteryInfo, null);
        if(true) goto _L8; else goto _L7
_L7:
    }

    private void updateLayout(Status status) {
        mEmergencyCall.setVisibility(8);
        mUnlockIccCard.setVisibility(8);
        _cls4..SwitchMap.com.android.internal.policy.impl.MiuiLockScreen.Status[status.ordinal()];
        JVM INSTR tableswitch 1 6: default 64
    //                   1 65
    //                   2 136
    //                   3 209
    //                   4 264
    //                   5 345
    //                   6 408;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7
_L1:
        return;
_L2:
        mCarrier.setText(getCarrierString(mUpdateMonitor.getTelephonyPlmn(), mUpdateMonitor.getTelephonySpn()));
        mScreenLocked.setText("");
        mCarrier.setVisibility(8);
        mScreenLocked.setVisibility(0);
        mSelector.setVisibility(0);
        mEmergencyCallText.setVisibility(8);
        continue; /* Loop/switch isn't completed */
_L3:
        mCarrier.setText(getCarrierString(mUpdateMonitor.getTelephonyPlmn(), getContext().getText(0x60c0183)));
        mScreenLocked.setText(0x60c0187);
        mCarrier.setVisibility(0);
        mScreenLocked.setVisibility(0);
        mSelector.setVisibility(0);
        mEmergencyCallText.setVisibility(8);
        continue; /* Loop/switch isn't completed */
_L4:
        mCarrier.setText(0x60c0181);
        mScreenLocked.setText(0x60c0182);
        mCarrier.setVisibility(0);
        mScreenLocked.setVisibility(4);
        mSelector.setVisibility(0);
        mEmergencyCallText.setVisibility(0);
        continue; /* Loop/switch isn't completed */
_L5:
        mCarrier.setText(getCarrierString(mUpdateMonitor.getTelephonyPlmn(), getContext().getText(0x60c0181)));
        mScreenLocked.setText(0x60c0182);
        mCarrier.setVisibility(0);
        mScreenLocked.setVisibility(0);
        mSelector.setVisibility(8);
        mEmergencyCallText.setVisibility(0);
        mEmergencyCall.setVisibility(0);
        continue; /* Loop/switch isn't completed */
_L6:
        mCarrier.setText(getCarrierString(mUpdateMonitor.getTelephonyPlmn(), getContext().getText(0x60c0186)));
        mCarrier.setVisibility(0);
        mScreenLocked.setVisibility(4);
        mSelector.setVisibility(0);
        mEmergencyCallText.setVisibility(8);
        continue; /* Loop/switch isn't completed */
_L7:
        mCarrier.setText(getCarrierString(mUpdateMonitor.getTelephonyPlmn(), getContext().getText(0x60c0184)));
        mScreenLocked.setText(0x60c0185);
        mCarrier.setVisibility(0);
        mScreenLocked.setVisibility(0);
        mSelector.setVisibility(8);
        mEmergencyCallText.setVisibility(0);
        mEmergencyCall.setVisibility(0);
        mUnlockIccCard.setVisibility(0);
        if(true) goto _L1; else goto _L8
_L8:
    }

    public void cleanUp() {
        mUpdateMonitor.removeCallback(this);
        mLockPatternUtils = null;
        mUpdateMonitor = null;
        mCallsHandler.closeCursor();
        mSmsHandler.closeCursor();
    }

    public boolean needsInput() {
        return false;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateConfiguration();
        mMusicController.registerPlayerStatusListener();
        startCallsQuery();
        startSmsQuery();
    }

    public void onClockVisibilityChanged() {
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    protected void onDetachedFromWindow() {
        mMusicController.unregisterPlayerStatusListener();
        super.onDetachedFromWindow();
    }

    public void onDevicePolicyManagerStateChanged() {
    }

    public void onDeviceProvisioned() {
    }

    public void onGrabbedStateChange(View view, int i) {
        if(view != mSelector) goto _L2; else goto _L1
_L1:
        if(!isPaused && mPowerManager.isScreenOn())
            mCallback.pokeWakelock();
        i;
        JVM INSTR tableswitch 0 6: default 76
    //                   0 225
    //                   1 77
    //                   2 96
    //                   3 139
    //                   4 76
    //                   5 158
    //                   6 115;
           goto _L2 _L3 _L4 _L5 _L6 _L2 _L7 _L8
_L2:
        return;
_L4:
        mControlViewType = 1;
        mMusicController.removeCheckStreamCallbacks();
        updateControlView();
        continue; /* Loop/switch isn't completed */
_L5:
        mControlViewType = 2;
        mMusicController.removeCheckStreamCallbacks();
        updateControlView();
        continue; /* Loop/switch isn't completed */
_L8:
        mMusicController.toggleMusicControl();
        mMusicController.removeCheckStreamCallbacks();
        mMusicController.updateSpectrumVisualizer();
        continue; /* Loop/switch isn't completed */
_L6:
        mControlViewType = 3;
        mMusicController.removeCheckStreamCallbacks();
        updateControlView();
        continue; /* Loop/switch isn't completed */
_L7:
        mMusicController.removeCheckStreamCallbacks();
        mControlViewType = 0;
        if(mControlView.getVisibility() == 0) {
            mControlView.setVisibility(4);
            mControlView.clearAnimation();
            mControlView.startAnimation(mFadeoutAnim);
        }
        removeCallbacks(sLongPressVibration);
        mLastGrabTime = 0x7fffffffffffffffL;
        continue; /* Loop/switch isn't completed */
_L3:
        noHandle();
        mMusicController.addCheckStreamCallbacks();
        mControlViewType = 4;
        mControlView.setVisibility(0);
        updateControlView();
        if(true) goto _L2; else goto _L9
_L9:
    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        if(i == 82 && mEnableMenuKeyInLockScreen) {
            mCallback.goToUnlockScreen();
            Log.d("MiuiLockScreen", "Unlock Screen by pressing menu");
        }
        return false;
    }

    public void onPause() {
        isPaused = true;
        mSelector.onPause();
        mMusicController.onPause();
    }

    public void onPhoneStateChanged(int i) {
        if(TelephonyManager.EXTRA_STATE_IDLE.equals(Integer.valueOf(i)) || isPaused) goto _L2; else goto _L1
_L1:
        mSelector.clearBatteryAnimations();
_L4:
        mLockPatternUtils.updateEmergencyCallButtonState(mEmergencyCallText, i, true);
        return;
_L2:
        if(TelephonyManager.EXTRA_STATE_IDLE.equals(Integer.valueOf(i)) && !isPaused)
            refreshBatteryStringAndIcon();
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void onRefreshBatteryInfo(boolean flag, boolean flag1, int i) {
        mShowingBatteryInfo = flag;
        mPluggedIn = flag1;
        mBatteryLevel = i;
        refreshBatteryStringAndIcon();
    }

    public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1) {
        updateLayout(mStatus);
    }

    public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1, int i) {
    }

    public void onResume() {
        mMusicController.onResume();
        resetStatusInfo(mUpdateMonitor);
        updateControlView();
        mSelector.onResume();
        isPaused = false;
    }

    public void onRingerModeChanged(int i) {
    }

    public void onSimStateChanged(com.android.internal.telephony.IccCard.State state) {
        mStatus = getCurrentStatus(state);
        Log.d("LockScreen", (new StringBuilder()).append("current status is ").append(mStatus).append(", and prev status is ").append(sPrevStatus).toString());
        if(sPrevStatus == Status.SimPukLocked && mStatus != Status.SimPukLocked) {
            mCallback.setPendingIntent(null);
            mCallback.goToUnlockScreen();
        } else {
            updateLayout(mStatus);
        }
        sPrevStatus = mStatus;
    }

    public void onSimStateChanged(com.android.internal.telephony.IccCard.State state, int i) {
    }

    public void onTimeChanged() {
    }

    public void onTrigger(View view, int i) {
        if(view != mSelector) goto _L2; else goto _L1
_L1:
        if(i != 1) goto _L4; else goto _L3
_L3:
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setType("vnd.android.cursor.dir/calls");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.setFlags(0x34000000);
        mCallback.setPendingIntent(intent);
        mCallback.goToUnlockScreen();
_L2:
        return;
_L4:
        if(i == 3) {
            mCallback.setPendingIntent(null);
            mCallback.goToUnlockScreen();
        } else
        if(i == 2) {
            Intent intent1 = new Intent("android.intent.action.MAIN");
            HashSet hashset = new HashSet();
            mSmsAdapter.enableDefaultCount(true);
            for(int j = -1 + mSmsAdapter.getCount(); j >= 0; j--) {
                Cursor cursor = (Cursor)mSmsAdapter.getItem(j);
                if(cursor != null)
                    hashset.add(Long.valueOf(cursor.getLong(6)));
            }

            if(hashset.size() == 1) {
                intent1.setAction("android.intent.action.VIEW");
                intent1.putExtra("thread_id", (Serializable)hashset.iterator().next());
                intent1.putExtra("view_conversation", true);
            }
            intent1.setType("vnd.android-dir/mms-sms");
            intent1.addCategory("android.intent.category.DEFAULT");
            intent1.setFlags(0x34000000);
            mCallback.setPendingIntent(intent1);
            mCallback.goToUnlockScreen();
        }
        if(true) goto _L2; else goto _L5
_L5:
    }

    public void onUserChanged(int i) {
    }

    public void setBatteryInfo(String s) {
        mBatteryInfoText.setText(s);
    }

    void updateConfiguration() {
        int i = 1;
        Configuration configuration = getResources().getConfiguration();
        if(configuration.hardKeyboardHidden != mKeyboardHidden) {
            mKeyboardHidden = configuration.hardKeyboardHidden;
            if(mKeyboardHidden != i)
                i = 0;
            if(i != 0)
                mCallback.goToUnlockScreen();
        }
    }

    private static final int BACKGROUND_MUSIC_SHOW_DEFAULT_ALBUM = 3;
    private static final int BACKGROUND_MUSIC_SHOW_HAS_ALBUM = 2;
    private static final int BACKGROUND_MUSIC_SHOW_NONE = 1;
    private static final int BACKGROUND_NONE = 0;
    private static final int CONTROL_VIEW_BATTERY = 5;
    private static final int CONTROL_VIEW_CALL = 1;
    private static final int CONTROL_VIEW_DATE = 3;
    private static final int CONTROL_VIEW_MUSIC = 4;
    private static final int CONTROL_VIEW_NONE = 0;
    private static final int CONTROL_VIEW_SMS = 2;
    private static final String CallLog_COLUMNS[];
    private static final boolean DBG = false;
    private static final String ENABLE_MENU_KEY_FILE = "/data/local/enable_menu_key";
    private static final long MAKR_PREVIEW_READ_DELAY = 2000L;
    private static final int MAX_VISIBLE_ITEM_NUM = 2;
    private static final int QUERY_TOKEN = 53;
    private static final int SMS_RECEIVED_WAKE_UP_DELAY = 25000;
    private static final String TAG = "LockScreen";
    private static Status sPrevStatus;
    private boolean isPaused;
    private PreviewCursorAdpater mAdapter;
    private ImageView mBackgroundMask;
    private View mBatteryInfo;
    private TextView mBatteryInfoText;
    private int mBatteryLevel;
    private final KeyguardScreenCallback mCallback;
    private CallLogPreviewListAdapter mCallsAdapter;
    private View mCallsControlView;
    private QueryHandler mCallsHandler;
    private ListView mCallsPreviewList;
    private TextView mCarrier;
    private FrameLayout mControlView;
    private int mControlViewType;
    private int mCreationOrientation;
    private ListView mCurrentPreviewList;
    private View mEmergencyCall;
    private Button mEmergencyCallText;
    private boolean mEnableMenuKeyInLockScreen;
    private final Animation mFadeoutAnim;
    private HapticFeedbackUtil mHapticFeedbackUtil;
    private View mHintView;
    private int mKeyboardHidden;
    private long mLastGrabTime;
    private LockPatternUtils mLockPatternUtils;
    private MusicController mMusicController;
    private boolean mPluggedIn;
    private PowerManager mPowerManager;
    private TextView mScreenLocked;
    private SlidingPanel mSelector;
    private boolean mShowingBatteryInfo;
    private SmsPreviewListAdapter mSmsAdapter;
    private View mSmsControlView;
    private QueryHandler mSmsHandler;
    private ListView mSmsPreviewList;
    private Status mStatus;
    private View mTimeView;
    private View mUnlockIccCard;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private final Runnable sLongPressVibration = new Runnable() {

        public void run() {
            mHapticFeedbackUtil.performHapticFeedback(0, true);
        }

        final MiuiLockScreen this$0;

             {
                this$0 = MiuiLockScreen.this;
                super();
            }
    };

    static  {
        String as[] = new String[5];
        as[0] = "_id";
        as[1] = "number";
        as[2] = "date";
        as[3] = "duration";
        as[4] = "name";
        CallLog_COLUMNS = as;
    }











/*
    static int access$2102(MiuiLockScreen miuilockscreen, int i) {
        miuilockscreen.mControlViewType = i;
        return i;
    }

*/











}
