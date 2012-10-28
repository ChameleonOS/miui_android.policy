.class Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;
.super Ljava/lang/Object;
.source "LockPatternKeyguardView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/LockPatternKeyguardView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/LockPatternKeyguardView;)V
    .registers 2
    .parameter

    .prologue
    .line 267
    iput-object p1, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 269
    iget-object v2, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/LockPatternKeyguardView;->mMode:Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;
    invoke-static {v2}, Lcom/android/internal/policy/impl/LockPatternKeyguardView;->access$000(Lcom/android/internal/policy/impl/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;

    move-result-object v1

    .line 273
    .local v1, mode:Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;
    const/4 v0, 0x0

    .line 274
    .local v0, dismissAfterCreation:Z
    sget-object v2, Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;->UnlockScreen:Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;

    if-ne v1, v2, :cond_18

    iget-object v2, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    #calls: Lcom/android/internal/policy/impl/LockPatternKeyguardView;->getUnlockMode()Lcom/android/internal/policy/impl/LockPatternKeyguardView$UnlockMode;
    invoke-static {v2}, Lcom/android/internal/policy/impl/LockPatternKeyguardView;->access$100(Lcom/android/internal/policy/impl/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/LockPatternKeyguardView$UnlockMode;

    move-result-object v2

    sget-object v3, Lcom/android/internal/policy/impl/LockPatternKeyguardView$UnlockMode;->Unknown:Lcom/android/internal/policy/impl/LockPatternKeyguardView$UnlockMode;

    if-ne v2, v3, :cond_18

    .line 276
    sget-object v1, Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;->LockScreen:Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;

    .line 277
    const/4 v0, 0x1

    .line 279
    :cond_18
    iget-object v2, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    const/4 v3, 0x1

    #calls: Lcom/android/internal/policy/impl/LockPatternKeyguardView;->updateScreen(Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;Z)V
    invoke-static {v2, v1, v3}, Lcom/android/internal/policy/impl/LockPatternKeyguardView;->access$200(Lcom/android/internal/policy/impl/LockPatternKeyguardView;Lcom/android/internal/policy/impl/LockPatternKeyguardView$Mode;Z)V

    .line 280
    iget-object v2, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    #calls: Lcom/android/internal/policy/impl/LockPatternKeyguardView;->restoreWidgetState()V
    invoke-static {v2}, Lcom/android/internal/policy/impl/LockPatternKeyguardView;->access$300(Lcom/android/internal/policy/impl/LockPatternKeyguardView;)V

    .line 281
    if-eqz v0, :cond_2d

    .line 282
    iget-object v2, p0, Lcom/android/internal/policy/impl/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/LockPatternKeyguardView;

    iget-object v2, v2, Lcom/android/internal/policy/impl/LockPatternKeyguardView;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->keyguardDone(Z)V

    .line 284
    :cond_2d
    return-void
.end method
