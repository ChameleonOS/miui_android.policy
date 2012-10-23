.class Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;
.super Landroid/os/Handler;
.source "MagnifierPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;-><init>(Lcom/android/internal/policy/impl/MagnifierPopupWindow;Landroid/content/Context;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

.field final synthetic val$this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;Landroid/os/Looper;Lcom/android/internal/policy/impl/MagnifierPopupWindow;)V
    .registers 4
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 71
    iput-object p1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;->this$1:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    iput-object p3, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;->val$this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 74
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    .line 75
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;->this$1:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->takeScreenshot()V

    .line 76
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;->this$1:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    #calls: Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->refresh()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->access$000(Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;)V

    .line 78
    :cond_f
    return-void
.end method
