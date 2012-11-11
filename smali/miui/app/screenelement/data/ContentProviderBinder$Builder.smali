.class public Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
.super Ljava/lang/Object;
.source "ContentProviderBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/ContentProviderBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;


# direct methods
.method protected constructor <init>(Lmiui/app/screenelement/data/ContentProviderBinder;)V
    .registers 2
    .parameter "binder"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    return-void
.end method


# virtual methods
.method public addVariable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7
    .parameter "name"
    .parameter "type"
    .parameter "column"
    .parameter "row"

    .prologue
    new-instance v0, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;

    invoke-direct {v0}, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;-><init>()V

    .local v0, v:Lmiui/app/screenelement/data/ContentProviderBinder$Variable;
    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->mName:Ljava/lang/String;

    iput-object p2, v0, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->mType:Ljava/lang/String;

    iput-object p3, v0, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->mColumn:Ljava/lang/String;

    iput p4, v0, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->mRow:I

    #calls: Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->createVar()V
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder$Variable;->access$100(Lmiui/app/screenelement/data/ContentProviderBinder$Variable;)V

    iget-object v1, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    invoke-virtual {v1, v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->addVariable(Lmiui/app/screenelement/data/ContentProviderBinder$Variable;)V

    return-void
.end method

.method public setArgs([Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 3
    .parameter "args"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mArgs:[Ljava/lang/String;

    return-object p0
.end method

.method public setColumns([Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 3
    .parameter "columns"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mColumns:[Ljava/lang/String;

    return-object p0
.end method

.method public setCountName(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 3
    .parameter "countName"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mCountName:Ljava/lang/String;

    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->createCountVar()V

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 3
    .parameter "name"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mName:Ljava/lang/String;

    return-object p0
.end method

.method public setOrder(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 3
    .parameter "order"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    iput-object p1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mOrder:Ljava/lang/String;

    return-object p0
.end method

.method public setWhere(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 4
    .parameter "where"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    new-instance v1, Lmiui/app/screenelement/util/TextFormatter;

    invoke-direct {v1, p1}, Lmiui/app/screenelement/util/TextFormatter;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mWhereFormatter:Lmiui/app/screenelement/util/TextFormatter;

    return-object p0
.end method

.method public setWhere(Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;
    .registers 5
    .parameter "whereFormat"
    .parameter "whereParas"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->mBinder:Lmiui/app/screenelement/data/ContentProviderBinder;

    new-instance v1, Lmiui/app/screenelement/util/TextFormatter;

    invoke-direct {v1, p1, p2}, Lmiui/app/screenelement/util/TextFormatter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v0, Lmiui/app/screenelement/data/ContentProviderBinder;->mWhereFormatter:Lmiui/app/screenelement/util/TextFormatter;

    return-object p0
.end method
