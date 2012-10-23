.class Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;
.super Lmiui/app/screenelement/ActionCommand$NotificationReceiver;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BluetoothSwitchCommand"
.end annotation


# instance fields
.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothEnable:Z

.field private mBluetoothEnabling:Z

.field private mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V
    .registers 5
    .parameter "context"
    .parameter "value"

    .prologue
    .line 625
    const-string v0, "bluetooth_state"

    sget-object v1, Lmiui/app/screenelement/NotifierManager$NotifierType;->Bluetooth:Lmiui/app/screenelement/NotifierManager$NotifierType;

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/ActionCommand$NotificationReceiver;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;Lmiui/app/screenelement/NotifierManager$NotifierType;)V

    .line 626
    new-instance v0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    invoke-direct {v0, p2}, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    .line 627
    return-void
.end method

.method private ensureBluetoothAdapter()Z
    .registers 2

    .prologue
    .line 671
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_a

    .line 672
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 674
    :cond_a
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method


# virtual methods
.method protected doPerform()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 631
    invoke-direct {p0}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->ensureBluetoothAdapter()Z

    move-result v0

    if-nez v0, :cond_9

    .line 654
    :goto_8
    return-void

    .line 634
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v0, v0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsToggle:Z

    if-eqz v0, :cond_26

    .line 635
    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnable:Z

    if-eqz v0, :cond_1e

    .line 636
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->disable()Z

    .line 637
    iput-boolean v2, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    .line 653
    :cond_1a
    :goto_1a
    invoke-virtual {p0}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->update()V

    goto :goto_8

    .line 639
    :cond_1e
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    .line 640
    iput-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    goto :goto_1a

    .line 643
    :cond_26
    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    if-nez v0, :cond_1a

    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnable:Z

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v1, v1, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    if-eq v0, v1, :cond_1a

    .line 644
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mOnOffHelper:Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;

    iget-boolean v0, v0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    if-eqz v0, :cond_40

    .line 645
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    .line 646
    iput-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    goto :goto_1a

    .line 648
    :cond_40
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->disable()Z

    .line 649
    iput-boolean v2, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    goto :goto_1a
.end method

.method protected update()V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 658
    invoke-direct {p0}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->ensureBluetoothAdapter()Z

    move-result v1

    if-nez v1, :cond_8

    .line 668
    :goto_7
    return-void

    .line 661
    :cond_8
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    iput-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnable:Z

    .line 662
    iget-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnable:Z

    if-eqz v1, :cond_1b

    .line 663
    iput-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    .line 664
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->updateState(I)V

    goto :goto_7

    .line 666
    :cond_1b
    iget-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->mBluetoothEnabling:Z

    if-eqz v1, :cond_20

    const/4 v0, 0x2

    :cond_20
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;->updateState(I)V

    goto :goto_7
.end method
