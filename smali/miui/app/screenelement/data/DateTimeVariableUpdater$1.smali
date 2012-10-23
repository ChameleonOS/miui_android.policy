.class Lmiui/app/screenelement/data/DateTimeVariableUpdater$1;
.super Ljava/lang/Object;
.source "DateTimeVariableUpdater.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/DateTimeVariableUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/data/DateTimeVariableUpdater;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/data/DateTimeVariableUpdater;)V
    .registers 2
    .parameter

    .prologue
    .line 44
    iput-object p1, p0, Lmiui/app/screenelement/data/DateTimeVariableUpdater$1;->this$0:Lmiui/app/screenelement/data/DateTimeVariableUpdater;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 46
    iget-object v0, p0, Lmiui/app/screenelement/data/DateTimeVariableUpdater$1;->this$0:Lmiui/app/screenelement/data/DateTimeVariableUpdater;

    #calls: Lmiui/app/screenelement/data/DateTimeVariableUpdater;->updateTime()V
    invoke-static {v0}, Lmiui/app/screenelement/data/DateTimeVariableUpdater;->access$000(Lmiui/app/screenelement/data/DateTimeVariableUpdater;)V

    .line 47
    iget-object v0, p0, Lmiui/app/screenelement/data/DateTimeVariableUpdater$1;->this$0:Lmiui/app/screenelement/data/DateTimeVariableUpdater;

    #getter for: Lmiui/app/screenelement/data/DateTimeVariableUpdater;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/data/DateTimeVariableUpdater;->access$100(Lmiui/app/screenelement/data/DateTimeVariableUpdater;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 48
    return-void
.end method
