.class Lcom/android/internal/policy/impl/KeyguardViewManager$Injector;
.super Ljava/lang/Object;
.source "KeyguardViewManager.java"


# annotations
.annotation build Landroid/annotation/MiuiHook;
    value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_CLASS:Landroid/annotation/MiuiHook$MiuiHookType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/KeyguardViewManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static updateDisplayDesktopFlag(Lcom/android/internal/policy/impl/KeyguardViewManager;)V
    .registers 6
    .parameter "manager"

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/KeyguardViewManager;->getKeyguardView()Lcom/android/internal/policy/impl/KeyguardViewBase;

    move-result-object v1

    .line 64
    .local v1, keyguardView:Lcom/android/internal/policy/impl/KeyguardViewBase;
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/KeyguardViewManager;->getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 65
    .local v2, params:Landroid/view/WindowManager$LayoutParams;
    const/4 v0, 0x0

    .line 66
    .local v0, displayDesktop:Z
    instance-of v3, v1, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    if-eqz v3, :cond_13

    .line 67
    check-cast v1, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    .end local v1           #keyguardView:Lcom/android/internal/policy/impl/KeyguardViewBase;
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;->isDisplayDesktop()Z

    move-result v0

    .line 69
    :cond_13
    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/KeyguardViewManager;->getKeyguardViewProperties()Lcom/android/internal/policy/impl/KeyguardViewProperties;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/policy/impl/KeyguardViewProperties;->isSecure()Z

    move-result v3

    if-nez v3, :cond_2f

    .line 70
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v4, -0x100001

    and-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 71
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v4, 0x4000

    or-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 76
    :goto_2e
    return-void

    .line 73
    :cond_2f
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v4, 0x10

    or-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 74
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const v4, -0x40000001

    and-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    goto :goto_2e
.end method
