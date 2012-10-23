.class Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;
.super Lmiui/app/screenelement/ActionCommand$NotificationReceiver;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WifiSwitchCommand"
.end annotation


# instance fields
.field private mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

.field private final mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V
    .registers 5
    .parameter "context"
    .parameter "value"

    .prologue
    .line 523
    const-string v0, "wifi_state"

    sget-object v1, Lmiui/app/screenelement/NotifierManager$NotifierType;->WifiState:Lmiui/app/screenelement/NotifierManager$NotifierType;

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/ActionCommand$NotificationReceiver;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;Lmiui/app/screenelement/NotifierManager$NotifierType;)V

    .line 519
    new-instance v0, Lmiui/app/screenelement/ActionCommand$WifiStateTracker;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lmiui/app/screenelement/ActionCommand$WifiStateTracker;-><init>(Lmiui/app/screenelement/ActionCommand$1;)V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    .line 524
    invoke-virtual {p0}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->update()V

    .line 525
    new-instance v0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    invoke-direct {v0, p2}, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    .line 526
    return-void
.end method


# virtual methods
.method public doPerform()V
    .registers 5

    .prologue
    .line 535
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v1, v1, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsToggle:Z

    if-eqz v1, :cond_13

    .line 536
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/ActionCommand$StateTracker;->toggleState(Landroid/content/Context;)V

    .line 556
    :cond_f
    :goto_f
    invoke-virtual {p0}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->update()V

    .line 557
    return-void

    .line 538
    :cond_13
    const/4 v0, 0x0

    .line 539
    .local v0, change:Z
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/ActionCommand$StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v1

    packed-switch v1, :pswitch_data_42

    .line 552
    :cond_21
    :goto_21
    if-eqz v0, :cond_f

    .line 553
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v3, v3, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    invoke-virtual {v1, v2, v3}, Lmiui/app/screenelement/ActionCommand$StateTracker;->requestStateChange(Landroid/content/Context;Z)V

    goto :goto_f

    .line 541
    :pswitch_31
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v1, v1, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    if-eqz v1, :cond_21

    .line 542
    const/4 v0, 0x1

    goto :goto_21

    .line 545
    :pswitch_39
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v1, v1, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    if-nez v1, :cond_21

    .line 546
    const/4 v0, 0x1

    goto :goto_21

    .line 539
    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_31
        :pswitch_39
    .end packed-switch
.end method

.method public onNotify(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Object;)V
    .registers 5
    .parameter "context"
    .parameter "intent"
    .parameter "o"

    .prologue
    .line 529
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/ActionCommand$StateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    .line 530
    invoke-super {p0, p1, p2, p3}, Lmiui/app/screenelement/ActionCommand$NotificationReceiver;->onNotify(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Object;)V

    .line 531
    return-void
.end method

.method protected update()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 561
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/ActionCommand$StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v1

    packed-switch v1, :pswitch_data_30

    .line 572
    :goto_e
    :pswitch_e
    return-void

    .line 563
    :pswitch_f
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->updateState(I)V

    goto :goto_e

    .line 566
    :pswitch_13
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    check-cast v0, Lmiui/app/screenelement/ActionCommand$WifiStateTracker;

    iget-boolean v0, v0, Lmiui/app/screenelement/ActionCommand$WifiStateTracker;->zConnected:Z

    if-eqz v0, :cond_20

    const/4 v0, 0x1

    :goto_1c
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->updateState(I)V

    goto :goto_e

    :cond_20
    const/4 v0, 0x2

    goto :goto_1c

    .line 569
    :pswitch_22
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->mWifiState:Lmiui/app/screenelement/ActionCommand$StateTracker;

    invoke-virtual {v1}, Lmiui/app/screenelement/ActionCommand$StateTracker;->isTurningOn()Z

    move-result v1

    if-eqz v1, :cond_2b

    const/4 v0, 0x3

    :cond_2b
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;->updateState(I)V

    goto :goto_e

    .line 561
    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_f
        :pswitch_13
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_22
    .end packed-switch
.end method
