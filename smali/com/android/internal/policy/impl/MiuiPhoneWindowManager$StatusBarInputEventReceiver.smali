.class final Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;
.super Landroid/view/InputEventReceiver;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "StatusBarInputEventReceiver"
.end annotation


# instance fields
.field private mDownX:F

.field private mDownY:F

.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/view/InputChannel;Landroid/os/Looper;)V
    .registers 4
    .parameter
    .parameter "inputChannel"
    .parameter "looper"

    .prologue
    .line 529
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    .line 530
    invoke-direct {p0, p2, p3}, Landroid/view/InputEventReceiver;-><init>(Landroid/view/InputChannel;Landroid/os/Looper;)V

    .line 531
    return-void
.end method


# virtual methods
.method public onInputEvent(Landroid/view/InputEvent;)V
    .registers 12
    .parameter "inputEvent"

    .prologue
    .line 535
    instance-of v5, p1, Landroid/view/MotionEvent;

    if-nez v5, :cond_9

    .line 536
    const/4 v5, 0x0

    invoke-virtual {p0, p1, v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    .line 576
    :goto_8
    return-void

    :cond_9
    move-object v3, p1

    .line 540
    check-cast v3, Landroid/view/MotionEvent;

    .line 541
    .local v3, motionEvent:Landroid/view/MotionEvent;
    const/4 v2, 0x0

    .line 543
    .local v2, handled:Z
    :try_start_d
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getSource()I

    move-result v5

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_23

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v5, v5, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarService:Lcom/android/internal/statusbar/IStatusBarService;

    if-eqz v5, :cond_23

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mIsStatusBarVisibleInFullscreen:Z
    invoke-static {v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$100(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Z
    :try_end_20
    .catchall {:try_start_d .. :try_end_20} :catchall_49

    move-result v5

    if-eqz v5, :cond_27

    .line 574
    :cond_23
    invoke-virtual {p0, p1, v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    goto :goto_8

    .line 546
    :cond_27
    const/4 v2, 0x1

    .line 547
    :try_start_28
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v6, v5, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_49

    .line 548
    :try_start_2d
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v5

    packed-switch v5, :pswitch_data_a0

    .line 572
    :cond_34
    :goto_34
    monitor-exit v6
    :try_end_35
    .catchall {:try_start_2d .. :try_end_35} :catchall_46

    .line 574
    invoke-virtual {p0, p1, v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    goto :goto_8

    .line 550
    :pswitch_39
    :try_start_39
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iput v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownX:F

    .line 551
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    iput v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownY:F

    goto :goto_34

    .line 572
    :catchall_46
    move-exception v5

    monitor-exit v6
    :try_end_48
    .catchall {:try_start_39 .. :try_end_48} :catchall_46

    :try_start_48
    throw v5
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_49

    .line 574
    :catchall_49
    move-exception v5

    invoke-virtual {p0, p1, v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    throw v5

    .line 558
    :pswitch_4e
    :try_start_4e
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v5, v5, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v7, 0x611

    iget-object v8, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget v8, v8, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarHeight:I

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget v9, v9, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarHeight:I

    invoke-virtual {v5, v7, v8, v9}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v4

    .line 562
    .local v4, statusBarExpandHeight:F
    iget v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownY:F

    cmpg-float v5, v4, v5

    if-ltz v5, :cond_34

    .line 564
    iget v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownX:F

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    sub-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 565
    .local v0, distanceX:F
    iget v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownY:F

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    sub-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 566
    .local v1, distanceY:F
    const/high16 v5, 0x4000

    mul-float/2addr v5, v0

    cmpl-float v5, v5, v1

    if-gtz v5, :cond_34

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget v5, v5, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarHeight:I

    mul-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpl-float v5, v5, v1

    if-gtz v5, :cond_34

    .line 568
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v7, 0x1

    #calls: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->setStatusBarInFullscreen(Z)V
    invoke-static {v5, v7}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$000(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Z)V

    .line 569
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget v5, v5, Lcom/android/internal/policy/impl/PhoneWindowManager;->mStatusBarHeight:I

    int-to-float v5, v5

    iput v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$StatusBarInputEventReceiver;->mDownY:F
    :try_end_9f
    .catchall {:try_start_4e .. :try_end_9f} :catchall_46

    goto :goto_34

    .line 548
    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_39
        :pswitch_4e
        :pswitch_4e
        :pswitch_4e
    .end packed-switch
.end method
