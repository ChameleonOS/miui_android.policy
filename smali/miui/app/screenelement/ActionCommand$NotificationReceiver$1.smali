.class Lmiui/app/screenelement/ActionCommand$NotificationReceiver$1;
.super Ljava/lang/Object;
.source "ActionCommand.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/screenelement/ActionCommand$NotificationReceiver;->asyncUpdate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/ActionCommand$NotificationReceiver;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/ActionCommand$NotificationReceiver;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/ActionCommand$NotificationReceiver$1;->this$0:Lmiui/app/screenelement/ActionCommand$NotificationReceiver;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$NotificationReceiver$1;->this$0:Lmiui/app/screenelement/ActionCommand$NotificationReceiver;

    invoke-virtual {v0}, Lmiui/app/screenelement/ActionCommand$NotificationReceiver;->update()V

    return-void
.end method
