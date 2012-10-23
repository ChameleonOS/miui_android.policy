.class Lmiui/app/screenelement/data/Expression$StringExpression;
.super Lmiui/app/screenelement/data/Expression;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringExpression"
.end annotation


# instance fields
.field private mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .parameter "str"

    .prologue
    .line 255
    invoke-direct {p0}, Lmiui/app/screenelement/data/Expression;-><init>()V

    .line 256
    iput-object p1, p0, Lmiui/app/screenelement/data/Expression$StringExpression;->mValue:Ljava/lang/String;

    .line 257
    return-void
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)D
    .registers 5
    .parameter "var"

    .prologue
    .line 262
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/data/Expression$StringExpression;->mValue:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 263
    .local v0, value:Ljava/lang/Double;
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D
    :try_end_d
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_d} :catch_f

    move-result-wide v1

    .line 266
    .end local v0           #value:Ljava/lang/Double;
    :goto_e
    return-wide v1

    .line 264
    :catch_f
    move-exception v1

    .line 266
    const-wide/16 v1, 0x0

    goto :goto_e
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 3
    .parameter "var"

    .prologue
    .line 271
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$StringExpression;->mValue:Ljava/lang/String;

    return-object v0
.end method
