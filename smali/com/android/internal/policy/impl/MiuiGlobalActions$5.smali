.class Lcom/android/internal/policy/impl/MiuiGlobalActions$5;
.super Landroid/content/BroadcastReceiver;
.source "MiuiGlobalActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiGlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiGlobalActions;)V
    .registers 2
    .parameter

    .prologue
    .line 657
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$5;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v3, 0x0

    .line 659
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 660
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 662
    :cond_15
    const-string v2, "reason"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 663
    .local v1, reason:Ljava/lang/String;
    const-string v2, "globalactions"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2c

    .line 664
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$5;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$1000(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 675
    .end local v1           #reason:Ljava/lang/String;
    :cond_2c
    :goto_2c
    return-void

    .line 666
    :cond_2d
    const-string v2, "android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 669
    const-string v2, "PHONE_IN_ECM_STATE"

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2c

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$5;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mIsWaitingForEcmExit:Z
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$000(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 671
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$5;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #setter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mIsWaitingForEcmExit:Z
    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$002(Lcom/android/internal/policy/impl/MiuiGlobalActions;Z)Z

    .line 672
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$5;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    const/4 v3, 0x1

    #calls: Lcom/android/internal/policy/impl/MiuiGlobalActions;->changeAirplaneModeSystemSetting(Z)V
    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$200(Lcom/android/internal/policy/impl/MiuiGlobalActions;Z)V

    goto :goto_2c
.end method
