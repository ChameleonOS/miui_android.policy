.class public Lmiui/app/screenelement/NotifierManager$BatteryNotifier;
.super Lmiui/app/screenelement/NotifierManager$BroadcastNotifier;
.source "NotifierManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/NotifierManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BatteryNotifier"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "c"

    .prologue
    .line 254
    invoke-direct {p0, p1}, Lmiui/app/screenelement/NotifierManager$BroadcastNotifier;-><init>(Landroid/content/Context;)V

    .line 255
    return-void
.end method


# virtual methods
.method protected getIntentAction()Ljava/lang/String;
    .registers 2

    .prologue
    .line 258
    const-string v0, "android.intent.action.BATTERY_CHANGED"

    return-object v0
.end method
