.class Lcom/miui/internal/policy/impl/SlidingPanel$2;
.super Ljava/lang/Object;
.source "SlidingPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/policy/impl/SlidingPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/internal/policy/impl/SlidingPanel;


# direct methods
.method constructor <init>(Lcom/miui/internal/policy/impl/SlidingPanel;)V
    .registers 2
    .parameter

    .prologue
    .line 326
    iput-object p1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 329
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    #getter for: Lcom/miui/internal/policy/impl/SlidingPanel;->mSingleClick:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$500(Lcom/miui/internal/policy/impl/SlidingPanel;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/policy/impl/SlidingPanel;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 330
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    #getter for: Lcom/miui/internal/policy/impl/SlidingPanel;->mMoving:Z
    invoke-static {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$600(Lcom/miui/internal/policy/impl/SlidingPanel;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 331
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    const/4 v1, 0x3

    #calls: Lcom/miui/internal/policy/impl/SlidingPanel;->setGrabbedState(I)V
    invoke-static {v0, v1}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$700(Lcom/miui/internal/policy/impl/SlidingPanel;I)V

    .line 333
    :cond_19
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$2;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    const-wide/16 v1, 0x0

    #setter for: Lcom/miui/internal/policy/impl/SlidingPanel;->mLastDownTime:J
    invoke-static {v0, v1, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$802(Lcom/miui/internal/policy/impl/SlidingPanel;J)J

    .line 334
    return-void
.end method
