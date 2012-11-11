.class public Lmiui/app/screenelement/data/WebServiceBinder$Variable;
.super Ljava/lang/Object;
.source "WebServiceBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/WebServiceBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Variable"
.end annotation


# static fields
.field public static final TAG_NAME:Ljava/lang/String; = "Variable"

.field private static final TYPE_NUMBER:Ljava/lang/String; = "number"

.field private static final TYPE_STRING:Ljava/lang/String; = "string"


# instance fields
.field public mName:Ljava/lang/String;

.field public mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field public mPersist:Z

.field public mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

.field public mType:Ljava/lang/String;

.field private mVar:Lmiui/app/screenelement/data/Variables;

.field public mXPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/data/Variables;)V
    .registers 3
    .parameter "node"
    .parameter "var"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mVar:Lmiui/app/screenelement/data/Variables;

    invoke-direct {p0, p1}, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->load(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method private createVar()V
    .registers 4

    .prologue
    const-string v0, "string"

    iget-object v1, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Lmiui/app/screenelement/util/IndexedStringVariable;

    iget-object v1, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    iget-object v2, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mVar:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    :cond_15
    :goto_15
    return-void

    :cond_16
    const-string v0, "number"

    iget-object v1, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    iget-object v2, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mVar:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    goto :goto_15
.end method

.method private load(Lorg/w3c/dom/Element;)V
    .registers 4
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    if-nez p1, :cond_11

    const-string v0, "WebServiceBinder"

    const-string v1, "Variable node is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v1, "node is null"

    invoke-direct {v0, v1}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    const-string v0, "name"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    const-string v0, "type"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mType:Ljava/lang/String;

    const-string v0, "xpath"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mXPath:Ljava/lang/String;

    const-string v0, "persist"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mPersist:Z

    invoke-direct {p0}, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->createVar()V

    return-void
.end method
