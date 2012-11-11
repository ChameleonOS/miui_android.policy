.class Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;
.super Landroid/os/Handler;
.source "MiuiScreenOnProximityLock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardViewMediator;)V
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
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 5
    .parameter "msg"

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    monitor-enter v1

    :try_start_3
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_84

    :cond_8
    :goto_8
    monitor-exit v1

    return-void

    :pswitch_a
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "MiuiScreenOnProximityLock"

    const-string v2, "too close screen, show hint..."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$500(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #calls: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->prepareHintDialog()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$600(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$500(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_2f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$700(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Lcom/android/internal/policy/impl/KeyguardViewMediator;

    move-result-object v0

    iget-object v0, v0, Lcom/android/internal/policy/impl/KeyguardViewMediator;->mRealPowerManager:Landroid/os/LocalPowerManager;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/os/LocalPowerManager;->enableUserActivity(Z)V

    goto :goto_8

    :catchall_3c
    move-exception v0

    monitor-exit v1
    :try_end_3e
    .catchall {:try_start_3 .. :try_end_3e} :catchall_3c

    throw v0

    :pswitch_3f
    :try_start_3f
    const-string v0, "MiuiScreenOnProximityLock"

    const-string v2, "far from the screen, hide hint..."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$500(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_5d

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$500(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    const/4 v2, 0x0

    #setter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0, v2}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$502(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/app/Dialog;)Landroid/app/Dialog;

    :cond_5d
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$700(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Lcom/android/internal/policy/impl/KeyguardViewMediator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/KeyguardViewMediator;->isShowingAndNotHidden()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mKeyguardMediator:Lcom/android/internal/policy/impl/KeyguardViewMediator;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$700(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Lcom/android/internal/policy/impl/KeyguardViewMediator;

    move-result-object v0

    iget-object v0, v0, Lcom/android/internal/policy/impl/KeyguardViewMediator;->mRealPowerManager:Landroid/os/LocalPowerManager;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/os/LocalPowerManager;->enableUserActivity(Z)V

    goto :goto_8

    :pswitch_76
    const-string v0, "MiuiScreenOnProximityLock"

    const-string v2, "far from the screen for a certain time, release proximity sensor..."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->release()Z
    :try_end_82
    .catchall {:try_start_3f .. :try_end_82} :catchall_3c

    goto :goto_8

    nop

    :pswitch_data_84
    .packed-switch 0x1
        :pswitch_a
        :pswitch_3f
        :pswitch_76
    .end packed-switch
.end method
