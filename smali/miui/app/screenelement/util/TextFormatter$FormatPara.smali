.class abstract Lmiui/app/screenelement/util/TextFormatter$FormatPara;
.super Ljava/lang/Object;
.source "TextFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/util/TextFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "FormatPara"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lmiui/app/screenelement/util/TextFormatter$1;)V
    .registers 2
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lmiui/app/screenelement/util/TextFormatter$FormatPara;-><init>()V

    return-void
.end method

.method public static build(Ljava/lang/String;)Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    .registers 6
    .parameter "para"

    .prologue
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .local v0, exp:Ljava/lang/String;
    const-string v2, "@"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    new-instance v2, Lmiui/app/screenelement/util/TextFormatter$StringVarPara;

    new-instance v3, Lmiui/app/screenelement/util/Variable;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lmiui/app/screenelement/util/Variable;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lmiui/app/screenelement/util/TextFormatter$StringVarPara;-><init>(Lmiui/app/screenelement/util/Variable;)V

    :goto_1b
    return-object v2

    :cond_1c
    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    .local v1, expression:Lmiui/app/screenelement/data/Expression;
    if-nez v1, :cond_3c

    const-string v2, "TextFormatter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid parameter expression:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    goto :goto_1b

    :cond_3c
    new-instance v2, Lmiui/app/screenelement/util/TextFormatter$ExpressioPara;

    invoke-direct {v2, v1}, Lmiui/app/screenelement/util/TextFormatter$ExpressioPara;-><init>(Lmiui/app/screenelement/data/Expression;)V

    goto :goto_1b
.end method

.method public static buildArray(Ljava/lang/String;)[Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    .registers 10
    .parameter "exp"

    .prologue
    const/4 v7, 0x0

    const/4 v0, 0x0

    .local v0, bracketCount:I
    const/4 v6, 0x0

    .local v6, start:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .local v2, exps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lmiui/app/screenelement/util/TextFormatter$FormatPara;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v3, v8, :cond_39

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .local v1, c:C
    if-nez v0, :cond_29

    const/16 v8, 0x2c

    if-ne v1, v8, :cond_29

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lmiui/app/screenelement/util/TextFormatter$FormatPara;->build(Ljava/lang/String;)Lmiui/app/screenelement/util/TextFormatter$FormatPara;

    move-result-object v4

    .local v4, para:Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    if-nez v4, :cond_24

    .end local v1           #c:C
    :cond_23
    :goto_23
    return-object v7

    .restart local v1       #c:C
    :cond_24
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v3, 0x1

    .end local v4           #para:Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    :cond_29
    const/16 v8, 0x28

    if-ne v1, v8, :cond_32

    add-int/lit8 v0, v0, 0x1

    :cond_2f
    :goto_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_32
    const/16 v8, 0x29

    if-ne v1, v8, :cond_2f

    add-int/lit8 v0, v0, -0x1

    goto :goto_2f

    .end local v1           #c:C
    :cond_39
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lmiui/app/screenelement/util/TextFormatter$FormatPara;->build(Ljava/lang/String;)Lmiui/app/screenelement/util/TextFormatter$FormatPara;

    move-result-object v4

    .restart local v4       #para:Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    if-eqz v4, :cond_23

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v5, v7, [Lmiui/app/screenelement/util/TextFormatter$FormatPara;

    .local v5, ret:[Lmiui/app/screenelement/util/TextFormatter$FormatPara;
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lmiui/app/screenelement/util/TextFormatter$FormatPara;

    goto :goto_23
.end method


# virtual methods
.method public abstract evaluate(Lmiui/app/screenelement/data/Variables;)Ljava/lang/Object;
.end method
