.class Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;
.super Landroid/content/BroadcastReceiver;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)V
    .registers 2
    .parameter

    .prologue
    .line 656
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 658
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mProximitySensor:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$600(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->release()V

    .line 659
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v1, "miui.intent.extra.DISABLE_PROXIMITY_SENSOR"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDisableProximitor:Z
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$702(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z

    .line 660
    return-void
.end method
