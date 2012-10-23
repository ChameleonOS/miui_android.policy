.class Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;
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
    .line 646
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 648
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v1, 0x1

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifier:Z
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$502(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z

    .line 649
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsTouchDown:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$400(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 650
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->updateCache()V

    .line 651
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownX:I
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$200(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I

    move-result v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$5;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownY:I
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$300(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->showMagnifier(II)V

    .line 653
    :cond_2c
    return-void
.end method
