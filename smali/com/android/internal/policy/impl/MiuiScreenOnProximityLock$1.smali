.class Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;
.super Landroid/os/Handler;
.source "MiuiScreenOnProximityLock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/os/Looper;)V
    .registers 3
    .parameter
    .parameter "x0"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 8
    .parameter "msg"

    .prologue
    .line 82
    :try_start_0
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_3e

    .line 98
    :goto_5
    return-void

    .line 85
    :pswitch_6
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mPowerManager:Landroid/os/IPowerManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/IPowerManager;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v4, 0x4

    invoke-interface {v1, v2, v3, v4}, Landroid/os/IPowerManager;->goToSleepWithReason(JI)V

    goto :goto_5

    .line 96
    :catch_15
    move-exception v1

    goto :goto_5

    .line 90
    :pswitch_17
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mPowerManager:Landroid/os/IPowerManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/os/IPowerManager;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-interface {v1, v2, v3, v4, v5}, Landroid/os/IPowerManager;->userActivityWithForce(JZZ)V

    .line 91
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.RELEASE_PROXIMITY_SENSOR"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 92
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "miui.intent.extra.DISABLE_PROXIMITY_SENSOR"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 93
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$400(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3c
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_3c} :catch_15

    goto :goto_5

    .line 82
    nop

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_17
    .end packed-switch
.end method
