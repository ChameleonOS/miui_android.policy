.class public Lmiui/app/screenelement/util/ColorParser;
.super Ljava/lang/Object;
.source "ColorParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/util/ColorParser$1;,
        Lmiui/app/screenelement/util/ColorParser$ExpressionType;
    }
.end annotation


# static fields
.field private static final DEFAULT_COLOR:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String; = "ColorParser"


# instance fields
.field private mColor:I

.field private mColorExpression:Ljava/lang/String;

.field private mIndexedColorVar:Lmiui/app/screenelement/util/IndexedStringVariable;

.field private mRGBExpression:[Lmiui/app/screenelement/data/Expression;

.field private mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .parameter "expression"

    .prologue
    .line 33
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    .line 35
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 36
    sget-object v1, Lmiui/app/screenelement/util/ColorParser$ExpressionType;->CONST:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    .line 38
    :try_start_17
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColor:I
    :try_end_1f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_17 .. :try_end_1f} :catch_20

    .line 54
    :cond_1f
    :goto_1f
    return-void

    .line 39
    :catch_20
    move-exception v0

    .line 40
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v1, -0x1

    iput v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColor:I

    goto :goto_1f

    .line 42
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :cond_25
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 43
    sget-object v1, Lmiui/app/screenelement/util/ColorParser$ExpressionType;->VARIABLE:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    goto :goto_1f

    .line 44
    :cond_34
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    const-string v2, "argb("

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_76

    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_76

    .line 45
    sget-object v1, Lmiui/app/screenelement/util/ColorParser$ExpressionType;->ARGB:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    .line 46
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    const/4 v2, 0x5

    iget-object v3, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->buildMultiple(Ljava/lang/String;)[Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    .line 47
    iget-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    array-length v1, v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1f

    .line 48
    const-string v1, "ColorParser"

    const-string v2, "bad expression format"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad expression format."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 52
    :cond_76
    sget-object v1, Lmiui/app/screenelement/util/ColorParser$ExpressionType;->INVALID:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    iput-object v1, p0, Lmiui/app/screenelement/util/ColorParser;->mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    goto :goto_1f
.end method

.method public static fromElement(Lorg/w3c/dom/Element;)Lmiui/app/screenelement/util/ColorParser;
    .registers 3
    .parameter "e"

    .prologue
    .line 81
    new-instance v0, Lmiui/app/screenelement/util/ColorParser;

    const-string v1, "color"

    invoke-interface {p0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/screenelement/util/ColorParser;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getColor(Lmiui/app/screenelement/data/Variables;)I
    .registers 9
    .parameter "v"

    .prologue
    const/4 v6, 0x1

    .line 57
    sget-object v4, Lmiui/app/screenelement/util/ColorParser$1;->$SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType:[I

    iget-object v5, p0, Lmiui/app/screenelement/util/ColorParser;->mType:Lmiui/app/screenelement/util/ColorParser$ExpressionType;

    invoke-virtual {v5}, Lmiui/app/screenelement/util/ColorParser$ExpressionType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_68

    .line 77
    :goto_e
    :pswitch_e
    iget v4, p0, Lmiui/app/screenelement/util/ColorParser;->mColor:I

    return v4

    .line 61
    :pswitch_11
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mIndexedColorVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    if-nez v4, :cond_22

    .line 62
    new-instance v4, Lmiui/app/screenelement/util/IndexedStringVariable;

    iget-object v5, p0, Lmiui/app/screenelement/util/ColorParser;->mColorExpression:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mIndexedColorVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    .line 64
    :cond_22
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mIndexedColorVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v4}, Lmiui/app/screenelement/util/IndexedStringVariable;->get()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_37

    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mIndexedColorVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v4}, Lmiui/app/screenelement/util/IndexedStringVariable;->get()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    :goto_34
    iput v4, p0, Lmiui/app/screenelement/util/ColorParser;->mColor:I

    goto :goto_e

    :cond_37
    const/4 v4, -0x1

    goto :goto_34

    .line 67
    :pswitch_39
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    double-to-int v0, v4

    .line 68
    .local v0, a:I
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    aget-object v4, v4, v6

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    double-to-int v3, v4

    .line 69
    .local v3, r:I
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    const/4 v5, 0x2

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    double-to-int v2, v4

    .line 70
    .local v2, g:I
    iget-object v4, p0, Lmiui/app/screenelement/util/ColorParser;->mRGBExpression:[Lmiui/app/screenelement/data/Expression;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    invoke-virtual {v4, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    double-to-int v1, v4

    .line 71
    .local v1, b:I
    invoke-static {v0, v3, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    iput v4, p0, Lmiui/app/screenelement/util/ColorParser;->mColor:I

    goto :goto_e

    .line 57
    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
        :pswitch_39
    .end packed-switch
.end method
