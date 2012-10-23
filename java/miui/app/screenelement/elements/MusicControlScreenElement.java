// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.content.*;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.*;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.Utils;
import miui.util.AudioOutputHelper;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ElementGroup, ScreenElement, ButtonScreenElement, TextScreenElement, 
//            ImageScreenElement, SpectrumVisualizerScreenElement

public class MusicControlScreenElement extends ElementGroup
    implements ButtonScreenElement.ButtonActionListener {

    public MusicControlScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mPlayerStatusListener = new BroadcastReceiver() {

            private void setTrackInfo(Intent intent) {
                if(mTextDisplay != null) goto _L2; else goto _L1
_L1:
                return;
_L2:
                String s1;
                String s2;
                s1 = intent.getStringExtra("track");
                s2 = intent.getStringExtra("artist");
                mIsOnlineSongBlocking = false;
                if(TextUtils.isEmpty(s1) && TextUtils.isEmpty(s2)) {
                    mTextDisplay.show(false);
                    continue; /* Loop/switch isn't completed */
                }
                if(!TextUtils.isEmpty(s1))
                    break; /* Loop/switch isn't completed */
                mTextDisplay.setText(s2);
_L4:
                mTextDisplay.show(true);
                if(true) goto _L1; else goto _L3
_L3:
                if(TextUtils.isEmpty(s2)) {
                    mTextDisplay.setText(s1);
                } else {
                    TextScreenElement textscreenelement = mTextDisplay;
                    Object aobj[] = new Object[2];
                    aobj[0] = s1;
                    aobj[1] = s2;
                    textscreenelement.setText(String.format("%s   %s", aobj));
                }
                  goto _L4
                if(true) goto _L1; else goto _L5
_L5:
            }

            public void onReceive(Context context, Intent intent) {
                String s1 = intent.getAction();
                if(intent.getBooleanExtra("playing", false)) goto _L2; else goto _L1
_L1:
                return;
_L2:
                if("com.miui.player.metachanged".equals(s1)) {
                    String s2 = intent.getStringExtra("other");
                    if("meta_changed_track".equals(s2)) {
                        setTrackInfo(intent);
                        requestAlbum(intent);
                    } else
                    if("meta_changed_album".equals(s2))
                        requestAlbum(intent, true);
                    else
                        requestAlbum();
                } else
                if("lockscreen.action.SONG_METADATA_UPDATED".equals(s1)) {
                    setTrackInfo(intent);
                    setAlbumCover(intent);
                } else
                if("com.miui.player.refreshprogress".equals(s1))
                    mIsOnlineSongBlocking = intent.getBooleanExtra("blocking", false);
                else
                if("com.miui.player.playstatechanged".equals(s1)) {
                    if(mTextDisplay != null && !mTextDisplay.isVisible())
                        setTrackInfo(intent);
                    requestAlbum(intent);
                }
                if(true) goto _L1; else goto _L3
_L3:
            }

            final MusicControlScreenElement this$0;

             {
                this$0 = MusicControlScreenElement.this;
                super();
            }
        };
        isPaused = false;
        mCheckStreamMusicRunnable = new Runnable() {

            public void run() {
                updateMusic();
                updateSpectrumVisualizer();
                mHandler.postDelayed(this, 1000L);
            }

            final MusicControlScreenElement this$0;

             {
                this$0 = MusicControlScreenElement.this;
                super();
            }
        };
        mEnableSpectrumVisualizerRunnable = new Runnable() {

            public void run() {
                mHandler.removeCallbacks(mEnableSpectrumVisualizerRunnable);
                updateSpectrumVisualizer();
            }

            final MusicControlScreenElement this$0;

             {
                this$0 = MusicControlScreenElement.this;
                super();
            }
        };
        Iterator iterator = super.mElements.iterator();
        do {
            if(!iterator.hasNext())
                break;
            ScreenElement screenelement = (ScreenElement)iterator.next();
            if(screenelement.getName().equals("music_prev"))
                mButtonPrev = (ButtonScreenElement)screenelement;
            else
            if(screenelement.getName().equals("music_next"))
                mButtonNext = (ButtonScreenElement)screenelement;
            else
            if(screenelement.getName().equals("music_play"))
                mButtonPlay = (ButtonScreenElement)screenelement;
            else
            if(screenelement.getName().equals("music_pause"))
                mButtonPause = (ButtonScreenElement)screenelement;
            else
            if(screenelement.getName().equals("music_display"))
                mTextDisplay = (TextScreenElement)screenelement;
            else
            if(screenelement.getName().equals("music_album_cover"))
                mImageAlbumCover = (ImageScreenElement)screenelement;
            else
            if(screenelement instanceof SpectrumVisualizerScreenElement)
                mSpectrumVisualizer = (SpectrumVisualizerScreenElement)screenelement;
        } while(true);
        if(mButtonPrev == null || mButtonNext == null || mButtonPlay == null || mButtonPause == null)
            throw new ScreenElementLoadException("invalid music control");
        setupButton(mButtonPrev);
        setupButton(mButtonNext);
        setupButton(mButtonPlay);
        setupButton(mButtonPause);
        mButtonPause.show(false);
        if(mImageAlbumCover != null) {
            String s = element.getAttribute("defAlbumCover");
            if(!TextUtils.isEmpty(s))
                mDefaultAlbumCoverBm = super.mContext.mResourceManager.getBitmap(s);
            else
                mDefaultAlbumCoverBm = BitmapFactory.decodeResource(super.mContext.mContext.getResources(), 0x60200a9);
            if(mDefaultAlbumCoverBm != null)
                mDefaultAlbumCoverBm.setDensity(super.mRoot.getResourceDensity());
        }
        mAutoShow = Boolean.parseBoolean(element.getAttribute("autoShow"));
        mAudioManager = (AudioManager)screencontext.mContext.getSystemService("audio");
        if(super.mHasName)
            mMusicStateVar = new IndexedNumberVariable(super.mName, "music_state", screencontext.mVariables);
    }

    private int getKeyCode(String s) {
        byte byte0;
        if("music_prev".equals(s))
            byte0 = 88;
        else
        if("music_next".equals(s))
            byte0 = 87;
        else
        if("music_play".equals(s) || "music_pause".equals(s))
            byte0 = 85;
        else
            byte0 = -1;
        return byte0;
    }

    private void requestAlbum() {
        Intent intent = new Intent("lockscreen.action.SONG_METADATA_REQUEST");
        super.mContext.mContext.sendBroadcast(intent);
    }

    private void requestAlbum(Intent intent) {
        requestAlbum(intent, false);
    }

    private void requestAlbum(Intent intent, boolean flag) {
        if(mImageAlbumCover != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        String s = intent.getStringExtra("album");
        String s1 = intent.getStringExtra("artist");
        if(flag || !Utils.equals(s, mAlbumName) || !Utils.equals(s1, mArtistName) || mAlbumCoverBm == null) {
            Uri uri = (Uri)intent.getParcelableExtra("album_uri");
            String s2 = intent.getStringExtra("album_path");
            mAlbumCoverBm = null;
            if(uri != null || s2 != null)
                requestAlbum();
            else
                mImageAlbumCover.setBitmap(mDefaultAlbumCoverBm);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    private void sendMediaButtonBroadcast(int i, int j) {
        long l = SystemClock.uptimeMillis();
        KeyEvent keyevent = new KeyEvent(l, l, i, j, 0);
        Intent intent = new Intent("android.intent.action.MEDIA_BUTTON", null);
        intent.putExtra("android.intent.extra.KEY_EVENT", KeyEvent.changeFlags(keyevent, 8));
        intent.putExtra("forbid_double_click", true);
        super.mContext.mContext.sendOrderedBroadcast(intent, null);
    }

    private void setAlbumCover(Intent intent) {
        if(mImageAlbumCover != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        mAlbumName = intent.getStringExtra("album");
        mArtistName = intent.getStringExtra("artist");
        String s = intent.getStringExtra("tmp_album_path");
        if(s != null) {
            mAlbumCoverBm = BitmapFactory.decodeFile(s);
            if(mAlbumCoverBm != null)
                mAlbumCoverBm.setDensity(super.mRoot.getResourceDensity());
        }
        ImageScreenElement imagescreenelement2 = mImageAlbumCover;
        Bitmap bitmap2;
        if(mAlbumCoverBm != null)
            bitmap2 = mAlbumCoverBm;
        else
            bitmap2 = mDefaultAlbumCoverBm;
        imagescreenelement2.setBitmap(bitmap2);
        requestUpdate();
          goto _L1
        OutOfMemoryError outofmemoryerror;
        outofmemoryerror;
        Log.e("MusicControlScreenElement", (new StringBuilder()).append("failed to load album cover bitmap: ").append(outofmemoryerror.toString()).toString());
        ImageScreenElement imagescreenelement1 = mImageAlbumCover;
        Bitmap bitmap1;
        if(mAlbumCoverBm != null)
            bitmap1 = mAlbumCoverBm;
        else
            bitmap1 = mDefaultAlbumCoverBm;
        imagescreenelement1.setBitmap(bitmap1);
        requestUpdate();
          goto _L1
        Exception exception;
        exception;
        ImageScreenElement imagescreenelement = mImageAlbumCover;
        Bitmap bitmap;
        if(mAlbumCoverBm != null)
            bitmap = mAlbumCoverBm;
        else
            bitmap = mDefaultAlbumCoverBm;
        imagescreenelement.setBitmap(bitmap);
        requestUpdate();
        throw exception;
    }

    private void setupButton(ButtonScreenElement buttonscreenelement) {
        if(buttonscreenelement != null) {
            buttonscreenelement.setListener(this);
            buttonscreenelement.setParent(this);
        }
    }

    private void updateMusic() {
        int i;
        boolean flag1;
        boolean flag = false;
        i = 1;
        flag1 = mAudioManager.isMusicActive();
        boolean flag2;
        ButtonScreenElement buttonscreenelement;
        if(!flag1)
            flag2 = i;
        else
            flag2 = false;
        if(mIsOnlineSongBlocking)
            flag2 = false;
        mButtonPlay.show(flag2);
        buttonscreenelement = mButtonPause;
        if(!flag2)
            flag = i;
        buttonscreenelement.show(flag);
        mMusicStatus;
        JVM INSTR tableswitch 1 2: default 84
    //                   1 106
    //                   2 106;
           goto _L1 _L2 _L2
_L1:
        IndexedNumberVariable indexednumbervariable;
        double d;
        float f;
        if(flag1)
            f = 30F;
        else
            f = 0.0F;
        requestFramerate(f);
        return;
_L2:
        if(flag1)
            i = 2;
        mMusicStatus = i;
        if(super.mHasName) {
            indexednumbervariable = mMusicStateVar;
            if(flag1)
                d = 1.0D;
            else
                d = 0.0D;
            indexednumbervariable.set(d);
        }
          goto _L1
    }

    public void finish() {
        mHandler.removeCallbacks(mCheckStreamMusicRunnable);
        try {
            super.mContext.mContext.unregisterReceiver(mPlayerStatusListener);
        }
        catch(IllegalArgumentException illegalargumentexception) {
            Log.e("MusicControlScreenElement", illegalargumentexception.toString());
            illegalargumentexception.printStackTrace();
        }
        if(mSpectrumVisualizer != null)
            mSpectrumVisualizer.enableUpdate(false);
    }

    public void init() {
        super.init();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("com.miui.player.metachanged");
        intentfilter.addAction("lockscreen.action.SONG_METADATA_UPDATED");
        intentfilter.addAction("com.miui.player.refreshprogress");
        intentfilter.addAction("com.miui.player.playstatechanged");
        super.mContext.mContext.registerReceiver(mPlayerStatusListener, intentfilter, null, mHandler);
        boolean flag = AudioOutputHelper.hasActiveReceivers(super.mContext.mContext);
        if(flag) {
            mMusicStatus = 2;
            Intent intent = new Intent("lockscreen.action.SONG_METADATA_REQUEST");
            super.mContext.mContext.sendBroadcast(intent);
            if(mAutoShow)
                show(true);
        }
        if(super.mHasName) {
            IndexedNumberVariable indexednumbervariable = mMusicStateVar;
            double d;
            if(flag)
                d = 1.0D;
            else
                d = 0.0D;
            indexednumbervariable.set(d);
        }
    }

    public boolean onButtonDoubleClick(String s) {
        return false;
    }

    public boolean onButtonDown(String s) {
        boolean flag = false;
        int i = getKeyCode(s);
        if(i != -1) {
            sendMediaButtonBroadcast(0, i);
            flag = true;
        }
        return flag;
    }

    public boolean onButtonLongClick(String s) {
        return false;
    }

    public boolean onButtonUp(final String _name) {
        boolean flag = true;
        int i = getKeyCode(_name);
        if(i == -1) {
            flag = false;
        } else {
            sendMediaButtonBroadcast(flag, i);
            mHandler.post(new Runnable() {

                public void run() {
                    if(!"music_pause".equals(_name)) goto _L2; else goto _L1
_L1:
                    mButtonPause.show(false);
                    mButtonPlay.show(true);
                    mMusicStatus = 1;
                    if(mHasName)
                        mMusicStateVar.set(0.0D);
                    requestFramerate(0.0F);
_L4:
                    mHandler.removeCallbacks(mCheckStreamMusicRunnable);
                    mHandler.postDelayed(mCheckStreamMusicRunnable, 3000L);
                    mHandler.removeCallbacks(mEnableSpectrumVisualizerRunnable);
                    mHandler.postDelayed(mEnableSpectrumVisualizerRunnable, 500L);
                    return;
_L2:
                    if("music_play".equals(_name)) {
                        mButtonPlay.show(false);
                        mButtonPause.show(true);
                        mMusicStatus = 2;
                        if(mHasName)
                            mMusicStateVar.set(1.0D);
                        requestFramerate(30F);
                        requestAlbum();
                    }
                    if(true) goto _L4; else goto _L3
_L3:
                }

                final MusicControlScreenElement this$0;
                final String val$_name;

             {
                this$0 = MusicControlScreenElement.this;
                _name = s;
                super();
            }
            });
        }
        return flag;
    }

    public void pause() {
        super.pause();
        isPaused = true;
        mHandler.removeCallbacks(mCheckStreamMusicRunnable);
        if(mSpectrumVisualizer != null)
            mSpectrumVisualizer.enableUpdate(false);
    }

    public void resume() {
        super.resume();
        isPaused = false;
        if(isVisible())
            mHandler.postDelayed(mCheckStreamMusicRunnable, 1000L);
    }

    public void show(boolean flag) {
        super.show(flag);
        if(!flag) {
            mMusicStatus = 0;
            mHandler.removeCallbacks(mCheckStreamMusicRunnable);
            if(mSpectrumVisualizer != null)
                mSpectrumVisualizer.enableUpdate(false);
            requestFramerate(0.0F);
        } else {
            updateMusic();
            mHandler.postDelayed(mCheckStreamMusicRunnable, 1000L);
        }
    }

    protected void updateSpectrumVisualizer() {
        boolean flag = mAudioManager.isMusicActive();
        if(mSpectrumVisualizer != null) {
            SpectrumVisualizerScreenElement spectrumvisualizerscreenelement = mSpectrumVisualizer;
            boolean flag1;
            if(flag && isVisible() && !isPaused)
                flag1 = true;
            else
                flag1 = false;
            spectrumvisualizerscreenelement.enableUpdate(flag1);
        }
    }

    private static final String BUTTON_MUSIC_ALBUM_COVER = "music_album_cover";
    private static final String BUTTON_MUSIC_DISPLAY = "music_display";
    private static final String BUTTON_MUSIC_NEXT = "music_next";
    private static final String BUTTON_MUSIC_PAUSE = "music_pause";
    private static final String BUTTON_MUSIC_PLAY = "music_play";
    private static final String BUTTON_MUSIC_PREV = "music_prev";
    private static final int CHECK_STREAM_MUSIC_DELAY = 1000;
    private static final int FRAMERATE_PLAYING = 30;
    private static final String LOG_TAG = "MusicControlScreenElement";
    private static final int MUSIC_NONE = 0;
    private static final int MUSIC_PLAY = 2;
    private static final int MUSIC_STOP = 1;
    public static final String TAG_NAME = "MusicControl";
    private boolean isPaused;
    private Bitmap mAlbumCoverBm;
    private String mAlbumName;
    private String mArtistName;
    private AudioManager mAudioManager;
    private boolean mAutoShow;
    private ButtonScreenElement mButtonNext;
    private ButtonScreenElement mButtonPause;
    private ButtonScreenElement mButtonPlay;
    private ButtonScreenElement mButtonPrev;
    private Runnable mCheckStreamMusicRunnable;
    private Bitmap mDefaultAlbumCoverBm;
    private Runnable mEnableSpectrumVisualizerRunnable;
    private final Handler mHandler = new Handler();
    private ImageScreenElement mImageAlbumCover;
    private boolean mIsOnlineSongBlocking;
    private IndexedNumberVariable mMusicStateVar;
    private int mMusicStatus;
    private BroadcastReceiver mPlayerStatusListener;
    private SpectrumVisualizerScreenElement mSpectrumVisualizer;
    private TextScreenElement mTextDisplay;





/*
    static int access$1102(MusicControlScreenElement musiccontrolscreenelement, int i) {
        musiccontrolscreenelement.mMusicStatus = i;
        return i;
    }

*/






/*
    static boolean access$402(MusicControlScreenElement musiccontrolscreenelement, boolean flag) {
        musiccontrolscreenelement.mIsOnlineSongBlocking = flag;
        return flag;
    }

*/





}
