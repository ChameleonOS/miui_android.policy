.class Lmiui/app/screenelement/data/Expression$Tokenizer;
.super Ljava/lang/Object;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Tokenizer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/data/Expression$Tokenizer$Token;,
        Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;
    }
.end annotation


# instance fields
.field private mPos:I

.field private mString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .parameter "str"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {p0}, Lmiui/app/screenelement/data/Expression$Tokenizer;->reset()V

    return-void
.end method


# virtual methods
.method public getToken()Lmiui/app/screenelement/data/Expression$Tokenizer$Token;
    .registers 13

    .prologue
    const/4 v7, 0x0

    const/16 v11, 0x27

    const/16 v10, 0x23

    const/4 v0, 0x0

    .local v0, bracketCount:I
    const/4 v1, -0x1

    .local v1, bracketStart:I
    iget v4, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    .local v4, i:I
    :goto_9
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v4, v8, :cond_151

    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .local v2, c:C
    if-nez v0, :cond_128

    if-eq v2, v10, :cond_1f

    const/16 v8, 0x40

    if-ne v2, v8, :cond_6f

    :cond_1f
    add-int/lit8 v5, v4, 0x1

    .local v5, j:I
    :goto_21
    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v5, v8, :cond_35

    iget-object v8, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    #calls: Lmiui/app/screenelement/data/Expression;->isVariableChar(C)Z
    invoke-static {v8}, Lmiui/app/screenelement/data/Expression;->access$000(C)Z

    move-result v8

    if-nez v8, :cond_54

    :cond_35
    add-int/lit8 v8, v4, 0x1

    if-ne v5, v8, :cond_57

    const-string v8, "Expression"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "invalid variable name:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v2           #c:C
    .end local v5           #j:I
    :cond_53
    :goto_53
    return-object v7

    .restart local v2       #c:C
    .restart local v5       #j:I
    :cond_54
    add-int/lit8 v5, v5, 0x1

    goto :goto_21

    :cond_57
    iput v5, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v8, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    if-ne v2, v10, :cond_6c

    sget-object v7, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->VAR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    :goto_5f
    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {v9, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v7, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    move-object v7, v8

    goto :goto_53

    :cond_6c
    sget-object v7, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->VARSTR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    goto :goto_5f

    .end local v5           #j:I
    :cond_6f
    #calls: Lmiui/app/screenelement/data/Expression;->isDigitChar(C)Z
    invoke-static {v2}, Lmiui/app/screenelement/data/Expression;->access$100(C)Z

    move-result v8

    if-eqz v8, :cond_9e

    add-int/lit8 v5, v4, 0x1

    .restart local v5       #j:I
    :goto_77
    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v5, v7, :cond_8b

    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    #calls: Lmiui/app/screenelement/data/Expression;->isDigitChar(C)Z
    invoke-static {v7}, Lmiui/app/screenelement/data/Expression;->access$100(C)Z

    move-result v7

    if-nez v7, :cond_9b

    :cond_8b
    iput v5, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v7, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    sget-object v8, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->NUM:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v9, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, p0, v8, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    goto :goto_53

    :cond_9b
    add-int/lit8 v5, v5, 0x1

    goto :goto_77

    .end local v5           #j:I
    :cond_9e
    #calls: Lmiui/app/screenelement/data/Expression;->isFunctionChar(C)Z
    invoke-static {v2}, Lmiui/app/screenelement/data/Expression;->access$200(C)Z

    move-result v8

    if-eqz v8, :cond_cd

    add-int/lit8 v5, v4, 0x1

    .restart local v5       #j:I
    :goto_a6
    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v5, v7, :cond_ba

    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    #calls: Lmiui/app/screenelement/data/Expression;->isFunctionChar(C)Z
    invoke-static {v7}, Lmiui/app/screenelement/data/Expression;->access$200(C)Z

    move-result v7

    if-nez v7, :cond_ca

    :cond_ba
    iput v5, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v7, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    sget-object v8, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->FUN:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v9, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, p0, v8, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    goto :goto_53

    :cond_ca
    add-int/lit8 v5, v5, 0x1

    goto :goto_a6

    .end local v5           #j:I
    :cond_cd
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lmiui/app/screenelement/data/Expression$BinaryExpression;->parseOperator(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    move-result-object v8

    sget-object v9, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->INVALID:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    if-eq v8, v9, :cond_ea

    add-int/lit8 v7, v4, 0x1

    iput v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v7, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    sget-object v8, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->OPE:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, p0, v8, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    goto/16 :goto_53

    :cond_ea
    if-ne v2, v11, :cond_128

    const/4 v6, 0x0

    .local v6, slash:Z
    add-int/lit8 v5, v4, 0x1

    .restart local v5       #j:I
    :goto_ef
    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v5, v7, :cond_101

    iget-object v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .local v3, cc:C
    if-nez v6, :cond_11e

    if-ne v3, v11, :cond_11e

    .end local v3           #cc:C
    :cond_101
    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v7, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    sget-object v8, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->STR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {v9, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\\\'"

    const-string v11, "\'"

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, p0, v8, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    goto/16 :goto_53

    .restart local v3       #cc:C
    :cond_11e
    const/16 v7, 0x5c

    if-ne v3, v7, :cond_126

    const/4 v6, 0x1

    :goto_123
    add-int/lit8 v5, v5, 0x1

    goto :goto_ef

    :cond_126
    const/4 v6, 0x0

    goto :goto_123

    .end local v3           #cc:C
    .end local v5           #j:I
    .end local v6           #slash:Z
    :cond_128
    const/16 v8, 0x28

    if-ne v2, v8, :cond_136

    if-nez v0, :cond_130

    add-int/lit8 v1, v4, 0x1

    :cond_130
    add-int/lit8 v0, v0, 0x1

    :cond_132
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_9

    :cond_136
    const/16 v8, 0x29

    if-ne v2, v8, :cond_132

    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_132

    add-int/lit8 v7, v4, 0x1

    iput v7, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    new-instance v7, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    sget-object v8, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->BRACKET:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    iget-object v9, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v9, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, p0, v8, v9}, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;-><init>(Lmiui/app/screenelement/data/Expression$Tokenizer;Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;Ljava/lang/String;)V

    goto/16 :goto_53

    .end local v2           #c:C
    :cond_151
    if-eqz v0, :cond_53

    const-string v8, "Expression"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mismatched bracket:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mString:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    iput v0, p0, Lmiui/app/screenelement/data/Expression$Tokenizer;->mPos:I

    return-void
.end method
