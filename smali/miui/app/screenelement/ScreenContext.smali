.class public Lmiui/app/screenelement/ScreenContext;
.super Ljava/lang/Object;
.source "ScreenContext.java"


# static fields
.field public static final MAML_PREFERENCES:Ljava/lang/String; = "MamlPreferences"


# instance fields
.field private mApplicationContext:Landroid/content/Context;

.field public final mContext:Landroid/content/Context;

.field private mController:Lmiui/app/screenelement/RendererController;

.field public final mFactory:Lmiui/app/screenelement/elements/ScreenElementFactory;

.field private mGotApplicationContext:Z

.field public mHandler:Landroid/os/Handler;

.field public final mResourceManager:Lmiui/app/screenelement/ResourceManager;

.field public mVariables:Lmiui/app/screenelement/data/Variables;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceLoader;)V
    .registers 5
    .parameter "context"
    .parameter "loader"

    .prologue
    new-instance v0, Lmiui/app/screenelement/ResourceManager;

    invoke-direct {v0, p2}, Lmiui/app/screenelement/ResourceManager;-><init>(Lmiui/app/screenelement/ResourceLoader;)V

    new-instance v1, Lmiui/app/screenelement/elements/ScreenElementFactory;

    invoke-direct {v1}, Lmiui/app/screenelement/elements/ScreenElementFactory;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/ScreenContext;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;Lmiui/app/screenelement/elements/ScreenElementFactory;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceLoader;Lmiui/app/screenelement/elements/ScreenElementFactory;)V
    .registers 5
    .parameter "context"
    .parameter "loader"
    .parameter "factory"

    .prologue
    new-instance v0, Lmiui/app/screenelement/ResourceManager;

    invoke-direct {v0, p2}, Lmiui/app/screenelement/ResourceManager;-><init>(Lmiui/app/screenelement/ResourceLoader;)V

    invoke-direct {p0, p1, v0, p3}, Lmiui/app/screenelement/ScreenContext;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;Lmiui/app/screenelement/elements/ScreenElementFactory;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;)V
    .registers 4
    .parameter "context"
    .parameter "resourceMgr"

    .prologue
    new-instance v0, Lmiui/app/screenelement/elements/ScreenElementFactory;

    invoke-direct {v0}, Lmiui/app/screenelement/elements/ScreenElementFactory;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lmiui/app/screenelement/ScreenContext;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;Lmiui/app/screenelement/elements/ScreenElementFactory;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;Lmiui/app/screenelement/elements/ScreenElementFactory;)V
    .registers 5
    .parameter "context"
    .parameter "resourceMgr"
    .parameter "factory"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0}, Lmiui/app/screenelement/data/Variables;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    iput-object p3, p0, Lmiui/app/screenelement/ScreenContext;->mFactory:Lmiui/app/screenelement/elements/ScreenElementFactory;

    return-void
.end method


# virtual methods
.method public createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;
    .registers 3
    .parameter "name"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/RendererController;->createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    move-result-object v0

    goto :goto_5
.end method

.method public doneRender()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->doneRender()V

    :cond_9
    return-void
.end method

.method public getRawContext()Landroid/content/Context;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mApplicationContext:Landroid/content/Context;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mApplicationContext:Landroid/content/Context;

    :goto_6
    return-object v0

    :cond_7
    iget-boolean v0, p0, Lmiui/app/screenelement/ScreenContext;->mGotApplicationContext:Z

    if-nez v0, :cond_1d

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mApplicationContext:Landroid/content/Context;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/ScreenContext;->mGotApplicationContext:Z

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mApplicationContext:Landroid/content/Context;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mApplicationContext:Landroid/content/Context;

    goto :goto_6

    :cond_1d
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    goto :goto_6
.end method

.method public getRenderController()Lmiui/app/screenelement/RendererController;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    return-object v0
.end method

.method public requestUpdate()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->requestUpdate()V

    :cond_9
    return-void
.end method

.method public setExtraResource(I)V
    .registers 3
    .parameter "sw"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ResourceManager;->setExtraResource(I)V

    return-void
.end method

.method public setRenderController(Lmiui/app/screenelement/RendererController;)V
    .registers 2
    .parameter "controller"

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    return-void
.end method

.method public setResourceDensity(I)V
    .registers 3
    .parameter "density"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ResourceManager;->setResourceDensity(I)V

    return-void
.end method

.method public setTargetDensity(I)V
    .registers 3
    .parameter "density"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ResourceManager;->setTargetDensity(I)V

    return-void
.end method

.method public shouldUpdate()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lmiui/app/screenelement/ScreenContext;->mController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->shouldUpdate()Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
