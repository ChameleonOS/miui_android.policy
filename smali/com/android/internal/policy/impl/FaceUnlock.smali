.class public Lcom/android/internal/policy/impl/FaceUnlock;
.super Ljava/lang/Object;
.source "FaceUnlock.java"

# interfaces
.implements Lcom/android/internal/policy/impl/BiometricSensorUnlock;
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "FULLockscreen"


# instance fields
.field private final BACKUP_LOCK_TIMEOUT:I

.field private final MSG_CANCEL:I

.field private final MSG_EXPOSE_FALLBACK:I

.field private final MSG_HIDE_FACE_UNLOCK_VIEW:I

.field private final MSG_POKE_WAKELOCK:I

.field private final MSG_REPORT_FAILED_ATTEMPT:I

.field private final MSG_SERVICE_CONNECTED:I

.field private final MSG_SERVICE_DISCONNECTED:I

.field private final MSG_SHOW_FACE_UNLOCK_VIEW:I

.field private final MSG_UNLOCK:I

.field private final SERVICE_STARTUP_VIEW_TIMEOUT:I

.field private mBoundToService:Z

.field private mConnection:Landroid/content/ServiceConnection;

.field private final mContext:Landroid/content/Context;

.field private final mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

.field private mFaceUnlockView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private volatile mIsRunning:Z

.field mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

.field private final mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mService:Lcom/android/internal/policy/IFaceLockInterface;

.field private mServiceRunning:Z

.field private final mServiceRunningLock:Ljava/lang/Object;

.field private final mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardScreenCallback;)V
    .registers 7
    .parameter "context"
    .parameter "updateMonitor"
    .parameter "lockPatternUtils"
    .parameter "keyguardScreenCallback"

    .prologue
    const/4 v1, 0x0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    iput v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_SHOW_FACE_UNLOCK_VIEW:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_HIDE_FACE_UNLOCK_VIEW:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_SERVICE_CONNECTED:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_SERVICE_DISCONNECTED:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_UNLOCK:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_CANCEL:I

    const/4 v0, 0x6

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_REPORT_FAILED_ATTEMPT:I

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_EXPOSE_FALLBACK:I

    const/16 v0, 0x8

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->MSG_POKE_WAKELOCK:I

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    const/16 v0, 0xbb8

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->SERVICE_STARTUP_VIEW_TIMEOUT:I

    const/16 v0, 0x1388

    iput v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->BACKUP_LOCK_TIMEOUT:I

    new-instance v0, Lcom/android/internal/policy/impl/FaceUnlock$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/FaceUnlock$1;-><init>(Lcom/android/internal/policy/impl/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    new-instance v0, Lcom/android/internal/policy/impl/FaceUnlock$2;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/FaceUnlock$2;-><init>(Lcom/android/internal/policy/impl/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    iput-object p1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iput-object p3, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iput-object p4, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$002(Lcom/android/internal/policy/impl/FaceUnlock;Lcom/android/internal/policy/IFaceLockInterface;)Lcom/android/internal/policy/IFaceLockInterface;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/FaceUnlock;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private removeDisplayMessages()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method private startUi(Landroid/os/IBinder;IIII)V
    .registers 15
    .parameter "windowToken"
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    iget-object v8, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v8

    :try_start_3
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    if-nez v0, :cond_45

    const-string v0, "FULLockscreen"

    const-string v1, "Starting Face Unlock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_42

    :try_start_e
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakLivelinessEnabled()Z

    move-result v6

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/policy/IFaceLockInterface;->startUi(Landroid/os/IBinder;IIIIZ)V
    :try_end_1e
    .catchall {:try_start_e .. :try_end_1e} :catchall_42
    .catch Landroid/os/RemoteException; {:try_start_e .. :try_end_1e} :catch_23

    const/4 v0, 0x1

    :try_start_1f
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    :goto_21
    monitor-exit v8

    :goto_22
    return-void

    :catch_23
    move-exception v7

    .local v7, e:Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caught exception starting Face Unlock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v8

    goto :goto_22

    .end local v7           #e:Landroid/os/RemoteException;
    :catchall_42
    move-exception v0

    monitor-exit v8
    :try_end_44
    .catchall {:try_start_1f .. :try_end_44} :catchall_42

    throw v0

    :cond_45
    :try_start_45
    const-string v0, "FULLockscreen"

    const-string v1, "startUi() attempted while running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catchall {:try_start_45 .. :try_end_4c} :catchall_42

    goto :goto_21
.end method

.method private stopUi()V
    .registers 6

    .prologue
    iget-object v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    if-eqz v1, :cond_16

    const-string v1, "FULLockscreen"

    const-string v3, "Stopping Face Unlock"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_36

    :try_start_e
    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    invoke-interface {v1}, Lcom/android/internal/policy/IFaceLockInterface;->stopUi()V
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_36
    .catch Landroid/os/RemoteException; {:try_start_e .. :try_end_13} :catch_18

    :goto_13
    const/4 v1, 0x0

    :try_start_14
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    :cond_16
    monitor-exit v2

    return-void

    :catch_18
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "FULLockscreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caught exception stopping Face Unlock: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13

    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_36
    move-exception v1

    monitor-exit v2
    :try_end_38
    .catchall {:try_start_14 .. :try_end_38} :catchall_36

    throw v1
.end method


# virtual methods
.method public cleanUp()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    if-eqz v0, :cond_11

    :try_start_4
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v0, v1}, Lcom/android/internal/policy/IFaceLockInterface;->unregisterCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_b} :catch_12

    :goto_b
    invoke-direct {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->stopUi()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    :cond_11
    return-void

    :catch_12
    move-exception v0

    goto :goto_b
.end method

.method public getQuality()I
    .registers 2

    .prologue
    const v0, 0x8000

    return v0
.end method

.method handleCancel()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_a
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->stop()Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    const/16 v1, 0x1388

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock(I)V

    return-void

    :cond_15
    const-string v0, "FULLockscreen"

    const-string v1, "mFaceUnlockView is null in handleCancel()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method

.method handleExposeFallback()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_a
    return-void

    :cond_b
    const-string v0, "FULLockscreen"

    const-string v1, "mFaceUnlockView is null in handleExposeFallback()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method

.method handleHideFaceUnlockView()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_a
    return-void

    :cond_b
    const-string v0, "FULLockscreen"

    const-string v1, "mFaceUnlockView is null in handleHideFaceUnlockView()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 4
    .parameter "msg"

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_36

    const-string v0, "FULLockscreen"

    const-string v1, "Unhandled message"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_d
    return v0

    :pswitch_e
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleShowFaceUnlockView()V

    :goto_11
    const/4 v0, 0x1

    goto :goto_d

    :pswitch_13
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleHideFaceUnlockView()V

    goto :goto_11

    :pswitch_17
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleServiceConnected()V

    goto :goto_11

    :pswitch_1b
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleServiceDisconnected()V

    goto :goto_11

    :pswitch_1f
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleUnlock()V

    goto :goto_11

    :pswitch_23
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleCancel()V

    goto :goto_11

    :pswitch_27
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleReportFailedAttempt()V

    goto :goto_11

    :pswitch_2b
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->handleExposeFallback()V

    goto :goto_11

    :pswitch_2f
    iget v0, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/FaceUnlock;->handlePokeWakelock(I)V

    goto :goto_11

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_e
        :pswitch_13
        :pswitch_17
        :pswitch_1b
        :pswitch_1f
        :pswitch_23
        :pswitch_27
        :pswitch_2b
        :pswitch_2f
    .end packed-switch
.end method

.method handlePokeWakelock(I)V
    .registers 3
    .parameter "millis"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock(I)V

    return-void
.end method

.method handleReportFailedAttempt()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->reportFailedBiometricUnlockAttempt()V

    return-void
.end method

.method handleServiceConnected()V
    .registers 9

    .prologue
    const/4 v4, 0x0

    const-string v0, "FULLockscreen"

    const-string v2, "handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_14

    const-string v0, "FULLockscreen"

    const-string v2, "Dropping startUi() in handleServiceConnected() because no longer bound"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_13
    :goto_13
    return-void

    :cond_14
    :try_start_14
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v0, v2}, Lcom/android/internal/policy/IFaceLockInterface;->registerCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_1b
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_1b} :catch_4a

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    .local v1, windowToken:Landroid/os/IBinder;
    if-eqz v1, :cond_6f

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    const/4 v0, 0x2

    new-array v7, v0, [I

    .local v7, position:[I
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->getLocationInWindow([I)V

    aget v2, v7, v4

    const/4 v0, 0x1

    aget v3, v7, v0

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/FaceUnlock;->startUi(Landroid/os/IBinder;IIII)V

    goto :goto_13

    .end local v1           #windowToken:Landroid/os/IBinder;
    .end local v7           #position:[I
    :catch_4a
    move-exception v6

    .local v6, e:Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught exception connecting to Face Unlock: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iput-boolean v4, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    iput-boolean v4, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    goto :goto_13

    .end local v6           #e:Landroid/os/RemoteException;
    .restart local v1       #windowToken:Landroid/os/IBinder;
    :cond_6f
    const-string v0, "FULLockscreen"

    const-string v2, "windowToken is null in handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13
.end method

.method handleServiceDisconnected()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const-string v0, "FULLockscreen"

    const-string v1, "handleServiceDisconnected()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_c
    iput-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mServiceRunning:Z

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_17

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    return-void

    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v0
.end method

.method handleShowFaceUnlockView()V
    .registers 3

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_a
    return-void

    :cond_b
    const-string v0, "FULLockscreen"

    const-string v1, "mFaceUnlockView is null in handleShowFaceUnlockView()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method

.method handleUnlock()V
    .registers 3

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->removeDisplayMessages()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_d
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->stop()Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->keyguardDone(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->reportSuccessfulUnlockAttempt()V

    return-void

    :cond_1c
    const-string v0, "FULLockscreen"

    const-string v1, "mFaceUnlockView is null in handleUnlock()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public hide()V
    .registers 3

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->removeDisplayMessages()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public initializeView(Landroid/view/View;)V
    .registers 4
    .parameter "biometricUnlockView"

    .prologue
    const-string v0, "FULLockscreen"

    const-string v1, "initializeView()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    return-void
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    return v0
.end method

.method public show(J)V
    .registers 5
    .parameter "timeoutMillis"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_13

    const-string v0, "FULLockscreen"

    const-string v1, "show() called off of the UI thread"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_13
    invoke-direct {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->removeDisplayMessages()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_20
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2c

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_2c
    return-void
.end method

.method public start()Z
    .registers 6

    .prologue
    const/4 v4, 0x1

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_14

    const-string v0, "FULLockscreen"

    const-string v1, "start() called off of the UI thread"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    if-eqz v0, :cond_1f

    const-string v0, "FULLockscreen"

    const-string v1, "start() called when already running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1f
    const-wide/16 v0, 0xbb8

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/FaceUnlock;->show(J)V

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_4c

    const-string v0, "FULLockscreen"

    const-string v1, "Binding to Face Unlock service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/internal/policy/IFaceLockInterface;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    iget-object v3, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v3}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v3

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z

    iput-boolean v4, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    :goto_49
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    return v4

    :cond_4c
    const-string v0, "FULLockscreen"

    const-string v1, "Attempt to bind to Face Unlock when already bound"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49
.end method

.method public stop()Z
    .registers 5

    .prologue
    const/4 v3, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-eq v1, v2, :cond_14

    const-string v1, "FULLockscreen"

    const-string v2, "stop() called off of the UI thread"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    .local v0, mWasRunning:Z
    invoke-direct {p0}, Lcom/android/internal/policy/impl/FaceUnlock;->stopUi()V

    iget-boolean v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    if-eqz v1, :cond_38

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    if-eqz v1, :cond_28

    :try_start_21
    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v1, v2}, Lcom/android/internal/policy/IFaceLockInterface;->unregisterCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_28
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_28} :catch_3b

    :cond_28
    :goto_28
    const-string v1, "FULLockscreen"

    const-string v2, "Unbinding from Face Unlock service"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mBoundToService:Z

    :cond_38
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/FaceUnlock;->mIsRunning:Z

    return v0

    :catch_3b
    move-exception v1

    goto :goto_28
.end method
