.class public Lmiui/app/screenelement/elements/VariableArrayElement;
.super Lmiui/app/screenelement/elements/ScreenElement;
.source "VariableArrayElement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/elements/VariableArrayElement$Item;,
        Lmiui/app/screenelement/elements/VariableArrayElement$Var;
    }
.end annotation


# static fields
.field public static final TAG_NAME:Ljava/lang/String; = "VarArray"


# instance fields
.field private mArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/VariableArrayElement$Item;",
            ">;"
        }
    .end annotation
.end field

.field private mIsStringType:Z

.field private mVars:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/VariableArrayElement$Var;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 7
    .parameter "ele"
    .parameter "c"
    .parameter "root"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mArray:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mVars:Ljava/util/ArrayList;

    if-eqz p1, :cond_41

    const-string v0, "string"

    const-string v1, "type"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mIsStringType:Z

    const-string v0, "Vars"

    invoke-static {p1, v0}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    const-string v1, "Var"

    new-instance v2, Lmiui/app/screenelement/elements/VariableArrayElement$1;

    invoke-direct {v2, p0}, Lmiui/app/screenelement/elements/VariableArrayElement$1;-><init>(Lmiui/app/screenelement/elements/VariableArrayElement;)V

    invoke-static {v0, v1, v2}, Lmiui/app/screenelement/util/Utils;->traverseXmlElementChildren(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/util/Utils$XmlTraverseListener;)V

    const-string v0, "Items"

    invoke-static {p1, v0}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    const-string v1, "Item"

    new-instance v2, Lmiui/app/screenelement/elements/VariableArrayElement$2;

    invoke-direct {v2, p0}, Lmiui/app/screenelement/elements/VariableArrayElement$2;-><init>(Lmiui/app/screenelement/elements/VariableArrayElement;)V

    invoke-static {v0, v1, v2}, Lmiui/app/screenelement/util/Utils;->traverseXmlElementChildren(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/util/Utils$XmlTraverseListener;)V

    :cond_41
    return-void
.end method

.method static synthetic access$000(Lmiui/app/screenelement/elements/VariableArrayElement;)Z
    .registers 2
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mIsStringType:Z

    return v0
.end method

.method static synthetic access$100(Lmiui/app/screenelement/elements/VariableArrayElement;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lmiui/app/screenelement/elements/VariableArrayElement;)Ljava/util/ArrayList;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mVars:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public doRender(Landroid/graphics/Canvas;)V
    .registers 2
    .parameter "c"

    .prologue
    return-void
.end method

.method public init()V
    .registers 4

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mVars:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/VariableArrayElement$Var;

    .local v1, v:Lmiui/app/screenelement/elements/VariableArrayElement$Var;
    invoke-virtual {v1}, Lmiui/app/screenelement/elements/VariableArrayElement$Var;->init()V

    goto :goto_6

    .end local v1           #v:Lmiui/app/screenelement/elements/VariableArrayElement$Var;
    :cond_16
    return-void
.end method

.method public tick(J)V
    .registers 6
    .parameter "currentTime"

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/elements/VariableArrayElement;->mVars:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/VariableArrayElement$Var;

    .local v1, v:Lmiui/app/screenelement/elements/VariableArrayElement$Var;
    invoke-virtual {v1}, Lmiui/app/screenelement/elements/VariableArrayElement$Var;->tick()V

    goto :goto_6

    .end local v1           #v:Lmiui/app/screenelement/elements/VariableArrayElement$Var;
    :cond_16
    return-void
.end method
