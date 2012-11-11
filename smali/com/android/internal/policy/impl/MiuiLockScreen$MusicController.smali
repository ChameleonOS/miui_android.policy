.class Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;
.super Ljava/lang/Object;
.source "MiuiLockScreen.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiLockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MusicController"
.end annotation


# static fields
.field private static final ANIM_FADEIN:I = 0x1

.field private static final ANIM_FADEOUT:I = 0x2

.field private static final ANIM_NONE:I = 0x0

.field private static final CHECK_STREAM_MUSIC_DELAY:I = 0x3e8

.field private static final MUSIC_SHOW_NONE:I = 0x0

.field private static final MUSIC_SHOW_PLAY:I = 0x2

.field private static final MUSIC_SHOW_STOP:I = 0x1


# instance fields
.field private mAlbumBm:Landroid/graphics/Bitmap;

.field private mAlbumChanged:Z

.field private mAlbumFadeInAnim:Landroid/view/animation/Animation;

.field private mAlbumFadeOutAnim:Landroid/view/animation/Animation;

.field private mAlbumName:Ljava/lang/String;

.field private mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

.field private mArtistName:Ljava/lang/String;

.field private mCheckStreamMusicRunnable:Ljava/lang/Runnable;

.field private mDefaultAlbum:Landroid/graphics/Bitmap;

.field private mEnable:Z

.field private mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;

.field private final mHandler:Landroid/os/Handler;

.field private mIsOnlineSongBlocking:Z

.field private mMusicBatteryIndicator:Landroid/widget/ImageView;

.field private mMusicBatteryIndicatorId:I

.field private mMusicControl:Landroid/view/View;

.field private mMusicPlayPauseButton:Landroid/widget/ImageView;

.field private mMusicStatus:I

.field private mMusicTitle:Landroid/widget/TextView;

.field private mPlayerStatusListener:Landroid/content/BroadcastReceiver;

.field private mSpectrumVisualizer:Lmiui/widget/SpectrumVisualizer;

.field private mTempAlbumBm:Landroid/graphics/Bitmap;

.field private mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V
    .registers 3
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$2;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$2;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mCheckStreamMusicRunnable:Ljava/lang/Runnable;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$3;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$3;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mPlayerStatusListener:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$4;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$4;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateSpectrumVisualizer()V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Lcom/miui/internal/policy/impl/AlbumFrameView;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Landroid/graphics/Bitmap;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Lcom/miui/internal/policy/impl/AlbumFrameView;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Z
    .registers 2
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isAlbumShow()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateMusic()V

    return-void
.end method

.method static synthetic access$2600(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;Landroid/content/Intent;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setTrackInfo(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;Landroid/content/Intent;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->requestAlbum(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;Landroid/content/Intent;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setAlbumInfo(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->showAlbum()V

    return-void
.end method

.method static synthetic access$3002(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mIsOnlineSongBlocking:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Landroid/widget/TextView;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Ljava/lang/Runnable;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Landroid/graphics/Bitmap;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private enableMusicControl(Z)V
    .registers 6
    .parameter "enable"

    .prologue
    const/4 v3, 0x4

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-eqz p1, :cond_1a

    move v0, v1

    :goto_7
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_1d

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #setter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const/4 v2, 0x0

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V
    invoke-static {v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2300(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    :cond_19
    :goto_19
    return-void

    :cond_1a
    const/16 v0, 0x8

    goto :goto_7

    :cond_1d
    iput v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2100(Lcom/android/internal/policy/impl/MiuiLockScreen;)I

    move-result v0

    if-ne v0, v3, :cond_19

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2400(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    goto :goto_19
.end method

.method private hideAlbum()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->clearAnimation()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->clearAnimation()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2000(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    return-void
.end method

.method private isAlbumShow()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private requestAlbum()V
    .registers 3

    .prologue
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumChanged:Z

    if-eqz v1, :cond_14

    new-instance v0, Landroid/content/Intent;

    const-string v1, "lockscreen.action.SONG_METADATA_REQUEST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, requestIntent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1900(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .end local v0           #requestIntent:Landroid/content/Intent;
    :cond_14
    return-void
.end method

.method private requestAlbum(Landroid/content/Intent;)V
    .registers 3
    .parameter "intent"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->requestAlbum(Landroid/content/Intent;Z)V

    return-void
.end method

.method private sendMediaButtonBroadcast(II)V
    .registers 13
    .parameter "action"
    .parameter "keyCode"

    .prologue
    const/4 v9, 0x0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .local v1, eventtime:J
    new-instance v0, Landroid/view/KeyEvent;

    const/4 v7, 0x0

    move-wide v3, v1

    move v5, p1

    move v6, p2

    invoke-direct/range {v0 .. v7}, Landroid/view/KeyEvent;-><init>(JJIII)V

    .local v0, event:Landroid/view/KeyEvent;
    new-instance v8, Landroid/content/Intent;

    const-string v3, "android.intent.action.MEDIA_BUTTON"

    invoke-direct {v8, v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .local v8, intent:Landroid/content/Intent;
    const-string v3, "forbid_double_click"

    const/4 v4, 0x1

    invoke-virtual {v8, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v3, "android.intent.extra.KEY_EVENT"

    const/16 v4, 0x8

    invoke-static {v0, v4}, Landroid/view/KeyEvent;->changeFlags(Landroid/view/KeyEvent;I)Landroid/view/KeyEvent;

    move-result-object v4

    invoke-virtual {v8, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z

    move-result v3

    if-nez v3, :cond_4c

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/os/PowerManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v3

    if-eqz v3, :cond_4c

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$000(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    move-result-object v3

    invoke-interface {v3}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    :cond_4c
    return-void
.end method

.method private setAlbumInfo(Landroid/content/Intent;)V
    .registers 10
    .parameter "intent"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x0

    iget-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnable:Z

    if-nez v3, :cond_8

    :goto_7
    return-void

    :cond_8
    iput-boolean v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumChanged:Z

    const-string v3, "album"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumName:Ljava/lang/String;

    const-string v3, "artist"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mArtistName:Ljava/lang/String;

    :try_start_1a
    const-string v3, "tmp_album_path"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, albumPath:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, bm:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_4a

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_4a

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;
    :try_end_2b
    .catchall {:try_start_1a .. :try_end_2b} :catchall_9b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1a .. :try_end_2b} :catch_4e

    :goto_2b
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_71

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_3b
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_7e

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    :goto_46
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startTrackChangeAnim()V

    goto :goto_7

    :cond_4a
    const/4 v3, 0x0

    :try_start_4b
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;
    :try_end_4d
    .catchall {:try_start_4b .. :try_end_4d} :catchall_9b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4b .. :try_end_4d} :catch_4e

    goto :goto_2b

    .end local v0           #albumPath:Ljava/lang/String;
    .end local v1           #bm:Landroid/graphics/Bitmap;
    :catch_4e
    move-exception v2

    .local v2, e:Ljava/lang/OutOfMemoryError;
    const/4 v3, 0x0

    :try_start_50
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;
    :try_end_52
    .catchall {:try_start_50 .. :try_end_52} :catchall_9b

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_86

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_62
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_93

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    :goto_6d
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startTrackChangeAnim()V

    goto :goto_7

    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    .restart local v0       #albumPath:Ljava/lang/String;
    .restart local v1       #bm:Landroid/graphics/Bitmap;
    :cond_71
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_3b

    :cond_7e
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_46

    .end local v0           #albumPath:Ljava/lang/String;
    .end local v1           #bm:Landroid/graphics/Bitmap;
    .restart local v2       #e:Ljava/lang/OutOfMemoryError;
    :cond_86
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_62

    :cond_93
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_6d

    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catchall_9b
    move-exception v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_bb

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_ac
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_c8

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    :goto_b7
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startTrackChangeAnim()V

    throw v3

    :cond_bb
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_ac

    :cond_c8
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_b7
.end method

.method private setTrackInfo(Landroid/content/Intent;)V
    .registers 9
    .parameter "intent"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const-string v2, "track"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, title:Ljava/lang/String;
    const-string v2, "artist"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, artist:Ljava/lang/String;
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mIsOnlineSongBlocking:Z

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_24

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_23
    return-void

    :cond_24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3a

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_2f
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_23

    :cond_3a
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_46

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2f

    :cond_46
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    const-string v3, "%s-%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    aput-object v0, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2f
.end method

.method private setupMusicControl()V
    .registers 6

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x6030012

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    const/16 v4, 0x50

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b0041

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b0044

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicatorId:I

    if-eqz v0, :cond_49

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    iget v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicatorId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_49
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b0042

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b0043

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b003d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicPlayPauseButton:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicPlayPauseButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b0040

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lmiui/widget/SpectrumVisualizer;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mSpectrumVisualizer:Lmiui/widget/SpectrumVisualizer;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b003e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/policy/impl/AlbumFrameView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const v1, 0x60b003f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/policy/impl/AlbumFrameView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->init()V

    return-void
.end method

.method private showAlbum()V
    .registers 5

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0, v3}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0, v2}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_23

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_1d
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2000(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    return-void

    :cond_23
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1d
.end method

.method private startAlbumAnim(I)V
    .registers 4
    .parameter "type"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->clearAnimation()V

    packed-switch p1, :pswitch_data_22

    :goto_8
    return-void

    :pswitch_9
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->showAlbum()V

    goto :goto_8

    :pswitch_14
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_8

    :pswitch_1c
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    goto :goto_8

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_9
        :pswitch_14
    .end packed-switch
.end method

.method private startTrackChangeAnim()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->clearAnimation()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->clearAnimation()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2000(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method private updateMusic()V
    .registers 5

    .prologue
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-nez v2, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v0

    .local v0, isMusicActive:Z
    move v1, v0

    .local v1, isShowPlaying:Z
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mIsOnlineSongBlocking:Z

    if-eqz v2, :cond_11

    const/4 v1, 0x1

    :cond_11
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicPlayPauseButton:Landroid/widget/ImageView;

    if-eqz v1, :cond_27

    const v2, 0x60200ae

    :goto_18
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    packed-switch v2, :pswitch_data_32

    goto :goto_4

    :pswitch_21
    if-eqz v0, :cond_4

    const/4 v2, 0x2

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    goto :goto_4

    :cond_27
    const v2, 0x60200b1

    goto :goto_18

    :pswitch_2b
    if-nez v0, :cond_4

    const/4 v2, 0x1

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    goto :goto_4

    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_21
        :pswitch_2b
    .end packed-switch
.end method

.method private updateSpectrumVisualizer()V
    .registers 3

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mSpectrumVisualizer:Lmiui/widget/SpectrumVisualizer;

    if-nez v1, :cond_6

    :goto_5
    return-void

    :cond_6
    const/4 v1, 0x3

    invoke-static {v1, v0}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1e

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z

    move-result v1

    if-nez v1, :cond_1e

    const/4 v0, 0x1

    .local v0, isEnable:Z
    :cond_1e
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mSpectrumVisualizer:Lmiui/widget/SpectrumVisualizer;

    invoke-virtual {v1, v0}, Lmiui/widget/SpectrumVisualizer;->enableUpdate(Z)V

    goto :goto_5
.end method


# virtual methods
.method public addCheckStreamCallbacks()V
    .registers 2

    .prologue
    const/16 v0, 0x3e8

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->addCheckStreamCallbacks(I)V

    return-void
.end method

.method public addCheckStreamCallbacks(I)V
    .registers 6
    .parameter "delayTime"

    .prologue
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mCheckStreamMusicRunnable:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public clearAnimation()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    :cond_9
    return-void
.end method

.method public enableAlbum(Z)V
    .registers 5
    .parameter "enable"

    .prologue
    const/4 v2, 0x0

    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnable:Z

    iget-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumChanged:Z

    if-eqz v1, :cond_b

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    :cond_b
    if-eqz p1, :cond_1c

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v0

    .local v0, isMusicActive:Z
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mIsOnlineSongBlocking:Z

    if-nez v1, :cond_19

    if-eqz v0, :cond_1c

    :cond_19
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->requestAlbum()V

    .end local v0           #isMusicActive:Z
    :cond_1c
    return-void
.end method

.method public getMusicControl()Landroid/view/View;
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-nez v0, :cond_7

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setupMusicControl()V

    :cond_7
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateMusic()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    return-object v0
.end method

.method public init()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v8

    const v9, 0x6040002

    invoke-static {v8, v9}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeInAnim:Landroid/view/animation/Animation;

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v8

    const v9, 0x6040003

    invoke-static {v8, v9}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeOutAnim:Landroid/view/animation/Animation;

    iput-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumChanged:Z

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x60200a9

    invoke-static {v8, v9}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    new-instance v2, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$1;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController$1;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    .local v2, animationListener:Landroid/view/animation/Animation$AnimationListener;
    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v8, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v8, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v8, v10}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$1400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .local v6, res:Landroid/content/res/Resources;
    const v8, 0x60200a3

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v4

    .local v4, is:Ljava/io/InputStream;
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .local v5, rect:Landroid/graphics/Rect;
    invoke-static {v6, v11, v4, v5, v11}, Landroid/graphics/BitmapFactory;->decodeResourceStream(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, albumFilter:Landroid/graphics/Bitmap;
    if-eqz v4, :cond_68

    :try_start_65
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_68
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_68} :catch_bd

    :cond_68
    :goto_68
    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setRect(Landroid/graphics/Rect;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setFilterBitmap(Landroid/graphics/Bitmap;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v8, v9}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8}, Lcom/miui/internal/policy/impl/AlbumFrameView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .local v1, albumView:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    iput v8, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    iput v8, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v1}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v5}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setRect(Landroid/graphics/Rect;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v0}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setFilterBitmap(Landroid/graphics/Bitmap;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mDefaultAlbum:Landroid/graphics/Bitmap;

    invoke-virtual {v8, v9}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8}, Lcom/miui/internal/policy/impl/AlbumFrameView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/widget/FrameLayout$LayoutParams;

    .local v7, tempAlbumView:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    iput v8, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v8, v7}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .end local v1           #albumView:Landroid/widget/FrameLayout$LayoutParams;
    .end local v7           #tempAlbumView:Landroid/widget/FrameLayout$LayoutParams;
    :catch_bd
    move-exception v3

    .local v3, e:Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_68
.end method

.method public isMusicControlVisible()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isMusicStatusNone()Z
    .registers 2

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public onPause()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-eqz v0, :cond_12

    invoke-direct {p0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableMusicControl(Z)V

    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableAlbum(Z)V

    :cond_12
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateSpectrumVisualizer()V

    return-void
.end method

.method public onResume()V
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$3500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lmiui/util/AudioOutputHelper;->hasActiveReceivers(Landroid/content/Context;)Z

    move-result v0

    .local v0, isMusicActive:Z
    if-eqz v0, :cond_31

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-nez v1, :cond_15

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setupMusicControl()V

    :cond_15
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    const/4 v2, 0x4

    #setter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I

    const/4 v1, 0x2

    iput v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableMusicControl(Z)V

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableAlbum(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2d
    :goto_2d
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->addCheckStreamCallbacks()V

    return-void

    :cond_31
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #setter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-eqz v1, :cond_2d

    invoke-direct {p0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableMusicControl(Z)V

    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableAlbum(Z)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->hideAlbum()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateSpectrumVisualizer()V

    goto :goto_2d
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v5, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/16 v1, 0x55

    .local v1, keyCode:I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_5e

    :goto_c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v0, v4, 0xff

    .local v0, action:I
    if-nez v0, :cond_2a

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/internal/policy/impl/SlidingPanel;->requestDisallowInterceptTouchEvent(Z)V

    invoke-direct {p0, v2, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->sendMediaButtonBroadcast(II)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    :cond_23
    :goto_23
    return v3

    .end local v0           #action:I
    :pswitch_24
    const/16 v1, 0x58

    goto :goto_c

    :pswitch_27
    const/16 v1, 0x57

    goto :goto_c

    .restart local v0       #action:I
    :cond_2a
    if-eq v0, v3, :cond_2f

    const/4 v4, 0x3

    if-ne v0, v4, :cond_23

    :cond_2f
    invoke-direct {p0, v3, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->sendMediaButtonBroadcast(II)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    const/16 v4, 0x55

    if-ne v1, v4, :cond_3e

    iget v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    if-ne v4, v5, :cond_3e

    move v2, v3

    .local v2, showPlayIcon:Z
    :cond_3e
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicPlayPauseButton:Landroid/widget/ImageView;

    if-eqz v2, :cond_58

    const v4, 0x60200b1

    :goto_45
    invoke-virtual {v6, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    if-eqz v2, :cond_5c

    move v4, v3

    :goto_4b
    iput v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mSpectrumVisualizer:Lmiui/widget/SpectrumVisualizer;

    invoke-virtual {v4, v3}, Lmiui/widget/SpectrumVisualizer;->enableUpdate(Z)V

    const/16 v4, 0xbb8

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->addCheckStreamCallbacks(I)V

    goto :goto_23

    :cond_58
    const v4, 0x60200ae

    goto :goto_45

    :cond_5c
    move v4, v5

    goto :goto_4b

    :pswitch_data_5e
    .packed-switch 0x60b0042
        :pswitch_24
        :pswitch_27
    .end packed-switch
.end method

.method public registerPlayerStatusListener()V
    .registers 6

    .prologue
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "com.miui.player.metachanged"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "lockscreen.action.SONG_METADATA_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.miui.player.refreshprogress"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.miui.player.playstatechanged"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$3200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mPlayerStatusListener:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method public removeCheckStreamCallbacks()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mCheckStreamMusicRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public requestAlbum(Landroid/content/Intent;Z)V
    .registers 10
    .parameter "intent"
    .parameter "forceRequest"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumChanged:Z

    iget-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnable:Z

    if-nez v5, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    const-string v5, "album"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, albumName:Ljava/lang/String;
    const-string v5, "artist"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, artistName:Ljava/lang/String;
    if-nez v0, :cond_19

    const-string v0, ""

    :cond_19
    if-nez v2, :cond_1d

    const-string v2, ""

    :cond_1d
    if-nez p2, :cond_37

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mArtistName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    if-nez v5, :cond_8

    :cond_33
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mEnable:Z

    if-eqz v5, :cond_8

    :cond_37
    const-string v5, "album_uri"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    .local v4, uri:Landroid/net/Uri;
    const/4 v3, 0x0

    .local v3, isNeedRequest:Z
    if-eqz v4, :cond_54

    const/4 v3, 0x1

    :cond_43
    :goto_43
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    iput-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumBm:Landroid/graphics/Bitmap;

    iput-object v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mAlbumBm:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mTempAlbumView:Lcom/miui/internal/policy/impl/AlbumFrameView;

    invoke-virtual {v5, v6}, Lcom/miui/internal/policy/impl/AlbumFrameView;->setDisplayBitmap(Landroid/graphics/Bitmap;)V

    if-eqz v3, :cond_5e

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->requestAlbum()V

    goto :goto_8

    :cond_54
    const-string v5, "album_path"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, albumPath:Ljava/lang/String;
    if-eqz v1, :cond_43

    const/4 v3, 0x1

    goto :goto_43

    .end local v1           #albumPath:Ljava/lang/String;
    :cond_5e
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startTrackChangeAnim()V

    goto :goto_8
.end method

.method public setBatteryIndicator(I)V
    .registers 4
    .parameter "resId"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicator:Landroid/widget/ImageView;

    iget v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicBatteryIndicatorId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_b
    return-void
.end method

.method public shouldShowMusic()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    iget v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_a

    iget v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    if-ne v1, v0, :cond_12

    :cond_a
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-nez v1, :cond_11

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setupMusicControl()V

    :cond_11
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public toggleMusicControl()V
    .registers 7

    .prologue
    const/4 v0, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    if-nez v5, :cond_a

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setupMusicControl()V

    :cond_a
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicControl:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_2e

    move v2, v3

    .local v2, isMusicShowNow:Z
    :goto_13
    const/4 v5, 0x3

    invoke-static {v5, v4}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v1

    .local v1, isMusicActive:Z
    if-nez v2, :cond_33

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    const/4 v5, 0x4

    #setter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I

    if-eqz v1, :cond_30

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    :goto_24
    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableMusicControl(Z)V

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableAlbum(Z)V

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startAlbumAnim(I)V

    :goto_2d
    return-void

    .end local v1           #isMusicActive:Z
    .end local v2           #isMusicShowNow:Z
    :cond_2e
    move v2, v4

    goto :goto_13

    .restart local v1       #isMusicActive:Z
    .restart local v2       #isMusicShowNow:Z
    :cond_30
    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    goto :goto_24

    :cond_33
    iput v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mMusicStatus:I

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #setter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I
    invoke-static {v3, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableAlbum(Z)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$2200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z

    move-result v3

    if-eqz v3, :cond_46

    move v0, v4

    .local v0, animType:I
    :cond_46
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->startAlbumAnim(I)V

    invoke-direct {p0, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->enableMusicControl(Z)V

    goto :goto_2d
.end method

.method public unregisterPlayerStatusListener()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$3300(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->mPlayerStatusListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method
