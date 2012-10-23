.class Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;
.super Ljava/lang/Object;
.source "MiuiScreenOnProximityLock.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySensorEventListener"
.end annotation


# instance fields
.field mIsTooClose:Z

.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;


# direct methods
.method private constructor <init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)V
    .registers 2
    .parameter

    .prologue
    .line 47
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)V

    return-void
.end method


# virtual methods
.method public handleChanges()V
    .registers 7

    .prologue
    const-wide/16 v4, 0x12c

    const/4 v3, 0x2

    const/4 v2, 0x3

    .line 52
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    if-eqz v0, :cond_25

    .line 53
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 54
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 55
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 62
    :cond_24
    :goto_24
    return-void

    .line 57
    :cond_25
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_24

    .line 58
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 59
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_24
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 76
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 8
    .parameter "event"

    .prologue
    const/4 v1, 0x0

    .line 66
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v2, v1

    .line 69
    .local v0, distance:F
    float-to-double v2, v0

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_21

    const/high16 v2, 0x4000

    cmpg-float v2, v0, v2

    if-gez v2, :cond_21

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/hardware/Sensor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_21

    const/4 v1, 0x1

    :cond_21
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    .line 71
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->handleChanges()V

    .line 72
    return-void
.end method
