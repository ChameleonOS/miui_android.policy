.class public Lmiui/app/screenelement/data/VariableUpdater;
.super Ljava/lang/Object;
.source "VariableUpdater.java"


# instance fields
.field private mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/VariableUpdaterManager;)V
    .registers 2
    .parameter "m"

    .prologue
    .line 10
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lmiui/app/screenelement/data/VariableUpdater;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    .line 12
    return-void
.end method


# virtual methods
.method public finish()V
    .registers 1

    .prologue
    .line 31
    return-void
.end method

.method protected getContext()Lmiui/app/screenelement/ScreenContext;
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lmiui/app/screenelement/data/VariableUpdater;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .registers 1

    .prologue
    .line 19
    return-void
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 28
    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    .line 25
    return-void
.end method

.method public tick(J)V
    .registers 3
    .parameter "currentTime"

    .prologue
    .line 22
    return-void
.end method
