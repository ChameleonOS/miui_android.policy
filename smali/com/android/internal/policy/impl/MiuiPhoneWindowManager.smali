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

.field mReleaseProximitySensorReceiver:Landroid/content/BroadcastReceiver;

.field mScreenButtonsDisabled:Z

.field private mScreenOffReason:I

.field mScreenshotReceiver:Landroid/content/BroadcastReceiver;

.field private mScreenshotTrigger:Z

.field private mShowMagnifier:Z

.field mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

.field mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

.field private mStatusBarInputChannel:Landroid/view/InputChannel;

.field private mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

.field private mTorchEnabled:Z

.field mTrackballWakeScreen:Z

.field private mVoiceAssistantTriggerred:Z

.field private mVolumeDownPressed:Z

.field mVolumeKeyWakeScreen:Z

.field private mVolumeUpPressed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 680
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    .line 682
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.systemui"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 683
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.phone"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 684
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.mms"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 685
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.android.contacts"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 686
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.miui.home"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 687
    sget-object v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    const-string v1, "com.miui.fmradio"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 688
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

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    .line 496
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBinder:Landroid/os/Binder;

    .line 498
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$3;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$3;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

    .line 582
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$4;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$4;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotReceiver:Landroid/content/BroadcastReceiver;

    .line 646
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

    .line 656
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mReleaseProximitySensorReceiver:Landroid/content/BroadcastReceiver;

    .line 667
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHasCameraFlash:Z

    .line 668
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 679
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    .line 786
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

.method static synthetic access$1000(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/widget/TextView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/widget/TextView;)Landroid/widget/TextView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/graphics/drawable/AnimationDrawable;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/graphics/drawable/AnimationDrawable;)Landroid/graphics/drawable/AnimationDrawable;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;

    return-object p1
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

.method static synthetic access$600(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$902(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/app/Dialog;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static getStatusBarManagerService()Lcom/android/internal/statusbar/IStatusBarService;
    .registers 3

    .prologue
    .line 910
    const-string v1, "statusbar"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/statusbar/IStatusBarService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/statusbar/IStatusBarService;

    move-result-object v0

    .line 912
    .local v0, service:Lcom/android/internal/statusbar/IStatusBarService;
    if-nez v0, :cond_13

    .line 913
    const-string v1, "WindowManager"

    const-string v2, "Unable to find IStatusBarService interface."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 915
    :cond_13
    return-object v0
.end method

.method static getWindownManagerService()Landroid/view/IWindowManager;
    .registers 3

    .prologue
    .line 919
    const-string v1, "window"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    .line 921
    .local v0, service:Landroid/view/IWindowManager;
    if-nez v0, :cond_13

    .line 922
    const-string v1, "WindowManager"

    const-string v2, "Unable to find IPowerManager interface."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 924
    :cond_13
    return-object v0
.end method

.method private isEnableKeyguardTorch()Z
    .registers 2

    .prologue
    .line 664
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

.method private setMaxBacklightBrightness()V
    .registers 3

    .prologue
    .line 457
    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v0

    .line 459
    .local v0, power:Landroid/os/IPowerManager;
    const/16 v1, 0xff

    :try_start_c
    invoke-interface {v0, v1}, Landroid/os/IPowerManager;->setBacklightBrightness(I)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_f} :catch_10

    .line 462
    :goto_f
    return-void

    .line 460
    :catch_10
    move-exception v1

    goto :goto_f
.end method

.method private setStatusBarInFullscreen(Z)V
    .registers 8
    .parameter "show"

    .prologue
    const/4 v2, 0x0

    .line 505
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    .line 507
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

    .line 515
    :goto_10
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-eqz v1, :cond_1b

    .line 516
    if-eqz p1, :cond_23

    .line 517
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    invoke-interface {v1, v2}, Landroid/view/WindowManagerPolicy$WindowState;->showLw(Z)Z

    .line 523
    :cond_1b
    :goto_1b
    return-void

    :cond_1c
    move v1, v2

    .line 507
    goto :goto_9

    .line 511
    :catch_1e
    move-exception v0

    .line 512
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_10

    .line 520
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
    .line 672
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 673
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.TOGGLE_TORCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 674
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "miui.intent.extra.IS_ENABLE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 675
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 676
    return-void
.end method


# virtual methods
.method public canBeForceHidden(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/WindowManager$LayoutParams;)Z
    .registers 5
    .parameter "win"
    .parameter "attrs"

    .prologue
    .line 939
    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v1, 0x4000

    and-int/2addr v0, v1

    if-eqz v0, :cond_9

    .line 940
    const/4 v0, 0x0

    .line 942
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
    .line 930
    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v1, 0x4000

    and-int/2addr v0, v1

    if-eqz v0, :cond_9

    .line 931
    const/4 v0, 0x0

    .line 933
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

    .line 465
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 466
    .local v1, statusBar:Landroid/view/WindowManagerPolicy$WindowState;
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    if-eqz v2, :cond_9

    .line 467
    iput-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 469
    :cond_9
    invoke-super {p0}, Lcom/android/internal/policy/impl/PhoneWindowManager;->finishAnimationLw()I

    move-result v0

    .line 470
    .local v0, result:I
    iput-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    .line 472
    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lmiui/app/ExtraStatusBarManager;->isExpandableUnderFullscreen(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_48

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-eqz v2, :cond_48

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z

    if-nez v2, :cond_48

    .line 474
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mTopIsFullscreen:Z

    if-eqz v2, :cond_49

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v2

    if-nez v2, :cond_49

    .line 475
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    if-nez v2, :cond_48

    .line 476
    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    const-string v3, "StatusBarView"

    invoke-interface {v2, v3}, Landroid/view/WindowManagerPolicy$WindowManagerFuncs;->monitorInput(Ljava/lang/String;)Landroid/view/InputChannel;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    .line 477
    new-instance v2, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    .line 492
    :cond_48
    :goto_48
    return v0

    .line 482
    :cond_49
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    if-eqz v2, :cond_54

    .line 483
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    invoke-virtual {v2}, Landroid/view/InputChannel;->dispose()V

    .line 484
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputChannel:Landroid/view/InputChannel;

    .line 486
    :cond_54
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    if-eqz v2, :cond_48

    .line 487
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    invoke-virtual {v2}, Landroid/view/InputEventReceiver;->dispose()V

    .line 488
    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarInputEventReceiver:Landroid/view/InputEventReceiver;

    goto :goto_48
.end method

.method getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;
    .registers 4

    .prologue
    .line 637
    monitor-enter p0

    .line 638
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    if-nez v1, :cond_18

    .line 639
    const/16 v1, 0x7d0

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->windowTypeToLayerLw(I)I

    move-result v1

    mul-int/lit16 v1, v1, 0x2710

    add-int/lit16 v0, v1, 0x3e8

    .line 640
    .local v0, maxLayer:I
    new-instance v1, Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    .line 642
    .end local v0           #maxLayer:I
    :cond_18
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifier:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    monitor-exit p0

    return-object v1

    .line 643
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
    .line 898
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$8;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$8;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 907
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
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "device_provisioned"

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 104
    new-instance v2, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    invoke-direct {v2, p0, v3}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/os/Handler;)V

    .line 105
    .local v2, settingsObserver:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;
    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->observe()V

    .line 107
    new-instance v3, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$1;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mPowerLongPress:Ljava/lang/Runnable;

    .line 121
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 122
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.CAPTURE_SCREENSHOT"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 123
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 125
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 126
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v3, "com.miui.app.ExtraStatusBarManager.EXIT_FULLSCREEN"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mStatusBarExitFullscreenReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 129
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 130
    .local v1, pm:Landroid/content/pm/PackageManager;
    const-string v3, "android.hardware.camera.flash"

    invoke-virtual {v1, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHasCameraFlash:Z

    .line 131
    new-instance v3, Lmiui/util/HapticFeedbackUtil;

    const/4 v4, 0x0

    invoke-direct {v3, p1, v4}, Lmiui/util/HapticFeedbackUtil;-><init>(Landroid/content/Context;Z)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    .line 134
    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    const-string v4, "Magnifier"

    invoke-interface {v3, v4}, Landroid/view/WindowManagerPolicy$WindowManagerFuncs;->monitorInput(Ljava/lang/String;)Landroid/view/InputChannel;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputChannel:Landroid/view/InputChannel;

    .line 135
    new-instance v3, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputChannel:Landroid/view/InputChannel;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v3, p0, v4, v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMagnifierInputEventReceiver:Landroid/view/InputEventReceiver;

    .line 137
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 138
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SHOW_MAGNIFIER"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 139
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifierReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 141
    new-instance v0, Landroid/content/IntentFilter;

    .end local v0           #filter:Landroid/content/IntentFilter;
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 142
    .restart local v0       #filter:Landroid/content/IntentFilter;
    const-string v3, "miui.intent.action.RELEASE_PROXIMITY_SENSOR"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 143
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mReleaseProximitySensorReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 145
    new-instance v3, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct {v3, p1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    .line 146
    return-void
.end method

.method public interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J
    .registers 18
    .parameter "win"
    .parameter "event"
    .parameter "policyFlags"

    .prologue
    .line 179
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v5

    .line 180
    .local v5, keyCode:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 181
    .local v7, repeatCount:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v10

    if-nez v10, :cond_2d

    const/4 v2, 0x1

    .line 187
    .local v2, down:Z
    :goto_f
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    if-eqz v10, :cond_16

    .line 188
    sparse-switch v5, :sswitch_data_18e

    .line 197
    :cond_16
    const/4 v10, 0x3

    if-ne v5, v10, :cond_5f

    .line 198
    if-eqz v2, :cond_52

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->isEnableKeyguardTorch()Z

    move-result v10

    if-eqz v10, :cond_52

    .line 199
    if-nez v7, :cond_32

    .line 200
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    .line 201
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenOnFully:Z

    iput-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHomeDownWhileScreenOn:Z

    .line 211
    :cond_2a
    :goto_2a
    const-wide/16 v10, -0x1

    .line 305
    :goto_2c
    return-wide v10

    .line 181
    .end local v2           #down:Z
    :cond_2d
    const/4 v2, 0x0

    goto :goto_f

    .line 193
    .restart local v2       #down:Z
    :sswitch_2f
    const-wide/16 v10, -0x1

    goto :goto_2c

    .line 203
    :cond_32
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    if-eqz v10, :cond_41

    .line 204
    rem-int/lit8 v10, v7, 0xa

    const/4 v11, 0x6

    if-ne v10, v11, :cond_2a

    .line 205
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->pokeWakelock()V

    goto :goto_2a

    .line 208
    :cond_41
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHomeDownWhileScreenOn:Z

    if-eqz v10, :cond_2a

    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v10

    and-int/lit16 v10, v10, 0x80

    if-eqz v10, :cond_2a

    .line 209
    const/4 v10, 0x1

    invoke-direct {p0, v10}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setTorch(Z)V

    goto :goto_2a

    .line 213
    :cond_52
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTorchEnabled:Z

    if-eqz v10, :cond_5a

    .line 214
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setTorch(Z)V

    .line 305
    :cond_5a
    :goto_5a
    invoke-super/range {p0 .. p3}, Lcom/android/internal/policy/impl/PhoneWindowManager;->interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J

    move-result-wide v10

    goto :goto_2c

    .line 217
    :cond_5f
    const/16 v10, 0x52

    if-ne v5, v10, :cond_b4

    .line 218
    if-eqz v2, :cond_ac

    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVoiceAssistantTriggerred:Z

    if-nez v10, :cond_ac

    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v10

    and-int/lit16 v10, v10, 0x80

    if-eqz v10, :cond_ac

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isSecure()Z

    move-result v10

    if-eqz v10, :cond_81

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v10

    if-nez v10, :cond_ac

    .line 219
    :cond_81
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "enable_assist_menu_key_long_press"

    const/4 v12, 0x1

    invoke-static {v10, v11, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 222
    .local v0, assistFlag:I
    if-eqz v0, :cond_5a

    .line 223
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVoiceAssistantTriggerred:Z

    .line 225
    :try_start_93
    new-instance v4, Landroid/content/Intent;

    const-string v10, "android.intent.action.MAIN"

    invoke-direct {v4, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 226
    .local v4, intent:Landroid/content/Intent;
    const-string v10, "android.intent.action.ASSIST"

    invoke-virtual {v4, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    const/high16 v10, 0x1000

    invoke-virtual {v4, v10}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 228
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_a9
    .catch Landroid/content/ActivityNotFoundException; {:try_start_93 .. :try_end_a9} :catch_aa

    goto :goto_5a

    .line 230
    .end local v4           #intent:Landroid/content/Intent;
    :catch_aa
    move-exception v10

    goto :goto_5a

    .line 234
    .end local v0           #assistFlag:I
    :cond_ac
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVoiceAssistantTriggerred:Z

    if-eqz v10, :cond_5a

    .line 235
    const-wide/16 v10, -0x1

    goto/16 :goto_2c

    .line 238
    :cond_b4
    const/4 v10, 0x4

    if-ne v5, v10, :cond_5a

    .line 239
    if-eqz v2, :cond_185

    .line 240
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v10

    if-eqz v10, :cond_120

    .line 241
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "enable_snapshot_screenlock"

    const/4 v12, 0x0

    invoke-static {v10, v11, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    .line 245
    .local v8, snapshotFlag:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v10

    and-int/lit16 v10, v10, 0x80

    if-eqz v10, :cond_169

    if-eqz v8, :cond_169

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isSecure()Z

    move-result v10

    if-nez v10, :cond_169

    .line 247
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 249
    .local v6, packageManager:Landroid/content/pm/PackageManager;
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 250
    .restart local v4       #intent:Landroid/content/Intent;
    const/high16 v10, 0x1000

    invoke-virtual {v4, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 251
    const/high16 v10, 0x800

    invoke-virtual {v4, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 253
    const-string v10, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-virtual {v4, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    const-string v10, "captureAfterLaunch"

    const/4 v11, 0x1

    invoke-virtual {v4, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 256
    const-string v10, "android.intent.extras.CAMERA_FACING"

    const/4 v11, 0x0

    invoke-virtual {v4, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 258
    const/4 v10, 0x0

    invoke-virtual {v6, v4, v10}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_11c

    .line 259
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->keyguardDone(Z)V

    .line 260
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 263
    :cond_11c
    const-wide/16 v10, -0x1

    goto/16 :goto_2c

    .line 265
    .end local v4           #intent:Landroid/content/Intent;
    .end local v6           #packageManager:Landroid/content/pm/PackageManager;
    .end local v8           #snapshotFlag:I
    :cond_120
    if-nez v7, :cond_169

    .line 266
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPressed:Z

    .line 269
    if-eqz p1, :cond_171

    invoke-interface {p1}, Landroid/view/WindowManagerPolicy$WindowState;->getAttrs()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 270
    .local v1, attrs:Landroid/view/WindowManager$LayoutParams;
    :goto_12b
    if-eqz v1, :cond_169

    sget-object v10, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->sBackLongPressWhiteList:Ljava/util/HashSet;

    iget-object v11, v1, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_169

    iget v10, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v11, 0x1

    if-lt v10, v11, :cond_142

    iget v10, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v11, 0x63

    if-le v10, v11, :cond_14e

    :cond_142
    iget v10, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v11, 0x3e8

    if-lt v10, v11, :cond_169

    iget v10, v1, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v11, 0x7cf

    if-gt v10, v11, :cond_169

    .line 279
    :cond_14e
    :try_start_14e
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "back_key_long_press_timeout"

    invoke-static {v10, v11}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v9

    .line 282
    .local v9, timeout:I
    iget-object v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    invoke-virtual {v10, p1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;->setTarget(Landroid/view/WindowManagerPolicy$WindowState;)V
    :try_end_15f
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_14e .. :try_end_15f} :catch_173

    .line 293
    :goto_15f
    if-lez v9, :cond_169

    .line 294
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    int-to-long v12, v9

    invoke-virtual {v10, v11, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 302
    .end local v1           #attrs:Landroid/view/WindowManager$LayoutParams;
    .end local v9           #timeout:I
    :cond_169
    :goto_169
    iget-boolean v10, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPressed:Z

    if-eqz v10, :cond_5a

    const-wide/16 v10, -0x1

    goto/16 :goto_2c

    .line 269
    :cond_171
    const/4 v1, 0x0

    goto :goto_12b

    .line 283
    .restart local v1       #attrs:Landroid/view/WindowManager$LayoutParams;
    :catch_173
    move-exception v3

    .line 285
    .local v3, e:Landroid/provider/Settings$SettingNotFoundException;
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v9

    .line 286
    .restart local v9       #timeout:I
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "back_key_long_press_timeout"

    const/4 v12, 0x0

    invoke-static {v10, v11, v12}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_15f

    .line 299
    .end local v1           #attrs:Landroid/view/WindowManager$LayoutParams;
    .end local v3           #e:Landroid/provider/Settings$SettingNotFoundException;
    .end local v9           #timeout:I
    :cond_185
    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v11, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mBackLongPress:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$BackLongPressRunnable;

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_169

    .line 188
    nop

    :sswitch_data_18e
    .sparse-switch
        0x3 -> :sswitch_2f
        0x4 -> :sswitch_2f
        0x52 -> :sswitch_2f
        0x54 -> :sswitch_2f
    .end sparse-switch
.end method

.method public interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I
    .registers 17
    .parameter "event"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    .line 310
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    .line 311
    .local v4, keyCode:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v9

    if-nez v9, :cond_44

    const/4 v1, 0x1

    .line 312
    .local v1, down:Z
    :goto_b
    const/high16 v9, 0x100

    and-int/2addr v9, p2

    if-eqz v9, :cond_46

    const/4 v2, 0x1

    .line 314
    .local v2, isInjected:Z
    :goto_11
    const/16 v9, 0x1a

    if-ne v9, v4, :cond_18

    .line 315
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    .line 318
    :cond_18
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    if-eqz v9, :cond_1f

    .line 319
    sparse-switch v4, :sswitch_data_122

    .line 340
    :cond_1f
    const/16 v9, 0x52

    if-ne v4, v9, :cond_67

    .line 341
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    .line 342
    if-eqz v1, :cond_2a

    .line 343
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVoiceAssistantTriggerred:Z

    .line 351
    :cond_2a
    :goto_2a
    if-eqz p3, :cond_75

    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v5

    .line 354
    .local v5, keyguardActive:Z
    :goto_32
    if-nez p3, :cond_36

    if-eqz v2, :cond_7c

    .line 356
    :cond_36
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    if-eqz v9, :cond_a9

    if-eqz v5, :cond_a9

    const/16 v9, 0x1b

    if-ne v4, v9, :cond_a9

    if-nez v1, :cond_a9

    .line 357
    const/4 v9, 0x4

    .line 453
    .end local v5           #keyguardActive:Z
    :goto_43
    return v9

    .line 311
    .end local v1           #down:Z
    .end local v2           #isInjected:Z
    :cond_44
    const/4 v1, 0x0

    goto :goto_b

    .line 312
    .restart local v1       #down:Z
    :cond_46
    const/4 v2, 0x0

    goto :goto_11

    .line 321
    .restart local v2       #isInjected:Z
    :sswitch_48
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    .line 325
    :sswitch_4a
    const/4 v9, 0x0

    goto :goto_43

    .line 328
    :sswitch_4c
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    if-eqz v9, :cond_1f

    .line 329
    if-nez v1, :cond_65

    .line 330
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHomePressed:Z

    .line 331
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->interceptPowerKeyUp(Z)Z

    .line 332
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    new-instance v10, Landroid/content/Intent;

    const-string v11, "com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_SCREEN_BUTTONS"

    invoke-direct {v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 334
    :cond_65
    const/4 v9, 0x0

    goto :goto_43

    .line 345
    :cond_67
    const/16 v9, 0x18

    if-ne v4, v9, :cond_6e

    .line 346
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    goto :goto_2a

    .line 347
    :cond_6e
    const/16 v9, 0x19

    if-ne v4, v9, :cond_2a

    .line 348
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    goto :goto_2a

    .line 351
    :cond_75
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowing()Z

    move-result v5

    goto :goto_32

    .line 360
    .restart local v5       #keyguardActive:Z
    :cond_7c
    const/4 v3, 0x1

    .line 361
    .local v3, isWakeKey:Z
    const/4 v0, 0x0

    .line 364
    .local v0, allowToWake:Z
    sparse-switch v4, :sswitch_data_138

    .line 385
    const/4 v3, 0x0

    .line 388
    :cond_82
    :goto_82
    if-eqz v3, :cond_a9

    .line 389
    if-eqz v0, :cond_a7

    .line 390
    if-eqz v1, :cond_99

    .line 392
    const/4 v9, 0x0

    goto :goto_43

    .line 366
    :sswitch_8a
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTrackballWakeScreen:Z

    .line 367
    goto :goto_82

    .line 370
    :sswitch_8d
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    .line 371
    goto :goto_82

    .line 375
    :sswitch_90
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeKeyWakeScreen:Z

    .line 379
    iget v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenOffReason:I

    const/4 v10, 0x4

    if-ne v9, v10, :cond_82

    .line 380
    const/4 v0, 0x0

    goto :goto_82

    .line 394
    :cond_99
    if-eqz v5, :cond_a5

    .line 395
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    const/16 v10, 0x1a

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->onWakeKeyWhenKeyguardShowingTq(IZ)Z

    .line 396
    const/4 v9, 0x0

    goto :goto_43

    .line 400
    :cond_a5
    const/4 v9, 0x2

    goto :goto_43

    .line 403
    :cond_a7
    and-int/lit8 p2, p2, -0x4

    .line 407
    .end local v0           #allowToWake:Z
    .end local v3           #isWakeKey:Z
    :cond_a9
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-eqz v9, :cond_b4

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    if-eqz v9, :cond_b4

    .line 408
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setMaxBacklightBrightness()V

    .line 411
    :cond_b4
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-eqz v9, :cond_d6

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    if-eqz v9, :cond_d6

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotTrigger:Z

    if-nez v9, :cond_d6

    .line 412
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVoiceAssistantTriggerred:Z

    .line 413
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotTrigger:Z

    .line 414
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenshotChordLongPress:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 415
    iget-object v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mScreenshotChordLongPress:Ljava/lang/Runnable;

    const-wide/16 v11, 0x0

    invoke-virtual {v9, v10, v11, v12}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 418
    :cond_d6
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotTrigger:Z

    if-eqz v9, :cond_e8

    .line 419
    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    if-eqz v9, :cond_e2

    iget-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    if-nez v9, :cond_11b

    .line 420
    :cond_e2
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenshotTrigger:Z

    .line 421
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mVolumeDownKeyConsumedByScreenshotChord:Z

    .line 429
    :cond_e8
    if-eqz v1, :cond_115

    .line 431
    const/16 v9, 0x1a

    if-ne v4, v9, :cond_11e

    const/4 v7, 0x1

    .line 432
    .local v7, stopNotification:Z
    :goto_ef
    if-nez v7, :cond_10a

    .line 433
    :try_start_f1
    invoke-static {}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getWindownManagerService()Landroid/view/IWindowManager;

    move-result-object v8

    .line 434
    .local v8, wm:Landroid/view/IWindowManager;
    if-eqz v8, :cond_10a

    invoke-interface {v8}, Landroid/view/IWindowManager;->isKeyguardLocked()Z

    move-result v9

    if-eqz v9, :cond_10a

    .line 435
    const/16 v9, 0x19

    if-eq v4, v9, :cond_109

    const/16 v9, 0x18

    if-eq v4, v9, :cond_109

    const/16 v9, 0xa4

    if-ne v4, v9, :cond_10a

    .line 438
    :cond_109
    const/4 v7, 0x1

    .line 443
    .end local v8           #wm:Landroid/view/IWindowManager;
    :cond_10a
    if-eqz v7, :cond_115

    .line 444
    invoke-static {}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getStatusBarManagerService()Lcom/android/internal/statusbar/IStatusBarService;

    move-result-object v6

    .line 445
    .local v6, statusBarService:Lcom/android/internal/statusbar/IStatusBarService;
    if-eqz v6, :cond_115

    .line 446
    invoke-interface {v6}, Lcom/android/internal/statusbar/IStatusBarService;->onPanelRevealed()V
    :try_end_115
    .catch Landroid/os/RemoteException; {:try_start_f1 .. :try_end_115} :catch_120

    .line 453
    .end local v6           #statusBarService:Lcom/android/internal/statusbar/IStatusBarService;
    .end local v7           #stopNotification:Z
    :cond_115
    :goto_115
    invoke-super/range {p0 .. p3}, Lcom/android/internal/policy/impl/PhoneWindowManager;->interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I

    move-result v9

    goto/16 :goto_43

    .line 425
    :cond_11b
    const/4 v9, 0x0

    goto/16 :goto_43

    .line 431
    :cond_11e
    const/4 v7, 0x0

    goto :goto_ef

    .line 449
    .restart local v7       #stopNotification:Z
    :catch_120
    move-exception v9

    goto :goto_115

    .line 319
    :sswitch_data_122
    .sparse-switch
        0x3 -> :sswitch_48
        0x4 -> :sswitch_4a
        0x1a -> :sswitch_4c
        0x52 -> :sswitch_4a
        0x54 -> :sswitch_4a
    .end sparse-switch

    .line 364
    :sswitch_data_138
    .sparse-switch
        0x18 -> :sswitch_90
        0x19 -> :sswitch_90
        0x1b -> :sswitch_8d
        0x110 -> :sswitch_8a
    .end sparse-switch
.end method

.method public performHapticFeedbackLw(Landroid/view/WindowManagerPolicy$WindowState;IZ)Z
    .registers 5
    .parameter "win"
    .parameter "effectId"
    .parameter "always"

    .prologue
    .line 779
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    invoke-virtual {v0, p2}, Lmiui/util/HapticFeedbackUtil;->isSupportedEffect(I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 780
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    invoke-virtual {v0, p2, p3}, Lmiui/util/HapticFeedbackUtil;->performHapticFeedback(IZ)Z

    move-result v0

    .line 783
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
    .line 150
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBar:Landroid/view/WindowManagerPolicy$WindowState;

    if-ne v0, p1, :cond_10

    .line 151
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miui.app.ExtraStatusBarManager.UNLOADED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 153
    :cond_10
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->removeWindowLw(Landroid/view/WindowManagerPolicy$WindowState;)V

    .line 154
    return-void
.end method

.method public screenTurnedOff(I)V
    .registers 3
    .parameter "why"

    .prologue
    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeUpPressed:Z

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeDownPressed:Z

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMenuPressed:Z

    .line 173
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenOffReason:I

    .line 174
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->screenTurnedOff(I)V

    .line 175
    return-void
.end method

.method public screenTurningOn(Landroid/view/WindowManagerPolicy$ScreenOnListener;)V
    .registers 4
    .parameter "screenOnListener"

    .prologue
    .line 158
    invoke-super {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->screenTurningOn(Landroid/view/WindowManagerPolicy$ScreenOnListener;)V

    .line 159
    if-nez p1, :cond_f

    .line 160
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$2;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$2;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->onScreenTurnedOn(Lcom/android/internal/policy/impl/KeyguardViewManager$ShowListener;)V

    .line 165
    :cond_f
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    if-eqz v0, :cond_1c

    .line 166
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->aquire()V

    .line 168
    :cond_1c
    return-void
.end method

.method public showBootMessage(Ljava/lang/CharSequence;Z)V
    .registers 5
    .parameter "msg"
    .parameter "always"

    .prologue
    .line 841
    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindowManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$7;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$7;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 894
    return-void
.end method
