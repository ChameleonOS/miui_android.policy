.class public Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;
.super Ljava/lang/Object;
.source "MiuiScreenOnProximityLock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final EVENT_FAR_AWAY:I = 0x2

.field private static final EVENT_NO_USER_ACTIVITY:I = 0x4

.field private static final EVENT_RELEASE:I = 0x3

.field private static final EVENT_TOO_CLOSE:I = 0x1

.field private static final FIRST_CHANGE_TIMEOUT:I = 0x3e8

.field private static final LOG_TAG:Ljava/lang/String; = "MiuiScreenOnProximityLock"

.field private static final PROXIMITY_THRESHOLD:F = 2.0f

.field private static final RELEASE_DELAY:I = 0x12c

.field private static sValidChangeDelay:I


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/Dialog;

.field private mDownRecieved:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mHeld:Z

.field private mIsFirstChange:Z

.field private mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

.field private mSensor:Landroid/hardware/Sensor;

.field private mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardViewMediator;)V
    .registers 5
    .parameter "context"
    .parameter "keyguardMediator"

    .prologue
    .line 116
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDownRecieved:Landroid/util/SparseArray;

    .line 53
    new-instance v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    .line 117
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    .line 118
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x608000c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    sput v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->sValidChangeDelay:I

    .line 120
    iput-object p2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    .line 121
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    .line 122
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    .line 124
    new-instance v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    .line 157
    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z

    return v0
.end method

.method static synthetic access$102(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300()I
    .registers 1

    .prologue
    .line 26
    sget v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->sValidChangeDelay:I

    return v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/hardware/Sensor;
    .registers 2
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/app/Dialog;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 26
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->prepareHintDialog()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Lcom/android/internal/policy/impl/KeyguardViewMediator;
    .registers 2
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;

    return-object v0
.end method

.method private prepareHintDialog()V
    .registers 7

    .prologue
    const/4 v5, -0x1

    .line 97
    new-instance v1, Landroid/app/Dialog;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const v3, 0x103006b

    invoke-direct {v1, v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    .line 99
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 100
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x7e0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 101
    const/16 v1, 0x1100

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 103
    const/4 v1, -0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 104
    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 106
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 107
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v3, -0x3400

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 108
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/Window;->requestFeature(I)Z

    .line 110
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 111
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x6030042

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    return-void
.end method


# virtual methods
.method public declared-synchronized aquire()V
    .registers 5

    .prologue
    .line 164
    monitor-enter p0

    :try_start_1
    const-string v0, "MiuiScreenOnProximityLock"

    const-string v1, "try to aquire"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-nez v0, :cond_2d

    .line 166
    const-string v0, "MiuiScreenOnProximityLock"

    const-string v1, "aquire"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 168
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z

    .line 169
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 170
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_2b
    .catchall {:try_start_1 .. :try_end_2b} :catchall_33

    .line 175
    :goto_2b
    monitor-exit p0

    return-void

    .line 173
    :cond_2d
    :try_start_2d
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->handleChanges()V
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_33

    goto :goto_2b

    .line 164
    :catchall_33
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isHeld()Z
    .registers 2

    .prologue
    .line 160
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized release()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 178
    monitor-enter p0

    :try_start_3
    const-string v2, "MiuiScreenOnProximityLock"

    const-string v3, "try to release"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-eqz v2, :cond_3e

    .line 180
    const-string v1, "MiuiScreenOnProximityLock"

    const-string v2, "release"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 182
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDownRecieved:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 183
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 184
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 185
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 186
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 187
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_3c
    .catchall {:try_start_3 .. :try_end_3c} :catchall_40

    .line 190
    :goto_3c
    monitor-exit p0

    return v0

    :cond_3e
    move v0, v1

    goto :goto_3c

    .line 178
    :catchall_40
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public shouldBeBlocked(Landroid/view/KeyEvent;)Z
    .registers 8
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 194
    if-eqz p1, :cond_8

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-nez v4, :cond_a

    :cond_8
    move v2, v3

    .line 214
    :cond_9
    :goto_9
    return v2

    .line 196
    :cond_a
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_48

    .line 210
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .line 211
    .local v1, keyCode:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v4

    if-nez v4, :cond_2a

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_2a

    .line 212
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDownRecieved:Landroid/util/SparseArray;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 214
    :cond_2a
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDownRecieved:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_9

    move v2, v3

    goto :goto_9

    .line 199
    .end local v1           #keyCode:I
    :sswitch_34
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const-string v5, "audio"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 200
    .local v0, audioManager:Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v4

    if-eqz v4, :cond_9

    move v2, v3

    goto :goto_9

    .end local v0           #audioManager:Landroid/media/AudioManager;
    :sswitch_46
    move v2, v3

    .line 207
    goto :goto_9

    .line 196
    :sswitch_data_48
    .sparse-switch
        0x18 -> :sswitch_34
        0x19 -> :sswitch_34
        0x55 -> :sswitch_46
        0x56 -> :sswitch_46
        0x57 -> :sswitch_46
        0x7e -> :sswitch_46
        0x7f -> :sswitch_46
    .end sparse-switch
.end method
