.class final Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;
.super Landroid/view/InputEventReceiver;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MagnifierInputEventReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V
    .registers 4
    .parameter
    .parameter "inputChannel"
    .parameter "looper"

    .prologue
    .line 576
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    .line 577
    invoke-direct {p0, p2, p3}, Landroid/view/InputEventReceiver;-><init>(Landroid/view/InputChannel;Landroid/os/Looper;)V

    .line 578
    return-void
.end method


# virtual methods
.method public onInputEvent(Landroid/view/InputEvent;)V
    .registers 8
    .parameter "inputEvent"

    .prologue
    const/4 v3, 0x0

    .line 582
    instance-of v2, p1, Landroid/view/MotionEvent;

    if-nez v2, :cond_9

    .line 583
    invoke-virtual {p0, p1, v3}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    .line 614
    :goto_8
    return-void

    :cond_9
    move-object v1, p1

    .line 586
    check-cast v1, Landroid/view/MotionEvent;

    .line 587
    .local v1, motionEvent:Landroid/view/MotionEvent;
    const/4 v0, 0x0

    .line 588
    .local v0, handled:Z
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    float-to-int v3, v3

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownX:I
    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$202(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;I)I

    .line 589
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v3, v3

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownY:I
    invoke-static {v2, v3}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$302(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;I)I

    .line 591
    :try_start_21
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getSource()I
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_66

    move-result v2

    and-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_2d

    .line 612
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    goto :goto_8

    .line 593
    :cond_2d
    const/4 v0, 0x1

    .line 594
    :try_start_2e
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v3, v2, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_33
    .catchall {:try_start_2e .. :try_end_33} :catchall_66

    .line 595
    :try_start_33
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    packed-switch v2, :pswitch_data_82

    .line 610
    :cond_3a
    :goto_3a
    monitor-exit v3
    :try_end_3b
    .catchall {:try_start_33 .. :try_end_3b} :catchall_63

    .line 612
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    goto :goto_8

    .line 598
    :pswitch_3f
    :try_start_3f
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v4, 0x1

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsTouchDown:Z
    invoke-static {v2, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$402(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z

    .line 599
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifier:Z
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$500(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 600
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    move-result-object v2

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownX:I
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$200(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I

    move-result v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mDownY:I
    invoke-static {v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$300(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->showMagnifier(II)V

    goto :goto_3a

    .line 610
    :catchall_63
    move-exception v2

    monitor-exit v3
    :try_end_65
    .catchall {:try_start_3f .. :try_end_65} :catchall_63

    :try_start_65
    throw v2
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_66

    .line 612
    :catchall_66
    move-exception v2

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    throw v2

    .line 605
    :pswitch_6b
    :try_start_6b
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->getMagnifier()Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->hide()V

    .line 606
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v4, 0x0

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsTouchDown:Z
    invoke-static {v2, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$402(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z

    .line 607
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MagnifierInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v4, 0x0

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mShowMagnifier:Z
    invoke-static {v2, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$502(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)Z
    :try_end_80
    .catchall {:try_start_6b .. :try_end_80} :catchall_63

    goto :goto_3a

    .line 595
    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_6b
        :pswitch_3f
        :pswitch_6b
    .end packed-switch
.end method
