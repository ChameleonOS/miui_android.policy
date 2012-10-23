.class Lcom/android/internal/policy/impl/MagnifierPopupWindow$2;
.super Landroid/os/Handler;
.source "MagnifierPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MagnifierPopupWindow;
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
    .line 269
    iput-object p1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$2;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 271
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    .line 272
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$2;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #calls: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->showMagnifier()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$1100(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)V

    .line 278
    :cond_a
    :goto_a
    return-void

    .line 273
    :cond_b
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1a

    .line 274
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$2;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMagnifierView:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$300(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->hide()V

    goto :goto_a

    .line 275
    :cond_1a
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_a

    .line 276
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$2;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->dismiss()V

    goto :goto_a
.end method
