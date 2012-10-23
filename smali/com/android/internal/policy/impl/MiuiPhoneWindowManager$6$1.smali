.class Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6$1;
.super Landroid/app/Dialog;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;Landroid/content/Context;I)V
    .registers 4
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 841
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6$1;->this$1:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;

    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 857
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .parameter "event"

    .prologue
    .line 845
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .parameter "event"

    .prologue
    .line 848
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 3
    .parameter "event"

    .prologue
    .line 861
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 851
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 854
    const/4 v0, 0x1

    return v0
.end method
