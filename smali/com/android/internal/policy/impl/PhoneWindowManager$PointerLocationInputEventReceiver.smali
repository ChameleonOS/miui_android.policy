.class final Lcom/android/internal/policy/impl/PhoneWindowManager$PointerLocationInputEventReceiver;
.super Landroid/view/InputEventReceiver;
.source "PhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/PhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PointerLocationInputEventReceiver"
.end annotation


# instance fields
.field private final mView:Lcom/android/internal/widget/PointerLocationView;


# direct methods
.method public constructor <init>(Landroid/view/InputChannel;Landroid/os/Looper;Lcom/android/internal/widget/PointerLocationView;)V
    .registers 4
    .parameter "inputChannel"
    .parameter "looper"
    .parameter "view"

    .prologue
    .line 419
    invoke-direct {p0, p1, p2}, Landroid/view/InputEventReceiver;-><init>(Landroid/view/InputChannel;Landroid/os/Looper;)V

    .line 420
    iput-object p3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$PointerLocationInputEventReceiver;->mView:Lcom/android/internal/widget/PointerLocationView;

    .line 421
    return-void
.end method


# virtual methods
.method public onInputEvent(Landroid/view/InputEvent;)V
    .registers 6
    .parameter "event"

    .prologue
    .line 425
    const/4 v1, 0x0

    .line 427
    .local v1, handled:Z
    :try_start_1
    instance-of v3, p1, Landroid/view/MotionEvent;

    if-eqz v3, :cond_17

    invoke-virtual {p1}, Landroid/view/InputEvent;->getSource()I

    move-result v3

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_17

    .line 429
    move-object v0, p1

    check-cast v0, Landroid/view/MotionEvent;

    move-object v2, v0

    .line 430
    .local v2, motionEvent:Landroid/view/MotionEvent;
    iget-object v3, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$PointerLocationInputEventReceiver;->mView:Lcom/android/internal/widget/PointerLocationView;

    invoke-virtual {v3, v2}, Lcom/android/internal/widget/PointerLocationView;->addPointerEvent(Landroid/view/MotionEvent;)V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_1b

    .line 431
    const/4 v1, 0x1

    .line 434
    .end local v2           #motionEvent:Landroid/view/MotionEvent;
    :cond_17
    invoke-virtual {p0, p1, v1}, Lcom/android/internal/policy/impl/PhoneWindowManager$PointerLocationInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    .line 436
    return-void

    .line 434
    :catchall_1b
    move-exception v3

    invoke-virtual {p0, p1, v1}, Lcom/android/internal/policy/impl/PhoneWindowManager$PointerLocationInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    throw v3
.end method
