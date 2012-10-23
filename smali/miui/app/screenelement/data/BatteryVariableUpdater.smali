.class public Lmiui/app/screenelement/data/BatteryVariableUpdater;
.super Lmiui/app/screenelement/data/NotifierVariableUpdater;
.source "BatteryVariableUpdater.java"


# instance fields
.field private mBatteryLevel:Lmiui/app/screenelement/util/IndexedNumberVariable;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/VariableUpdaterManager;)V
    .registers 5
    .parameter "m"

    .prologue
    .line 13
    sget-object v0, Lmiui/app/screenelement/NotifierManager$NotifierType;->Battery:Lmiui/app/screenelement/NotifierManager$NotifierType;

    invoke-direct {p0, p1, v0}, Lmiui/app/screenelement/data/NotifierVariableUpdater;-><init>(Lmiui/app/screenelement/data/VariableUpdaterManager;Lmiui/app/screenelement/NotifierManager$NotifierType;)V

    .line 14
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "battery_level"

    invoke-virtual {p0}, Lmiui/app/screenelement/data/BatteryVariableUpdater;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/BatteryVariableUpdater;->mBatteryLevel:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 15
    return-void
.end method


# virtual methods
.method public onNotify(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Object;)V
    .registers 8
    .parameter "context"
    .parameter "intent"
    .parameter "o"

    .prologue
    const/4 v3, -0x1

    .line 19
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 20
    const-string v1, "level"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 21
    .local v0, level:I
    if-eq v0, v3, :cond_27

    .line 22
    iget-object v3, p0, Lmiui/app/screenelement/data/BatteryVariableUpdater;->mBatteryLevel:Lmiui/app/screenelement/util/IndexedNumberVariable;

    const/16 v1, 0x64

    if-lt v0, v1, :cond_28

    const-wide/high16 v1, 0x4059

    :goto_1d
    invoke-virtual {v3, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 23
    invoke-virtual {p0}, Lmiui/app/screenelement/data/BatteryVariableUpdater;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v1

    invoke-virtual {v1}, Lmiui/app/screenelement/ScreenContext;->requestUpdate()V

    .line 26
    .end local v0           #level:I
    :cond_27
    return-void

    .line 22
    .restart local v0       #level:I
    :cond_28
    int-to-double v1, v0

    goto :goto_1d
.end method
