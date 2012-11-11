.class Lmiui/app/screenelement/data/Expression$NumberExpression;
.super Lmiui/app/screenelement/data/Expression;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NumberExpression"
.end annotation


# instance fields
.field private mString:Ljava/lang/String;

.field private mValue:D


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .parameter "num"

    .prologue
    invoke-direct {p0}, Lmiui/app/screenelement/data/Expression;-><init>()V

    :try_start_3
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mValue:D
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_9} :catch_a

    :goto_9
    return-void

    :catch_a
    move-exception v0

    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v1, "Expression"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid NumberExpression:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_9
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)D
    .registers 4
    .parameter "var"

    .prologue
    iget-wide v0, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mValue:D

    return-wide v0
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 4
    .parameter "var"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mString:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-wide v0, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mValue:D

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->doubleToString(D)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mString:Ljava/lang/String;

    :cond_c
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$NumberExpression;->mString:Ljava/lang/String;

    return-object v0
.end method
