.class Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;
.super Ljava/lang/Object;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression$FunctionExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FunctionDesc"
.end annotation


# instance fields
.field fun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

.field params:I


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V
    .registers 3
    .parameter "f"
    .parameter "i"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;->fun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    iput p2, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;->params:I

    return-void
.end method
