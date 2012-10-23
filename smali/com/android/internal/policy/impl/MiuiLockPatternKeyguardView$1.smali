.class Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;
.super Landroid/content/BroadcastReceiver;
.source "MiuiLockPatternKeyguardView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;)V
    .registers 2
    .parameter

    .prologue
    .line 165
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 168
    const-string v1, "miui.intent.extra.IS_ENABLE"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 170
    .local v0, enabled:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    new-instance v2, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;

    invoke-direct {v2, p0, v0}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;-><init>(Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;Z)V

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;->post(Ljava/lang/Runnable;)Z

    .line 176
    return-void
.end method
