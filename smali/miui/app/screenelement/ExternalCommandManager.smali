.class public Lmiui/app/screenelement/ExternalCommandManager;
.super Ljava/lang/Object;
.source "ExternalCommandManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "ExternalCommandManager"

.field public static final TAG_NAME:Ljava/lang/String; = "ExternalCommands"


# instance fields
.field private mContext:Lmiui/app/screenelement/ScreenContext;

.field private mTriggers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/CommandTrigger;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 5
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    iput-object p2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mContext:Lmiui/app/screenelement/ScreenContext;

    if-eqz p1, :cond_11

    invoke-direct {p0, p1, p3}, Lmiui/app/screenelement/ExternalCommandManager;->load(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V

    :cond_11
    return-void
.end method

.method private load(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 9
    .parameter "node"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    if-nez p1, :cond_11

    const-string v3, "ExternalCommandManager"

    const-string v4, "node is null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v4, "node is null"

    invoke-direct {v3, v4}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_11
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .local v0, children:Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_16
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_49

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_39

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .local v2, item:Lorg/w3c/dom/Element;
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Trigger"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    .end local v2           #item:Lorg/w3c/dom/Element;
    :cond_39
    :goto_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .restart local v2       #item:Lorg/w3c/dom/Element;
    :cond_3c
    iget-object v3, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    new-instance v4, Lmiui/app/screenelement/CommandTrigger;

    iget-object v5, p0, Lmiui/app/screenelement/ExternalCommandManager;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v4, v5, v2, p2}, Lmiui/app/screenelement/CommandTrigger;-><init>(Lmiui/app/screenelement/ScreenContext;Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_39

    .end local v2           #item:Lorg/w3c/dom/Element;
    :cond_49
    return-void
.end method


# virtual methods
.method public finish()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/CommandTrigger;

    .local v1, t:Lmiui/app/screenelement/CommandTrigger;
    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->finish()V

    goto :goto_6

    .end local v1           #t:Lmiui/app/screenelement/CommandTrigger;
    :cond_16
    return-void
.end method

.method public init()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/CommandTrigger;

    .local v1, t:Lmiui/app/screenelement/CommandTrigger;
    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->init()V

    goto :goto_6

    .end local v1           #t:Lmiui/app/screenelement/CommandTrigger;
    :cond_16
    return-void
.end method

.method public onCommand(Ljava/lang/String;)V
    .registers 5
    .parameter "command"

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/CommandTrigger;

    .local v1, t:Lmiui/app/screenelement/CommandTrigger;
    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->getActionString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->perform()V

    .end local v1           #t:Lmiui/app/screenelement/CommandTrigger;
    :cond_1f
    return-void
.end method

.method public pause()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/CommandTrigger;

    .local v1, t:Lmiui/app/screenelement/CommandTrigger;
    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->pause()V

    goto :goto_6

    .end local v1           #t:Lmiui/app/screenelement/CommandTrigger;
    :cond_16
    return-void
.end method

.method public resume()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/ExternalCommandManager;->mTriggers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/CommandTrigger;

    .local v1, t:Lmiui/app/screenelement/CommandTrigger;
    invoke-virtual {v1}, Lmiui/app/screenelement/CommandTrigger;->resume()V

    goto :goto_6

    .end local v1           #t:Lmiui/app/screenelement/CommandTrigger;
    :cond_16
    return-void
.end method
