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

.field private static final EVENT_TOO_CLOSE:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "MiuiDelayedProximitySensorLock"

.field private static final PROXIMITY_THRESHOLD:F = 5.0f

.field private static final RELEASE_FAR_AWAR_DELAY:I = 0x3e8


# instance fields
.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHeld:Z

.field private mPowerManager:Landroid/os/IPowerManager;

.field private mSensor:Landroid/hardware/Sensor;

.field private mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 70
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v1, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    .line 71
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    .line 72
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/SensorManager;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    .line 73
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    .line 75
    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 76
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mPowerManager:Landroid/os/IPowerManager;

    .line 78
    new-instance v1, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    .line 100
    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/hardware/Sensor;
    .registers 2
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/IPowerManager;
    .registers 2
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mPowerManager:Landroid/os/IPowerManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized aquire()V
    .registers 5

    .prologue
    .line 108
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-nez v0, :cond_19

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 111
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    .line 112
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_1f

    .line 117
    :goto_17
    monitor-exit p0

    return-void

    .line 115
    :cond_19
    :try_start_19
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->handleChanges()V
    :try_end_1e
    .catchall {:try_start_19 .. :try_end_1e} :catchall_1f

    goto :goto_17

    .line 108
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isHeld()Z
    .registers 2

    .prologue
    .line 103
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

.method public declared-synchronized release()V
    .registers 3

    .prologue
    .line 120
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 121
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 123
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    if-eqz v0, :cond_1b

    .line 125
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHeld:Z

    .line 126
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensorEventListener:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1d

    .line 128
    :cond_1b
    monitor-exit p0

    return-void

    .line 120
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method
