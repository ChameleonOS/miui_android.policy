.class Lcom/android/internal/policy/impl/MagnifierPopupWindow$1;
.super Ljava/lang/Object;
.source "MagnifierPopupWindow.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MagnifierPopupWindow;-><init>(Landroid/content/Context;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$1;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3
    .parameter "animation"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$1;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->dismiss()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    return-void
.end method
