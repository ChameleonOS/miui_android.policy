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
.field private static final DEBUG:Z = false

.field private static final EVENT_FAR_AWAY:I = 0x2

.field private static final EVENT_RELEASE:I = 0x3

.field private static final EVENT_TOO_CLOSE:I = 0x1

.field private static final FAR_AWAR_DELAY:I = 0x12c

.field private static final FIRST_CHANGE_TIMEOUT:I = 0x3e8

.field private static final LOG_TAG:Ljava/lang/String; = "MiuiDelayedProximitySensorLock"

.field private static final PROXIMITY_THRESHOLD:F = 2.0f

.field private static final RELEASE_DELAY:I = 0x12c


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/Dialog;

.field private mHandler:Landroid/os/Handler;

.field private mHeld:Z

.field private mSensor:Landroid/hardware/Sensor;

.field private mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .parameter "context"

    .prologue
    .line 99
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    .line 100
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    .line 101
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    .line 102
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    .line 103
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->prepareHintDialog()V

    .line 105
    new-instance v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    .line 126
    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/hardware/Sensor;
    .registers 2
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method private prepareHintDialog()V
    .registers 7

    .prologue
    const/4 v5, -0x1

    .line 80
    new-instance v1, Landroid/app/Dialog;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const v3, 0x103006b

    invoke-direct {v1, v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    .line 82
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 83
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x7e0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 84
    const/16 v1, 0x1100

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 86
    const/4 v1, -0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 87
    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 89
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 90
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v3, -0x3400

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/Window;->requestFeature(I)Z

    .line 93
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 94
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

    .line 97
    return-void
.end method


# virtual methods
.method public declared-synchronized aquire()V
    .registers 5

    .prologue
    .line 134
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-nez v0, :cond_1c

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 137
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 138
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_22

    .line 143
    :goto_1a
    monitor-exit p0

    return-void

    .line 141
    :cond_1c
    :try_start_1c
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->handleChanges()V
    :try_end_21
    .catchall {:try_start_1c .. :try_end_21} :catchall_22

    goto :goto_1a

    .line 134
    :catchall_22
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isHeld()Z
    .registers 2

    .prologue
    .line 129
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
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 147
    monitor-enter p0

    :try_start_3
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-eqz v2, :cond_25

    .line 149
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 150
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 151
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 152
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 153
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_27

    .line 156
    :goto_23
    monitor-exit p0

    return v0

    :cond_25
    move v0, v1

    goto :goto_23

    .line 147
    :catchall_27
    move-exception v0

    monitor-exit p0

    throw v0
.end method
