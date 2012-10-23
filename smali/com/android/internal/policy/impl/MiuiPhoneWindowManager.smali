.class public Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;
.super Lcom/android/internal/policy/impl/PhoneWindowManager;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;,
        Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;,
        Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;,
        Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;
    }
.end annotation


# static fields
.field private static final BTN_MOUSE:I = 0x110

.field static final TYPE_LAYER_MULTIPLIER:I = 0x2710

.field static final TYPE_LAYER_OFFSET:I = 0x3e8

.field private static sBackLongPressWhiteList:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

.field private mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

.field mBackLongPressed:Z

.field private mBackPressed:Z

.field private mBinder:Landroid/os/Binder;

.field mCameraKeyWakeScreen:Z

.field private mDisableProximitor:Z

.field private mDownX:I

.field private mDownY:I

.field private mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

.field private mHasCameraFlash:Z

.field private mHomeDownWhileScreenOn:Z

.field private mIsStatusBarVisibleInFullscreen:Z

.field private mIsTouchDown:Z

.field private mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

.field private mMagnifierInputChannel:Landroid/view/InputChannel;

.field private mMagnifierInputEventReceiver:Landroid/view/InputEventReceiver;

.field private mMenuPressed:Z

.field private mMiuiBootMsgDialog:Landroid/app/Dialog;

.field private mMsgText:Landroid/widget/TextView;

.field mPowerLongPressOriginal:Ljava/lang/Runnable;

.field private mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

.field mScreenButtonsDisabled:Z

.field private mScreenOffReason:I

.field mScreenshotReceiver:Landroid/content/BroadcastReceiver;

.field private mShortcutTriggered:Z

.field private mShowMagnifier:Z

.field mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

.field mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

.field private mStatusBarInputChannel:Landroid/view/InputChannel;

.field private mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

.field private mTorchEnabled:Z

.field mTrackballWakeScreen:Z

.field private mVolumeDownPressed:Z

.field mVolumeKeyWakeScreen:Z

.field private mVolumeUpPressed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 677
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    .line 679
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.systemui"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 680
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.phone"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 681
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.mms"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 682
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.contacts"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 683
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.miui.home"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 684
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.miui.fmradio"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 685
    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Lcom/android/internal/policy/impl/PhoneWindowManager;-><init>()V

    .line 90
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mPowerLongPress:Ljava/lang/Runnable;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mPowerLongPressOriginal:Ljava/lang/Runnable;

    .line 500
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBinder:Landroid/os/Binder;

    .line 502
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$3;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$3;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

    .line 586
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$4;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$4;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotReceiver:Landroid/content/BroadcastReceiver;

    .line 650
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

    .line 664
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHasCameraFlash:Z

    .line 665
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 676
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    .line 783
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setStatusBarInFullscreen(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    return v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownX:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownX:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownY:I

    return v0
.end method

.method static synthetic access$302(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownY:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsTouchDown:Z

    return v0
.end method

.method static synthetic access$402(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsTouchDown:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifier:Z

    return v0
.end method

.method static synthetic access$502(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifier:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/app/Dialog;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$800(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/widget/TextView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$802(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/widget/TextView;)Landroid/widget/TextView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/graphics/drawable/AnimationDrawable;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    return-object v0
.end method

.method static synthetic access$902(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/graphics/drawable/AnimationDrawable;)Landroid/graphics/drawable/AnimationDrawable;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    return-object p1
.end method

.method static getStatusBarManagerService()Lcom/android/internal/statusbar/IStatusBarService;
    .registers 3

    .prologue
    .line 907
    const-string v1, "statusbar"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/statusbar/IStatusBarService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/statusbar/IStatusBarService;

    move-result-object v0

    .line 909
    .local v0, service:Lcom/android/internal/statusbar/IStatusBarService;
    if-nez v0, :cond_13

    .line 910
    const-string v1, "WindowManager"

    const-string v2, "Unable to find IStatusBarService interface."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 912
    :cond_13
    return-object v0
.end method

.method static getWindownManagerService()Landroid/view/IWindowManager;
    .registers 3

    .prologue
    .line 916
    const-string v1, "window"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    .line 918
    .local v0, service:Landroid/view/IWindowManager;
    if-nez v0, :cond_13

    .line 919
    const-string v1, "WindowManager"

    const-string v2, "Unable to find IPowerManager interface."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 921
    :cond_13
    return-object v0
.end method

.method private isEnableKeyguardTorch()Z
    .registers 2

    .prologue
    .line 661
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHasCameraFlash:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private releaseScreenOnProximitySensor()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 180
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mSystemReady:Z

    if-nez v1, :cond_6

    .line 182
    :goto_5
    return v0

    .line 181
    :cond_6
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    .line 182
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->release()Z

    move-result v0

    goto :goto_5
.end method

.method private setMaxBacklightBrightness()V
    .registers 3

    .prologue
    .line 461
    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v0

    .line 463
    .local v0, power:Landroid/os/IPowerManager;
    const/16 v1, 0xff

    :try_start_c
    invoke-interface {v0, v1}, Landroid/os/IPowerManager;->setBacklightBrightness(I)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_f} :catch_10

    .line 466
    :goto_f
    return-void

    .line 464
    :catch_10
    move-exception v1

    goto :goto_f
.end method

.method private setStatusBarInFullscreen(Z)V
    .registers 8
    .parameter "show"

    .prologue
    const/4 v2, 0x0

    .line 509
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    .line 511
    :try_start_3
    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarService:Lcom/android/internal/statusbar/IStatusBarService;

    if-eqz p1, :cond_1c

    const/high16 v1, 0x2000

    :goto_9
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBinder:Landroid/os/Binder;

    const-string v5, "android"

    invoke-interface {v3, v1, v4, v5}, Lcom/android/internal/statusbar/IStatusBarService;->disable(ILandroid/os/IBinder;Ljava/lang/String;)V
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_10} :catch_1e

    .line 519
    :goto_10
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-eqz v1, :cond_1b

    .line 520
    if-eqz p1, :cond_23

    .line 521
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    invoke-interface {v1, v2}, Landroid/view/WindowManagerPolicy$WindowState;->showLw(Z)Z

    .line 527
    :cond_1b
    :goto_1b
    return-void

    :cond_1c
    move v1, v2

    .line 511
    goto :goto_9

    .line 515
    :catch_1e
    move-exception v0

    .line 516
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_10

    .line 524
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_23
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/view/WindowManagerPolicy$WindowState;->hideLw(Z)Z

    goto :goto_1b
.end method

.method private setTorch(Z)V
    .registers 4
    .parameter "enable"

    .prologue
    .line 669
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 670
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.TOGGLE_TORCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 671
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "miui.intent.extra.IS_ENABLE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 672
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 673
    return-void
.end method


# virtual methods
.method public canBeForceHidden(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z
    .registers 5
    .parameter "win"
    .parameter "attrs"

    .prologue
    .line 936
    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v1, 0x4000

    and-int/2addr v0, v1

    if-eqz v0, :cond_9

    .line 937
    const/4 v0, 0x0

    .line 939
    :goto_8
    return v0

    :cond_9
    invoke-super {p0, p1, p2}, Lcom/android/internal/policy/impl/PhoneWindowManager;->canBeForceHidden(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z

    move-result v0

    goto :goto_8
.end method

.method public doesForceHide(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z
    .registers 5
    .parameter "win"
    .parameter "attrs"

    .prologue
    .line 927
    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v1, 0x4000

    and-int/2addr v0, v1

    if-eqz v0, :cond_9

    .line 928
    const/4 v0, 0x0

    .line 930
    :goto_8
    return v0

    :cond_9
    invoke-super {p0, p1, p2}, Lcom/android/internal/policy/impl/PhoneWindowManager;->doesForceHide(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z

    move-result v0

    goto :goto_8
.end method

.method public finishAnimationLw()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 469
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 470
    .local v1, statusBar:Landroid/view/WindowManagerPolicy$WindowState;
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    if-eqz v2, :cond_9

    .line 471
    iput-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 473
    :cond_9
    invoke-super {p0}, Lcom/android/internal/policy/impl/PhoneWindowManager;->finishAnimationLw()I

    move-result v0

    .line 474
    .local v0, result:I
    iput-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 476
    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lmiui/app/ExtraStatusBarManager;->isExpandableUnderFullscreen(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_48

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-eqz v2, :cond_48

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    if-nez v2, :cond_48

    .line 478
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mTopIsFullscreen:Z

    if-eqz v2, :cond_49

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v2

    if-nez v2, :cond_49

    .line 479
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    if-nez v2, :cond_48

    .line 480
    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    const-string v3, "StatusBarView"

    invoke-interface {v2, v3}, Landroid/view/WindowManagerPolicy$WindowManagerFuncs;->monitorInput(Ljava/lang/String;)Landroid/view/InputChannel;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    .line 481
    new-instance v2, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    .line 496
    :cond_48
    :goto_48
    return v0

    .line 486
    :cond_49
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    if-eqz v2, :cond_54

    .line 487
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    invoke-virtual {v2}, Landroid/view/InputChannel;->dispose()V

    .line 488
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    .line 490
    :cond_54
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    if-eqz v2, :cond_48

    .line 491
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    invoke-virtual {v2}, Landroid/view/InputEventReceiver;->dispose()V

    .line 492
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    goto :goto_48
.end method

.method getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;
    .registers 4

    .prologue
    .line 641
    monitor-enter p0

    .line 642
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    if-nez v1, :cond_18

    .line 643
    const/16 v1, 0x7d0

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->windowTypeToLayerLw(I)I

    move-result v1

    mul-int/lit16 v1, v1, 0x2710

    add-int/lit16 v0, v1, 0x3e8

    .line 644
    .local v0, maxLayer:I
    new-instance v1, Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    .line 646
    .end local v0           #maxLayer:I
    :cond_18
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    monitor-exit p0

    return-object v1

    .line 647
    :catchall_1c
    move-exception v1

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_1c

    throw v1
.end method

.method public hideBootMessages()V
    .registers 3

    .prologue
    .line 895
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$7;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$7;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 904
    return-void
.end method

.method public init(Landroid/content/Context;Landroid/view/IWindowManager;Landroid/view/WindowManagerPolicy$WindowManagerFuncs;Landroid/os/LocalPowerManager;)V
    .registers 11
    .parameter "context"
    .parameter "windowManager"
    .parameter "windowManagerFuncs"
    .parameter "powerManager"

    .prologue
    .line 99
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/internal/policy/impl/PhoneWindowManager;->init(Landroid/content/Context;Landroid/view/IWindowManager;Landroid/view/WindowManagerPolicy$WindowManagerFuncs;Landroid/os/LocalPowerManager;)V

    .line 101
    new-instance v2, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, p0, v3}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/os/Handler;)V

    .line 102
    .local v2, settingsObserver:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;
    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->observe()V

    .line 104
    new-instance v3, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mPowerLongPress:Ljava/lang/Runnable;

    .line 118
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 119
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.CAPTURE_SCREENSHOT"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 122
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 123
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v3, "com.miui.app.ExtraStatusBarManager.EXIT_FULLSCREEN"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 124
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 126
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 127
    .local v1, pm:Landroid/content/pm/PackageManager;
    const-string v3, "android.hardware.camera.flash"

    invoke-virtual {v1, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHasCameraFlash:Z

    .line 128
    new-instance v3, Lmiui/util/HapticFeedbackUtil;

    const/4 v4, 0x0

    invoke-direct {v3, p1, v4}, Lmiui/util/HapticFeedbackUtil;-><init>(Landroid/content/Context;Z)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    .line 131
    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    const-string v4, "Magnifier"

    invoke-interface {v3, v4}, Landroid/view/WindowManagerPolicy$WindowManagerFuncs;->monitorInput(Ljava/lang/String;)Landroid/view/InputChannel;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputChannel:Landroid/view/InputChannel;

    .line 132
    new-instance v3, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputChannel:Landroid/view/InputChannel;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v3, p0, v4, v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputEventReceiver:Landroid/view/InputEventReceiver;

    .line 134
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 135
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SHOW_MAGNIFIER"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 136
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 137
    return-void
.end method

.method public interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J
    .registers 19
    .parameter "win"
    .parameter "event"
    .parameter "policyFlags"

    .prologue
    .line 187
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    .line 188
    .local v6, keyCode:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v8

    .line 189
    .local v8, repeatCount:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v11

    if-nez v11, :cond_24

    const/4 v3, 0x1

    .line 191
    .local v3, down:Z
    :goto_f
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    if-nez v11, :cond_21

    iget-boolean v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mSystemReady:Z

    if-eqz v11, :cond_26

    iget-object v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->shouldBeBlocked(Landroid/view/KeyEvent;)Z

    move-result v11

    if-eqz v11, :cond_26

    .line 192
    :cond_21
    const-wide/16 v11, -0x1

    .line 314
    :goto_23
    return-wide v11

    .line 189
    .end local v3           #down:Z
    :cond_24
    const/4 v3, 0x0

    goto :goto_f

    .line 199
    .restart local v3       #down:Z
    :cond_26
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    if-eqz v11, :cond_2d

    .line 200
    sparse-switch v6, :sswitch_data_196

    .line 209
    :cond_2d
    const/4 v11, 0x3

    if-ne v6, v11, :cond_72

    .line 210
    if-eqz v3, :cond_65

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->isEnableKeyguardTorch()Z

    move-result v11

    if-eqz v11, :cond_65

    .line 211
    if-nez v8, :cond_47

    .line 212
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 213
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenOnFully:Z

    iput-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHomeDownWhileScreenOn:Z

    .line 223
    :cond_41
    :goto_41
    const-wide/16 v11, -0x1

    goto :goto_23

    .line 205
    :sswitch_44
    const-wide/16 v11, -0x1

    goto :goto_23

    .line 215
    :cond_47
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    if-eqz v11, :cond_56

    .line 216
    rem-int/lit8 v11, v8, 0xa

    const/4 v12, 0x6

    if-ne v11, v12, :cond_41

    .line 217
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->pokeWakelock()V

    goto :goto_41

    .line 220
    :cond_56
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHomeDownWhileScreenOn:Z

    if-eqz v11, :cond_41

    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v11

    if-eqz v11, :cond_41

    .line 221
    const/4 v11, 0x1

    invoke-direct {p0, v11}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setTorch(Z)V

    goto :goto_41

    .line 225
    :cond_65
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    if-eqz v11, :cond_6d

    .line 226
    const/4 v11, 0x0

    invoke-direct {p0, v11}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setTorch(Z)V

    .line 314
    :cond_6d
    :goto_6d
    invoke-super/range {p0 .. p3}, Lcom/android/internal/policy/impl/PhoneWindowManager;->interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J

    move-result-wide v11

    goto :goto_23

    .line 229
    :cond_72
    const/16 v11, 0x52

    if-ne v6, v11, :cond_bd

    .line 230
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    if-nez v11, :cond_6d

    if-eqz v3, :cond_6d

    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v11

    if-eqz v11, :cond_6d

    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isSecure()Z

    move-result v11

    if-eqz v11, :cond_92

    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v11

    if-nez v11, :cond_6d

    .line 232
    :cond_92
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "enable_assist_menu_key_long_press"

    const/4 v13, 0x1

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 235
    .local v1, assistFlag:I
    if-eqz v1, :cond_6d

    .line 236
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    .line 238
    :try_start_a4
    new-instance v5, Landroid/content/Intent;

    const-string v11, "android.intent.action.MAIN"

    invoke-direct {v5, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 239
    .local v5, intent:Landroid/content/Intent;
    const-string v11, "android.intent.action.ASSIST"

    invoke-virtual {v5, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 240
    const/high16 v11, 0x1000

    invoke-virtual {v5, v11}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 241
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_ba
    .catch Landroid/content/ActivityNotFoundException; {:try_start_a4 .. :try_end_ba} :catch_bb

    goto :goto_6d

    .line 243
    .end local v5           #intent:Landroid/content/Intent;
    :catch_bb
    move-exception v11

    goto :goto_6d

    .line 248
    .end local v1           #assistFlag:I
    :cond_bd
    const/4 v11, 0x4

    if-ne v6, v11, :cond_6d

    .line 249
    if-eqz v3, :cond_18e

    .line 250
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v11

    if-eqz v11, :cond_127

    .line 251
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "enable_snapshot_screenlock"

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v9

    .line 255
    .local v9, snapshotFlag:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v11

    if-eqz v11, :cond_172

    if-eqz v9, :cond_172

    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isSecure()Z

    move-result v11

    if-nez v11, :cond_172

    .line 256
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 258
    .local v7, packageManager:Landroid/content/pm/PackageManager;
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 259
    .restart local v5       #intent:Landroid/content/Intent;
    const/high16 v11, 0x1000

    invoke-virtual {v5, v11}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 260
    const/high16 v11, 0x800

    invoke-virtual {v5, v11}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 262
    const-string v11, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v5, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    const-string v11, "captureAfterLaunch"

    const/4 v12, 0x1

    invoke-virtual {v5, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 265
    const-string v11, "android.intent.extras.CAMERA_FACING"

    const/4 v12, 0x0

    invoke-virtual {v5, v11, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 267
    const/4 v11, 0x0

    invoke-virtual {v7, v5, v11}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_123

    .line 268
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->keyguardDone(Z)V

    .line 269
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 272
    :cond_123
    const-wide/16 v11, -0x1

    goto/16 :goto_23

    .line 274
    .end local v5           #intent:Landroid/content/Intent;
    .end local v7           #packageManager:Landroid/content/pm/PackageManager;
    .end local v9           #snapshotFlag:I
    :cond_127
    if-nez v8, :cond_172

    .line 275
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPressed:Z

    .line 278
    if-eqz p1, :cond_17a

    invoke-interface/range {p1 .. p1}, Landroid/view/WindowManagerPolicy$WindowState;->getAttrs()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 279
    .local v2, attrs:Landroid/view/WindowManager$LayoutParams;
    :goto_132
    if-eqz v2, :cond_172

    sget-object v11, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    iget-object v12, v2, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_172

    iget v11, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v12, 0x1

    if-lt v11, v12, :cond_149

    iget v11, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v12, 0x63

    if-le v11, v12, :cond_155

    :cond_149
    iget v11, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v12, 0x3e8

    if-lt v11, v12, :cond_172

    iget v11, v2, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v12, 0x7cf

    if-gt v11, v12, :cond_172

    .line 288
    :cond_155
    :try_start_155
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "back_key_long_press_timeout"

    invoke-static {v11, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v10

    .line 291
    .local v10, timeout:I
    iget-object v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;->setTarget(Landroid/view/WindowManagerPolicy$WindowState;)V
    :try_end_168
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_155 .. :try_end_168} :catch_17c

    .line 302
    :goto_168
    if-lez v10, :cond_172

    .line 303
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v12, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    int-to-long v13, v10

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 311
    .end local v2           #attrs:Landroid/view/WindowManager$LayoutParams;
    .end local v10           #timeout:I
    :cond_172
    :goto_172
    iget-boolean v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPressed:Z

    if-eqz v11, :cond_6d

    const-wide/16 v11, -0x1

    goto/16 :goto_23

    .line 278
    :cond_17a
    const/4 v2, 0x0

    goto :goto_132

    .line 292
    .restart local v2       #attrs:Landroid/view/WindowManager$LayoutParams;
    :catch_17c
    move-exception v4

    .line 294
    .local v4, e:Landroid/provider/Settings$SettingNotFoundException;
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v10

    .line 295
    .restart local v10       #timeout:I
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "back_key_long_press_timeout"

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_168

    .line 308
    .end local v2           #attrs:Landroid/view/WindowManager$LayoutParams;
    .end local v4           #e:Landroid/provider/Settings$SettingNotFoundException;
    .end local v10           #timeout:I
    :cond_18e
    iget-object v11, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v12, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    invoke-virtual {v11, v12}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_172

    .line 200
    :sswitch_data_196
    .sparse-switch
        0x3 -> :sswitch_44
        0x4 -> :sswitch_44
        0x52 -> :sswitch_44
        0x54 -> :sswitch_44
    .end sparse-switch
.end method

.method public interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I
    .registers 17
    .parameter "event"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    .line 319
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    .line 320
    .local v4, keyCode:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v9

    if-nez v9, :cond_61

    const/4 v1, 0x1

    .line 321
    .local v1, down:Z
    :goto_b
    const/high16 v9, 0x100

    and-int/2addr v9, p2

    if-eqz v9, :cond_63

    const/4 v2, 0x1

    .line 323
    .local v2, isInjected:Z
    :goto_11
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    if-eqz v9, :cond_18

    .line 324
    sparse-switch v4, :sswitch_data_134

    .line 345
    :cond_18
    const/16 v9, 0x52

    if-ne v4, v9, :cond_84

    .line 346
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    .line 358
    :cond_1e
    :goto_1e
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-nez v9, :cond_31

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackPressed:Z

    if-nez v9, :cond_31

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    if-nez v9, :cond_31

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    if-nez v9, :cond_31

    .line 359
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    .line 362
    :cond_31
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    if-nez v9, :cond_47

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mSystemReady:Z

    if-eqz v9, :cond_47

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackPressed:Z

    if-eqz v9, :cond_47

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    if-eqz v9, :cond_47

    .line 363
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->releaseScreenOnProximitySensor()Z

    move-result v9

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    .line 366
    :cond_47
    if-eqz p3, :cond_98

    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v5

    .line 369
    .local v5, keyguardActive:Z
    :goto_4f
    if-nez p3, :cond_53

    if-eqz v2, :cond_9f

    .line 371
    :cond_53
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    if-eqz v9, :cond_cc

    if-eqz v5, :cond_cc

    const/16 v9, 0x1b

    if-ne v4, v9, :cond_cc

    if-nez v1, :cond_cc

    .line 372
    const/4 v9, 0x4

    .line 457
    .end local v5           #keyguardActive:Z
    :goto_60
    return v9

    .line 320
    .end local v1           #down:Z
    .end local v2           #isInjected:Z
    :cond_61
    const/4 v1, 0x0

    goto :goto_b

    .line 321
    .restart local v1       #down:Z
    :cond_63
    const/4 v2, 0x0

    goto :goto_11

    .line 326
    .restart local v2       #isInjected:Z
    :sswitch_65
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    .line 330
    :sswitch_67
    const/4 v9, 0x0

    goto :goto_60

    .line 333
    :sswitch_69
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    if-eqz v9, :cond_18

    .line 334
    if-nez v1, :cond_82

    .line 335
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    .line 336
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->interceptPowerKeyUp(Z)Z

    .line 337
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    new-instance v10, Landroid/content/Intent;

    const-string v11, "com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_SCREEN_BUTTONS"

    invoke-direct {v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 339
    :cond_82
    const/4 v9, 0x0

    goto :goto_60

    .line 348
    :cond_84
    const/4 v9, 0x4

    if-ne v4, v9, :cond_8a

    .line 349
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackPressed:Z

    goto :goto_1e

    .line 351
    :cond_8a
    const/16 v9, 0x18

    if-ne v4, v9, :cond_91

    .line 352
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    goto :goto_1e

    .line 354
    :cond_91
    const/16 v9, 0x19

    if-ne v4, v9, :cond_1e

    .line 355
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    goto :goto_1e

    .line 366
    :cond_98
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v5

    goto :goto_4f

    .line 375
    .restart local v5       #keyguardActive:Z
    :cond_9f
    const/4 v3, 0x1

    .line 376
    .local v3, isWakeKey:Z
    const/4 v0, 0x0

    .line 379
    .local v0, allowToWake:Z
    sparse-switch v4, :sswitch_data_14a

    .line 400
    const/4 v3, 0x0

    .line 403
    :cond_a5
    :goto_a5
    if-eqz v3, :cond_cc

    .line 404
    if-eqz v0, :cond_ca

    .line 405
    if-eqz v1, :cond_bc

    .line 407
    const/4 v9, 0x0

    goto :goto_60

    .line 381
    :sswitch_ad
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTrackballWakeScreen:Z

    .line 382
    goto :goto_a5

    .line 385
    :sswitch_b0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    .line 386
    goto :goto_a5

    .line 390
    :sswitch_b3
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeKeyWakeScreen:Z

    .line 394
    iget v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenOffReason:I

    const/4 v10, 0x4

    if-ne v9, v10, :cond_a5

    .line 395
    const/4 v0, 0x0

    goto :goto_a5

    .line 409
    :cond_bc
    if-eqz v5, :cond_c8

    .line 410
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    const/16 v10, 0x1a

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->onWakeKeyWhenKeyguardShowingTq(IZ)Z

    .line 411
    const/4 v9, 0x0

    goto :goto_60

    .line 415
    :cond_c8
    const/4 v9, 0x2

    goto :goto_60

    .line 418
    :cond_ca
    and-int/lit8 p2, p2, -0x4

    .line 422
    .end local v0           #allowToWake:Z
    .end local v3           #isWakeKey:Z
    :cond_cc
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    if-nez v9, :cond_de

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-eqz v9, :cond_de

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    if-eqz v9, :cond_de

    .line 423
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    .line 424
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setMaxBacklightBrightness()V

    .line 427
    :cond_de
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    if-nez v9, :cond_fd

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-eqz v9, :cond_fd

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    if-eqz v9, :cond_fd

    .line 428
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShortcutTriggered:Z

    .line 429
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenshotChordLongPress:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 430
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenshotChordLongPress:Ljava/lang/Runnable;

    const-wide/16 v11, 0x0

    invoke-virtual {v9, v10, v11, v12}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 433
    :cond_fd
    if-eqz v1, :cond_12a

    .line 435
    const/16 v9, 0x1a

    if-ne v4, v9, :cond_130

    const/4 v7, 0x1

    .line 436
    .local v7, stopNotification:Z
    :goto_104
    if-nez v7, :cond_11f

    .line 437
    :try_start_106
    invoke-static {}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getWindownManagerService()Landroid/view/IWindowManager;

    move-result-object v8

    .line 438
    .local v8, wm:Landroid/view/IWindowManager;
    if-eqz v8, :cond_11f

    invoke-interface {v8}, Landroid/view/IWindowManager;->isKeyguardLocked()Z

    move-result v9

    if-eqz v9, :cond_11f

    .line 439
    const/16 v9, 0x19

    if-eq v4, v9, :cond_11e

    const/16 v9, 0x18

    if-eq v4, v9, :cond_11e

    const/16 v9, 0xa4

    if-ne v4, v9, :cond_11f

    .line 442
    :cond_11e
    const/4 v7, 0x1

    .line 447
    .end local v8           #wm:Landroid/view/IWindowManager;
    :cond_11f
    if-eqz v7, :cond_12a

    .line 448
    invoke-static {}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getStatusBarManagerService()Lcom/android/internal/statusbar/IStatusBarService;

    move-result-object v6

    .line 449
    .local v6, statusBarService:Lcom/android/internal/statusbar/IStatusBarService;
    if-eqz v6, :cond_12a

    .line 450
    invoke-interface {v6}, Lcom/android/internal/statusbar/IStatusBarService;->onPanelRevealed()V
    :try_end_12a
    .catch Landroid/os/RemoteException; {:try_start_106 .. :try_end_12a} :catch_132

    .line 457
    .end local v6           #statusBarService:Lcom/android/internal/statusbar/IStatusBarService;
    .end local v7           #stopNotification:Z
    :cond_12a
    :goto_12a
    invoke-super/range {p0 .. p3}, Lcom/android/internal/policy/impl/PhoneWindowManager;->interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I

    move-result v9

    goto/16 :goto_60

    .line 435
    :cond_130
    const/4 v7, 0x0

    goto :goto_104

    .line 453
    .restart local v7       #stopNotification:Z
    :catch_132
    move-exception v9

    goto :goto_12a

    .line 324
    :sswitch_data_134
    .sparse-switch
        0x3 -> :sswitch_65
        0x4 -> :sswitch_67
        0x1a -> :sswitch_69
        0x52 -> :sswitch_67
        0x54 -> :sswitch_67
    .end sparse-switch

    .line 379
    :sswitch_data_14a
    .sparse-switch
        0x18 -> :sswitch_b3
        0x19 -> :sswitch_b3
        0x1b -> :sswitch_b0
        0x110 -> :sswitch_ad
    .end sparse-switch
.end method

.method public performHapticFeedbackLw(Landroid/view/WindowManagerPolicy$WindowState;IZ)Z
    .registers 5
    .parameter "win"
    .parameter "effectId"
    .parameter "always"

    .prologue
    .line 776
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    invoke-virtual {v0, p2}, Lmiui/util/HapticFeedbackUtil;->isSupportedEffect(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 777
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    invoke-virtual {v0, p2, p3}, Lmiui/util/HapticFeedbackUtil;->performHapticFeedback(IZ)Z

    move-result v0

    .line 780
    :goto_e
    return v0

    :cond_f
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/PhoneWindowManager;->performHapticFeedbackLw(Landroid/view/WindowManagerPolicy$WindowState;IZ)Z

    move-result v0

    goto :goto_e
.end method

.method public removeWindowLw(Landroid/view/WindowManagerPolicy$WindowState;)V
    .registers 5
    .parameter "win"

    .prologue
    .line 141
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-ne v0, p1, :cond_10

    .line 142
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miui.app.ExtraStatusBarManager.UNLOADED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 144
    :cond_10
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->removeWindowLw(Landroid/view/WindowManagerPolicy$WindowState;)V

    .line 145
    return-void
.end method

.method public screenTurnedOff(I)V
    .registers 3
    .parameter "why"

    .prologue
    .line 173
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    .line 174
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenOffReason:I

    .line 175
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->releaseScreenOnProximitySensor()Z

    .line 176
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->screenTurnedOff(I)V

    .line 177
    return-void
.end method

.method public screenTurningOn(Landroid/view/WindowManagerPolicy$ScreenOnListener;)V
    .registers 5
    .parameter "screenOnListener"

    .prologue
    .line 155
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->screenTurningOn(Landroid/view/WindowManagerPolicy$ScreenOnListener;)V

    .line 156
    if-nez p1, :cond_f

    .line 157
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$2;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$2;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->onScreenTurnedOn(Lcom/android/internal/policy/impl/KeyguardViewManager$ShowListener;)V

    .line 162
    :cond_f
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mSystemReady:Z

    if-eqz v0, :cond_31

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    if-nez v0, :cond_31

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->isDeviceProvisioned()Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "enable_screen_on_proximity_sensor"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$System;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 167
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->aquire()V

    .line 169
    :cond_31
    return-void
.end method

.method public showBootMessage(Ljava/lang/CharSequence;Z)V
    .registers 5
    .parameter "msg"
    .parameter "always"

    .prologue
    .line 838
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 891
    return-void
.end method

.method public systemReady()V
    .registers 4

    .prologue
    .line 149
    invoke-super {p0}, Lcom/android/internal/policy/impl/PhoneWindowManager;->systemReady()V

    .line 150
    new-instance v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardViewMediator;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    .line 151
    return-void
.end method
