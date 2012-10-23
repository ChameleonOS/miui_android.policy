.class Lmiui/app/screenelement/data/Expression$BinaryExpression;
.super Lmiui/app/screenelement/data/Expression;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BinaryExpression"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;
    }
.end annotation


# instance fields
.field private mExp1:Lmiui/app/screenelement/data/Expression;

.field private mExp2:Lmiui/app/screenelement/data/Expression;

.field private mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/Expression;Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V
    .registers 7
    .parameter "exp1"
    .parameter "exp2"
    .parameter "op"

    .prologue
    .line 356
    invoke-direct {p0}, Lmiui/app/screenelement/data/Expression;-><init>()V

    .line 329
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->INVALID:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    iput-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    .line 357
    iput-object p1, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    .line 358
    iput-object p2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    .line 359
    invoke-static {p3}, Lmiui/app/screenelement/data/Expression$BinaryExpression;->parseOperator(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    .line 360
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->INVALID:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    if-ne v0, v1, :cond_2f

    .line 361
    const-string v0, "Expression"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BinaryExpression: invalid operator:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    :cond_2f
    return-void
.end method

.method public static parseOperator(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;
    .registers 2
    .parameter "op"

    .prologue
    .line 341
    const-string v0, "+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 342
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ADD:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    .line 353
    :goto_a
    return-object v0

    .line 343
    :cond_b
    const-string v0, "-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 344
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MIN:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    goto :goto_a

    .line 345
    :cond_16
    const-string v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 346
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MUL:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    goto :goto_a

    .line 347
    :cond_21
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 348
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->DIV:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    goto :goto_a

    .line 349
    :cond_2c
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 350
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MOD:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    goto :goto_a

    .line 353
    :cond_37
    sget-object v0, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->INVALID:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    goto :goto_a
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)D
    .registers 6
    .parameter "var"

    .prologue
    .line 367
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    iget-object v1, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_5e

    .line 380
    const-string v0, "Expression"

    const-string v1, "fail to evalute BinaryExpression, invalid operator"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    const-wide/16 v0, 0x0

    :goto_16
    return-wide v0

    .line 369
    :pswitch_17
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    add-double/2addr v0, v2

    goto :goto_16

    .line 371
    :pswitch_25
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    sub-double/2addr v0, v2

    goto :goto_16

    .line 373
    :pswitch_33
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    mul-double/2addr v0, v2

    goto :goto_16

    .line 375
    :pswitch_41
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    div-double/2addr v0, v2

    goto :goto_16

    .line 377
    :pswitch_4f
    iget-object v0, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v2

    rem-double/2addr v0, v2

    goto :goto_16

    .line 367
    nop

    :pswitch_data_5e
    .packed-switch 0x1
        :pswitch_17
        :pswitch_25
        :pswitch_33
        :pswitch_41
        :pswitch_4f
    .end packed-switch
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 7
    .parameter "var"

    .prologue
    const/4 v2, 0x0

    .line 401
    iget-object v3, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, str1:Ljava/lang/String;
    iget-object v3, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, str2:Ljava/lang/String;
    sget-object v3, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v4}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_42

    .line 415
    const-string v3, "Expression"

    const-string v4, "fail to evalute string BinaryExpression, invalid operator"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v2

    .line 416
    .end local v1           #str2:Ljava/lang/String;
    :cond_22
    :goto_22
    return-object v1

    .line 405
    .restart local v1       #str2:Ljava/lang/String;
    :pswitch_23
    if-nez v0, :cond_29

    if-nez v1, :cond_29

    move-object v1, v2

    .line 406
    goto :goto_22

    .line 407
    :cond_29
    if-eqz v0, :cond_22

    .line 409
    if-nez v1, :cond_2f

    move-object v1, v0

    .line 410
    goto :goto_22

    .line 412
    :cond_2f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_22

    .line 403
    nop

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_23
    .end packed-switch
.end method

.method public isNull(Lmiui/app/screenelement/data/Variables;)Z
    .registers 6
    .parameter "var"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 386
    sget-object v2, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    iget-object v3, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mOpe:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v3}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_36

    .line 396
    :cond_f
    :goto_f
    return v0

    .line 389
    :pswitch_10
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v2

    if-eqz v2, :cond_20

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v2

    if-nez v2, :cond_f

    :cond_20
    move v0, v1

    goto :goto_f

    .line 393
    :pswitch_22
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp1:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v2

    if-nez v2, :cond_32

    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$BinaryExpression;->mExp2:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v2

    if-eqz v2, :cond_33

    :cond_32
    move v1, v0

    :cond_33
    move v0, v1

    goto :goto_f

    .line 386
    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_10
        :pswitch_10
        :pswitch_22
        :pswitch_22
        :pswitch_22
    .end packed-switch
.end method
