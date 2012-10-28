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
    .line 54
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;-><init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)V

    return-void
.end method


# virtual methods
.method public handleChanges()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x3

    .line 58
    const-string v1, "MiuiScreenOnProximityLock"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handle change = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    if-eqz v0, :cond_65

    const-string v0, "too close"

    :goto_15
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 62
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 65
    :cond_31
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    if-eqz v0, :cond_6b

    .line 66
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 67
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 68
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v2

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Z

    move-result v0

    if-eqz v0, :cond_68

    invoke-static {}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300()I

    move-result v0

    int-to-long v0, v0

    :goto_5b
    invoke-virtual {v2, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 78
    :cond_5e
    :goto_5e
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    const/4 v1, 0x0

    #setter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$102(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Z)Z

    .line 79
    return-void

    .line 58
    :cond_65
    const-string v0, "far away"

    goto :goto_15

    .line 68
    :cond_68
    const-wide/16 v0, 0x0

    goto :goto_5b

    .line 71
    :cond_6b
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_5e

    .line 72
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 73
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 74
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$200(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/Handler;

    move-result-object v2

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mIsFirstChange:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$100(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Z

    move-result v0

    if-eqz v0, :cond_a1

    invoke-static {}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300()I

    move-result v0

    int-to-long v0, v0

    :goto_9d
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_5e

    :cond_a1
    const-wide/16 v0, 0x12c

    goto :goto_9d
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 93
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 8
    .parameter "event"

    .prologue
    const/4 v1, 0x0

    .line 83
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v2, v1

    .line 86
    .local v0, distance:F
    float-to-double v2, v0

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_21

    const/high16 v2, 0x4080

    cmpg-float v2, v0, v2

    if-gez v2, :cond_21

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mSensor:Landroid/hardware/Sensor;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$400(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/hardware/Sensor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_21

    const/4 v1, 0x1

    :cond_21
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->mIsTooClose:Z

    .line 88
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$MySensorEventListener;->handleChanges()V

    .line 89
    return-void
.end method
