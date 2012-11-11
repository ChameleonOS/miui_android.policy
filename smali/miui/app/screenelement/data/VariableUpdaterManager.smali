.class public Lmiui/app/screenelement/data/VariableUpdaterManager;
.super Ljava/lang/Object;
.source "VariableUpdaterManager.java"


# instance fields
.field private mContext:Lmiui/app/screenelement/ScreenContext;

.field private mUpdaters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/data/VariableUpdater;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;)V
    .registers 3
    .parameter "c"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    iput-object p1, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-void
.end method


# virtual methods
.method public add(Lmiui/app/screenelement/data/VariableUpdater;)V
    .registers 3
    .parameter "updater"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public finish()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/VariableUpdater;

    .local v1, updater:Lmiui/app/screenelement/data/VariableUpdater;
    invoke-virtual {v1}, Lmiui/app/screenelement/data/VariableUpdater;->finish()V

    goto :goto_6

    .end local v1           #updater:Lmiui/app/screenelement/data/VariableUpdater;
    :cond_16
    return-void
.end method

.method public getContext()Lmiui/app/screenelement/ScreenContext;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-object v0
.end method

.method public init()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/VariableUpdater;

    .local v1, updater:Lmiui/app/screenelement/data/VariableUpdater;
    invoke-virtual {v1}, Lmiui/app/screenelement/data/VariableUpdater;->init()V

    goto :goto_6

    .end local v1           #updater:Lmiui/app/screenelement/data/VariableUpdater;
    :cond_16
    return-void
.end method

.method public pause()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/VariableUpdater;

    .local v1, updater:Lmiui/app/screenelement/data/VariableUpdater;
    invoke-virtual {v1}, Lmiui/app/screenelement/data/VariableUpdater;->pause()V

    goto :goto_6

    .end local v1           #updater:Lmiui/app/screenelement/data/VariableUpdater;
    :cond_16
    return-void
.end method

.method public remove(Lmiui/app/screenelement/data/VariableUpdater;)V
    .registers 3
    .parameter "updater"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public resume()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/VariableUpdater;

    .local v1, updater:Lmiui/app/screenelement/data/VariableUpdater;
    invoke-virtual {v1}, Lmiui/app/screenelement/data/VariableUpdater;->resume()V

    goto :goto_6

    .end local v1           #updater:Lmiui/app/screenelement/data/VariableUpdater;
    :cond_16
    return-void
.end method

.method public tick(J)V
    .registers 6
    .parameter "currentTime"

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/data/VariableUpdaterManager;->mUpdaters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/VariableUpdater;

    .local v1, updater:Lmiui/app/screenelement/data/VariableUpdater;
    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/data/VariableUpdater;->tick(J)V

    goto :goto_6

    .end local v1           #updater:Lmiui/app/screenelement/data/VariableUpdater;
    :cond_16
    return-void
.end method
