.class Lmiui/app/screenelement/elements/TimepanelScreenElement$1;
.super Ljava/lang/Object;
.source "TimepanelScreenElement.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/TimepanelScreenElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/elements/TimepanelScreenElement;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V
    .registers 2
    .parameter

    .prologue
    .line 46
    iput-object p1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;->this$0:Lmiui/app/screenelement/elements/TimepanelScreenElement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 48
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;->this$0:Lmiui/app/screenelement/elements/TimepanelScreenElement;

    #calls: Lmiui/app/screenelement/elements/TimepanelScreenElement;->updateTime()V
    invoke-static {v0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->access$000(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V

    .line 49
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;->this$0:Lmiui/app/screenelement/elements/TimepanelScreenElement;

    #getter for: Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->access$100(Lmiui/app/screenelement/elements/TimepanelScreenElement;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 50
    return-void
.end method
