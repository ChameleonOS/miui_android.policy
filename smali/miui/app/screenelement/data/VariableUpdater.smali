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
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/data/VariableUpdater;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    return-void
.end method


# virtual methods
.method public finish()V
    .registers 1

    .prologue
    return-void
.end method

.method protected getContext()Lmiui/app/screenelement/ScreenContext;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/VariableUpdater;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v0

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

.method public resume()V
    .registers 1

    .prologue
    return-void
.end method

.method public tick(J)V
    .registers 3
    .parameter "currentTime"

    .prologue
    return-void
.end method
