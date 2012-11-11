.class public abstract Lmiui/app/screenelement/ActionCommand;
.super Ljava/lang/Object;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/ActionCommand$1;,
        Lmiui/app/screenelement/ActionCommand$AnimationProperty;,
        Lmiui/app/screenelement/ActionCommand$VisibilityProperty;,
        Lmiui/app/screenelement/ActionCommand$PropertyCommand;,
        Lmiui/app/screenelement/ActionCommand$DelayCommand;,
        Lmiui/app/screenelement/ActionCommand$ConditionCommand;,
        Lmiui/app/screenelement/ActionCommand$IntentCommand;,
        Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;,
        Lmiui/app/screenelement/ActionCommand$VariableAssignmentCommand;,
        Lmiui/app/screenelement/ActionCommand$UsbStorageSwitchCommand;,
        Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;,
        Lmiui/app/screenelement/ActionCommand$DataSwitchCommand;,
        Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;,
        Lmiui/app/screenelement/ActionCommand$WifiStateTracker;,
        Lmiui/app/screenelement/ActionCommand$StateTracker;,
        Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;,
        Lmiui/app/screenelement/ActionCommand$RingModeCommand;,
        Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;,
        Lmiui/app/screenelement/ActionCommand$NotificationReceiver;,
        Lmiui/app/screenelement/ActionCommand$StatefulActionCommand;
    }
.end annotation


# static fields
.field private static final COMMAND_BLUETOOTH:Ljava/lang/String; = "Bluetooth"

.field private static final COMMAND_DATA:Ljava/lang/String; = "Data"

.field private static final COMMAND_RING_MODE:Ljava/lang/String; = "RingMode"

.field private static final COMMAND_USB_STORAGE:Ljava/lang/String; = "UsbStorage"

.field private static final COMMAND_WIFI:Ljava/lang/String; = "Wifi"

.field private static final LOG_TAG:Ljava/lang/String; = "ActionCommand"

.field private static final STATE_DISABLED:I = 0x0

.field private static final STATE_ENABLED:I = 0x1

.field private static final STATE_INTERMEDIATE:I = 0x5

.field private static final STATE_TURNING_OFF:I = 0x3

.field private static final STATE_TURNING_ON:I = 0x2

.field private static final STATE_UNKNOWN:I = 0x4

.field public static final TAG_NAME:Ljava/lang/String; = "Command"

.field private static final mHandler:Landroid/os/Handler;


# instance fields
.field protected mContext:Lmiui/app/screenelement/ScreenContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lmiui/app/screenelement/ActionCommand;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;)V
    .registers 2
    .parameter "context"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
    .registers 1

    .prologue
    sget-object v0, Lmiui/app/screenelement/ActionCommand;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method protected static create(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/ActionCommand;
    .registers 8
    .parameter "context"
    .parameter "root"
    .parameter "target"
    .parameter "value"

    .prologue
    const/4 v2, 0x0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_e

    :cond_d
    :goto_d
    return-object v2

    :cond_e
    new-instance v1, Lmiui/app/screenelement/util/Variable;

    invoke-direct {v1, p2}, Lmiui/app/screenelement/util/Variable;-><init>(Ljava/lang/String;)V

    .local v1, targetObj:Lmiui/app/screenelement/util/Variable;
    invoke-virtual {v1}, Lmiui/app/screenelement/util/Variable;->getObjName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1e

    invoke-static {p0, p1, p2, p3}, Lmiui/app/screenelement/ActionCommand$PropertyCommand;->create(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/ActionCommand$PropertyCommand;

    move-result-object v2

    goto :goto_d

    :cond_1e
    invoke-virtual {v1}, Lmiui/app/screenelement/util/Variable;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    .local v0, property:Ljava/lang/String;
    const-string v3, "RingMode"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    new-instance v2, Lmiui/app/screenelement/ActionCommand$RingModeCommand;

    invoke-direct {v2, p0, p3}, Lmiui/app/screenelement/ActionCommand$RingModeCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V

    goto :goto_d

    :cond_30
    const-string v3, "Wifi"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    new-instance v2, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;

    invoke-direct {v2, p0, p3}, Lmiui/app/screenelement/ActionCommand$WifiSwitchCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V

    goto :goto_d

    :cond_3e
    const-string v3, "Data"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    new-instance v2, Lmiui/app/screenelement/ActionCommand$DataSwitchCommand;

    invoke-direct {v2, p0, p3}, Lmiui/app/screenelement/ActionCommand$DataSwitchCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V

    goto :goto_d

    :cond_4c
    const-string v3, "Bluetooth"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    new-instance v2, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;

    invoke-direct {v2, p0, p3}, Lmiui/app/screenelement/ActionCommand$BluetoothSwitchCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V

    goto :goto_d

    :cond_5a
    const-string v3, "UsbStorage"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    new-instance v2, Lmiui/app/screenelement/ActionCommand$UsbStorageSwitchCommand;

    invoke-direct {v2, p0, p3}, Lmiui/app/screenelement/ActionCommand$UsbStorageSwitchCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Ljava/lang/String;)V

    goto :goto_d
.end method

.method public static create(Lmiui/app/screenelement/ScreenContext;Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)Lmiui/app/screenelement/ActionCommand;
    .registers 14
    .parameter "context"
    .parameter "ele"
    .parameter "root"

    .prologue
    const-wide/16 v9, 0x0

    if-nez p1, :cond_6

    const/4 v3, 0x0

    :goto_5
    return-object v3

    :cond_6
    const-string v8, "condition"

    invoke-interface {p1, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    .local v0, condition:Lmiui/app/screenelement/data/Expression;
    const-string v8, "delay"

    invoke-static {p1, v8, v9, v10}, Lmiui/app/screenelement/util/Utils;->getAttrAsLong(Lorg/w3c/dom/Element;Ljava/lang/String;J)J

    move-result-wide v1

    .local v1, delay:J
    const/4 v3, 0x0

    .local v3, ret:Lmiui/app/screenelement/ActionCommand;
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v5

    .local v5, tag:Ljava/lang/String;
    const-string v8, "Command"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4a

    const-string v8, "target"

    invoke-interface {p1, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, target:Ljava/lang/String;
    const-string v8, "value"

    invoke-interface {p1, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .local v7, value:Ljava/lang/String;
    invoke-static {p0, p2, v6, v7}, Lmiui/app/screenelement/ActionCommand;->create(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/ActionCommand;

    move-result-object v3

    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .end local v6           #target:Ljava/lang/String;
    .end local v7           #value:Ljava/lang/String;
    .local v4, ret:Lmiui/app/screenelement/ActionCommand;
    :goto_34
    cmp-long v8, v1, v9

    if-lez v8, :cond_40

    if-eqz v4, :cond_40

    new-instance v3, Lmiui/app/screenelement/ActionCommand$DelayCommand;

    invoke-direct {v3, v4, v1, v2}, Lmiui/app/screenelement/ActionCommand$DelayCommand;-><init>(Lmiui/app/screenelement/ActionCommand;J)V

    .end local v4           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v4       #ret:Lmiui/app/screenelement/ActionCommand;
    :cond_40
    if-eqz v0, :cond_77

    if-eqz v4, :cond_77

    new-instance v3, Lmiui/app/screenelement/ActionCommand$ConditionCommand;

    invoke-direct {v3, v4, v0}, Lmiui/app/screenelement/ActionCommand$ConditionCommand;-><init>(Lmiui/app/screenelement/ActionCommand;Lmiui/app/screenelement/data/Expression;)V

    .end local v4           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_5

    :cond_4a
    const-string v8, "VariableCommand"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_59

    new-instance v3, Lmiui/app/screenelement/ActionCommand$VariableAssignmentCommand;

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    invoke-direct {v3, p0, p1}, Lmiui/app/screenelement/ActionCommand$VariableAssignmentCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Lorg/w3c/dom/Element;)V

    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v4       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_34

    .end local v4           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    :cond_59
    const-string v8, "BinderCommand"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_68

    new-instance v3, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    invoke-direct {v3, p0, p2, p1}, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Lorg/w3c/dom/Element;)V

    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v4       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_34

    .end local v4           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    :cond_68
    const-string v8, "IntentCommand"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_79

    new-instance v3, Lmiui/app/screenelement/ActionCommand$IntentCommand;

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    invoke-direct {v3, p0, p2, p1}, Lmiui/app/screenelement/ActionCommand$IntentCommand;-><init>(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Lorg/w3c/dom/Element;)V

    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v4       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_34

    :cond_77
    move-object v3, v4

    .end local v4           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v3       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_5

    :cond_79
    move-object v4, v3

    .end local v3           #ret:Lmiui/app/screenelement/ActionCommand;
    .restart local v4       #ret:Lmiui/app/screenelement/ActionCommand;
    goto :goto_34
.end method


# virtual methods
.method protected abstract doPerform()V
.end method

.method public finish()V
    .registers 1

    .prologue
    return-void
.end method

.method protected getContext()Lmiui/app/screenelement/ScreenContext;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-object v0
.end method

.method public init()V
    .registers 1

    .prologue
    return-void
.end method

.method public pause()V
    .registers 1

    .prologue
    return-void
.end method

.method public perform()V
    .registers 2

    .prologue
    invoke-virtual {p0}, Lmiui/app/screenelement/ActionCommand;->doPerform()V

    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->requestUpdate()V

    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    return-void
.end method
