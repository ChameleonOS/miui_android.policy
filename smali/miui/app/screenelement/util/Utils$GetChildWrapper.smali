.class public Lmiui/app/screenelement/util/Utils$GetChildWrapper;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/util/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GetChildWrapper"
.end annotation


# instance fields
.field private mEle:Lorg/w3c/dom/Element;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;)V
    .registers 2
    .parameter "ele"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/util/Utils$GetChildWrapper;->mEle:Lorg/w3c/dom/Element;

    return-void
.end method


# virtual methods
.method public getChild(Ljava/lang/String;)Lmiui/app/screenelement/util/Utils$GetChildWrapper;
    .registers 4
    .parameter "name"

    .prologue
    new-instance v0, Lmiui/app/screenelement/util/Utils$GetChildWrapper;

    iget-object v1, p0, Lmiui/app/screenelement/util/Utils$GetChildWrapper;->mEle:Lorg/w3c/dom/Element;

    invoke-static {v1, p1}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/screenelement/util/Utils$GetChildWrapper;-><init>(Lorg/w3c/dom/Element;)V

    return-object v0
.end method

.method public getElement()Lorg/w3c/dom/Element;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/util/Utils$GetChildWrapper;->mEle:Lorg/w3c/dom/Element;

    return-object v0
.end method
