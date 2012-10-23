.class Lmiui/app/screenelement/data/Expression$FunctionExpression;
.super Lmiui/app/screenelement/data/Expression;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FunctionExpression"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;,
        Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;
    }
.end annotation


# static fields
.field private static sFunMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

.field private mParaExps:[Lmiui/app/screenelement/data/Expression;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 472
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    .line 474
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "sin"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "cos"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->COS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "tan"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->TAN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "asin"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ASIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "acos"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ACOS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "atan"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ATAN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "sinh"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SINH:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "cosh"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->COSH:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "sqrt"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SQRT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "abs"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ABS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "len"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LEN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "round"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ROUND:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "int"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->INT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "isnull"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ISNULL:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "not"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->NOT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "min"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->MIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "max"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->MAX:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "digit"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->DIGIT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "eq"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->EQ:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "ne"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->NE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "ge"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->GE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "gt"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->GT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "le"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "lt"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "ifelse"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->IFELSE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    const/4 v4, 0x3

    invoke-direct {v2, v3, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    sget-object v0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    const-string v1, "eqs"

    new-instance v2, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    sget-object v3, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->EQS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-direct {v2, v3, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;-><init>(Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    return-void
.end method

.method public constructor <init>([Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V
    .registers 3
    .parameter "exps"
    .parameter "fun"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0}, Lmiui/app/screenelement/data/Expression;-><init>()V

    .line 508
    iput-object p1, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    .line 509
    invoke-direct {p0, p2}, Lmiui/app/screenelement/data/Expression$FunctionExpression;->parseFunction(Ljava/lang/String;)V

    .line 510
    return-void
.end method

.method private digit(II)I
    .registers 6
    .parameter "number"
    .parameter "n"

    .prologue
    const/4 v1, -0x1

    .line 613
    if-gtz p2, :cond_4

    .line 618
    :cond_3
    :goto_3
    return v1

    .line 615
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_5
    if-lez p1, :cond_10

    add-int/lit8 v2, p2, -0x1

    if-ge v0, v2, :cond_10

    .line 616
    div-int/lit8 p1, p1, 0xa

    .line 615
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 618
    :cond_10
    if-lez p1, :cond_3

    rem-int/lit8 v1, p1, 0xa

    goto :goto_3
.end method

.method private len(I)I
    .registers 4
    .parameter "number"

    .prologue
    .line 623
    const/4 v0, 0x1

    .line 624
    .local v0, len:I
    :goto_1
    const/16 v1, 0xa

    if-lt p1, v1, :cond_a

    .line 625
    div-int/lit8 p1, p1, 0xa

    .line 626
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 628
    :cond_a
    return v0
.end method

.method private parseFunction(Ljava/lang/String;)V
    .registers 8
    .parameter "fun"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 513
    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression;->sFunMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;

    .line 514
    .local v0, fd:Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;
    if-eqz v0, :cond_45

    move v1, v2

    :goto_d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "invalid function:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 516
    iget-object v1, v0, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;->fun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    iput-object v1, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    .line 517
    iget-object v1, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    array-length v1, v1

    iget v4, v0, Lmiui/app/screenelement/data/Expression$FunctionExpression$FunctionDesc;->params:I

    if-lt v1, v4, :cond_47

    :goto_2e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "parameters count not matching for function: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 518
    return-void

    :cond_45
    move v1, v3

    .line 514
    goto :goto_d

    :cond_47
    move v2, v3

    .line 517
    goto :goto_2e
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)D
    .registers 14
    .parameter "var"

    .prologue
    const/4 v11, 0x0

    const-wide/high16 v4, 0x3ff0

    const/4 v10, 0x1

    const-wide/16 v6, 0x0

    .line 522
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v11

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    .line 523
    .local v2, value0:D
    sget-object v8, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v9}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_188

    .line 588
    const-string v4, "Expression"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "fail to evalute FunctionExpression, invalid function: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v8}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-wide v4, v6

    .line 589
    :cond_3a
    :goto_3a
    return-wide v4

    .line 525
    :pswitch_3b
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    goto :goto_3a

    .line 527
    :pswitch_40
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    goto :goto_3a

    .line 529
    :pswitch_45
    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    move-result-wide v4

    goto :goto_3a

    .line 531
    :pswitch_4a
    invoke-static {v2, v3}, Ljava/lang/Math;->asin(D)D

    move-result-wide v4

    goto :goto_3a

    .line 533
    :pswitch_4f
    invoke-static {v2, v3}, Ljava/lang/Math;->acos(D)D

    move-result-wide v4

    goto :goto_3a

    .line 535
    :pswitch_54
    invoke-static {v2, v3}, Ljava/lang/Math;->atan(D)D

    move-result-wide v4

    goto :goto_3a

    .line 537
    :pswitch_59
    invoke-static {v2, v3}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v4

    goto :goto_3a

    .line 539
    :pswitch_5e
    invoke-static {v2, v3}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v4

    goto :goto_3a

    .line 541
    :pswitch_63
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    goto :goto_3a

    .line 543
    :pswitch_68
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    goto :goto_3a

    .line 545
    :pswitch_6d
    double-to-int v4, v2

    invoke-direct {p0, v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression;->len(I)I

    move-result v4

    int-to-double v4, v4

    goto :goto_3a

    .line 547
    :pswitch_74
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-double v4, v4

    goto :goto_3a

    .line 549
    :pswitch_7a
    double-to-int v4, v2

    int-to-double v4, v4

    goto :goto_3a

    .line 551
    :pswitch_7d
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v11

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v8

    if-nez v8, :cond_3a

    move-wide v4, v6

    goto :goto_3a

    .line 553
    :pswitch_89
    cmpl-double v8, v2, v6

    if-lez v8, :cond_8f

    :goto_8d
    move-wide v4, v6

    goto :goto_3a

    :cond_8f
    move-wide v6, v4

    goto :goto_8d

    .line 555
    :pswitch_91
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v4, v4, v10

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    goto :goto_3a

    .line 557
    :pswitch_9e
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v4, v4, v10

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    goto :goto_3a

    .line 559
    :pswitch_ab
    double-to-int v4, v2

    iget-object v5, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v5, v5, v10

    invoke-virtual {v5, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    double-to-int v5, v5

    invoke-direct {p0, v4, v5}, Lmiui/app/screenelement/data/Expression$FunctionExpression;->digit(II)I

    move-result v4

    int-to-double v4, v4

    goto :goto_3a

    .line 561
    :pswitch_bb
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpl-double v8, v2, v8

    if-eqz v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 563
    :pswitch_ca
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpl-double v8, v2, v8

    if-nez v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 565
    :pswitch_d9
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpl-double v8, v2, v8

    if-gez v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 567
    :pswitch_e8
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpl-double v8, v2, v8

    if-gtz v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 569
    :pswitch_f7
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpg-double v8, v2, v8

    if-lez v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 571
    :pswitch_106
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v10

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    cmpg-double v8, v2, v8

    if-ltz v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 573
    :pswitch_115
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    array-length v1, v4

    .line 574
    .local v1, len:I
    rem-int/lit8 v4, v1, 0x2

    if-eq v4, v10, :cond_13d

    .line 575
    const-string v4, "Expression"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "function parameter number should be 2*n+1: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v8}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-wide v4, v6

    .line 576
    goto/16 :goto_3a

    .line 578
    :cond_13d
    const/4 v0, 0x0

    .local v0, i:I
    :goto_13e
    add-int/lit8 v4, v1, -0x1

    div-int/lit8 v4, v4, 0x2

    if-ge v0, v4, :cond_163

    .line 579
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    mul-int/lit8 v5, v0, 0x2

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    cmpl-double v4, v4, v6

    if-lez v4, :cond_160

    .line 580
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    mul-int/lit8 v5, v0, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    goto/16 :goto_3a

    .line 578
    :cond_160
    add-int/lit8 v0, v0, 0x1

    goto :goto_13e

    .line 582
    :cond_163
    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    add-int/lit8 v5, v1, -0x1

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    goto/16 :goto_3a

    .line 585
    .end local v0           #i:I
    .end local v1           #len:I
    :pswitch_16f
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v8, v8, v11

    invoke-virtual {v8, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    aget-object v9, v9, v10

    invoke-virtual {v9, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3a

    move-wide v4, v6

    goto/16 :goto_3a

    .line 523
    :pswitch_data_188
    .packed-switch 0x1
        :pswitch_3b
        :pswitch_40
        :pswitch_45
        :pswitch_4a
        :pswitch_4f
        :pswitch_54
        :pswitch_59
        :pswitch_5e
        :pswitch_63
        :pswitch_68
        :pswitch_6d
        :pswitch_74
        :pswitch_7a
        :pswitch_7d
        :pswitch_89
        :pswitch_91
        :pswitch_9e
        :pswitch_ab
        :pswitch_bb
        :pswitch_ca
        :pswitch_d9
        :pswitch_e8
        :pswitch_f7
        :pswitch_106
        :pswitch_115
        :pswitch_16f
    .end packed-switch
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 8
    .parameter "var"

    .prologue
    .line 594
    sget-object v2, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    iget-object v3, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v3}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_70

    .line 608
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/data/Expression$FunctionExpression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lmiui/app/screenelement/util/Utils;->doubleToString(D)Ljava/lang/String;

    move-result-object v2

    :goto_15
    return-object v2

    .line 596
    :pswitch_16
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    array-length v1, v2

    .line 597
    .local v1, len:I
    rem-int/lit8 v2, v1, 0x2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3e

    .line 598
    const-string v2, "Expression"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "function parameter number should be 2*n+1: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mFun:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v4}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    const/4 v2, 0x0

    goto :goto_15

    .line 601
    :cond_3e
    const/4 v0, 0x0

    .local v0, i:I
    :goto_3f
    add-int/lit8 v2, v1, -0x1

    div-int/lit8 v2, v2, 0x2

    if-ge v0, v2, :cond_65

    .line 602
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    mul-int/lit8 v3, v0, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_62

    .line 603
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    mul-int/lit8 v3, v0, 0x2

    add-int/lit8 v3, v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v2

    goto :goto_15

    .line 601
    :cond_62
    add-int/lit8 v0, v0, 0x1

    goto :goto_3f

    .line 605
    :cond_65
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$FunctionExpression;->mParaExps:[Lmiui/app/screenelement/data/Expression;

    add-int/lit8 v3, v1, -0x1

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v2

    goto :goto_15

    .line 594
    :pswitch_data_70
    .packed-switch 0x19
        :pswitch_16
    .end packed-switch
.end method
