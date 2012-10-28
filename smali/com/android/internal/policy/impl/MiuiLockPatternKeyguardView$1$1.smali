.class Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;
.super Ljava/lang/Object;
.source "MiuiLockPatternKeyguardView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;

.field final synthetic val$enabled:Z


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;Z)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 156
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;->this$1:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;

    iput-boolean p2, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;->val$enabled:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;->this$1:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;

    iget-object v0, v0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    iget-boolean v1, p0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView$1$1;->val$enabled:Z

    #calls: Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;->updateTorchCover(Z)V
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;->access$100(Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;Z)V

    .line 160
    return-void
.end method
