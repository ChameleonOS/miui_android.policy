.class public abstract Lmiui/app/screenelement/data/Expression;
.super Ljava/lang/Object;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/data/Expression$1;,
        Lmiui/app/screenelement/data/Expression$FunctionExpression;,
        Lmiui/app/screenelement/data/Expression$BinaryExpression;,
        Lmiui/app/screenelement/data/Expression$UnaryExpression;,
        Lmiui/app/screenelement/data/Expression$StringExpression;,
        Lmiui/app/screenelement/data/Expression$NumberExpression;,
        Lmiui/app/screenelement/data/Expression$StringVariableExpression;,
        Lmiui/app/screenelement/data/Expression$NumberVariableExpression;,
        Lmiui/app/screenelement/data/Expression$VariableExpression;,
        Lmiui/app/screenelement/data/Expression$Tokenizer;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "Expression"

.field private static mOperatorsPriority:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 796
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "+-"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "*/%"

    aput-object v2, v0, v1

    sput-object v0, Lmiui/app/screenelement/data/Expression;->mOperatorsPriority:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 420
    return-void
.end method

.method static synthetic access$000(C)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-static {p0}, Lmiui/app/screenelement/data/Expression;->isVariableChar(C)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(C)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-static {p0}, Lmiui/app/screenelement/data/Expression;->isDigitChar(C)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(C)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 24
    invoke-static {p0}, Lmiui/app/screenelement/data/Expression;->isFunctionChar(C)Z

    move-result v0

    return v0
.end method

.method public static build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;
    .registers 16
    .parameter "exp"

    .prologue
    const/4 v12, 0x0

    .line 690
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_d

    move-object v1, v12

    .line 775
    :cond_c
    :goto_c
    return-object v1

    .line 697
    :cond_d
    new-instance v9, Lmiui/app/screenelement/data/Expression$Tokenizer;

    invoke-direct {v9, p0}, Lmiui/app/screenelement/data/Expression$Tokenizer;-><init>(Ljava/lang/String;)V

    .line 698
    .local v9, tk:Lmiui/app/screenelement/data/Expression$Tokenizer;
    const/4 v10, 0x0

    .line 699
    .local v10, token:Lmiui/app/screenelement/data/Expression$Tokenizer$Token;
    const/4 v8, 0x0

    .line 700
    .local v8, preToken:Lmiui/app/screenelement/data/Expression$Tokenizer$Token;
    new-instance v7, Ljava/util/Stack;

    invoke-direct {v7}, Ljava/util/Stack;-><init>()V

    .line 701
    .local v7, opeStack:Ljava/util/Stack;,"Ljava/util/Stack<Lmiui/app/screenelement/data/Expression$Tokenizer$Token;>;"
    new-instance v3, Ljava/util/Stack;

    invoke-direct {v3}, Ljava/util/Stack;-><init>()V

    .line 702
    .local v3, expStack:Ljava/util/Stack;,"Ljava/util/Stack<Lmiui/app/screenelement/data/Expression;>;"
    const/4 v4, 0x0

    .line 703
    .local v4, minus:Z
    :goto_1f
    invoke-virtual {v9}, Lmiui/app/screenelement/data/Expression$Tokenizer;->getToken()Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    move-result-object v10

    if-eqz v10, :cond_109

    .line 707
    sget-object v11, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    iget-object v13, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->type:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v13}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v13

    aget v11, v11, v13

    packed-switch v11, :pswitch_data_154

    .line 762
    :goto_32
    move-object v8, v10

    goto :goto_1f

    .line 713
    :pswitch_34
    const/4 v5, 0x0

    .line 714
    .local v5, newExp:Lmiui/app/screenelement/data/Expression;
    sget-object v11, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    iget-object v13, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->type:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v13}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v13

    aget v11, v11, v13

    packed-switch v11, :pswitch_data_166

    :cond_42
    move-object v6, v5

    .line 735
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    .local v6, newExp:Lmiui/app/screenelement/data/Expression;
    :goto_43
    if-eqz v4, :cond_151

    .line 736
    new-instance v5, Lmiui/app/screenelement/data/Expression$UnaryExpression;

    const-string v11, "-"

    invoke-direct {v5, v6, v11}, Lmiui/app/screenelement/data/Expression$UnaryExpression;-><init>(Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V

    .line 738
    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    :goto_4c
    invoke-virtual {v3, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_32

    .line 716
    :pswitch_50
    new-instance v5, Lmiui/app/screenelement/data/Expression$NumberVariableExpression;

    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    iget-object v11, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v5, v11}, Lmiui/app/screenelement/data/Expression$NumberVariableExpression;-><init>(Ljava/lang/String;)V

    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    move-object v6, v5

    .line 717
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v6       #newExp:Lmiui/app/screenelement/data/Expression;
    goto :goto_43

    .line 719
    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    :pswitch_59
    new-instance v5, Lmiui/app/screenelement/data/Expression$StringVariableExpression;

    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    iget-object v11, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v5, v11}, Lmiui/app/screenelement/data/Expression$StringVariableExpression;-><init>(Ljava/lang/String;)V

    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    move-object v6, v5

    .line 720
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v6       #newExp:Lmiui/app/screenelement/data/Expression;
    goto :goto_43

    .line 722
    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    :pswitch_62
    new-instance v5, Lmiui/app/screenelement/data/Expression$NumberExpression;

    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v4, :cond_81

    const-string v11, "-"

    :goto_6d
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v13, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v5, v11}, Lmiui/app/screenelement/data/Expression$NumberExpression;-><init>(Ljava/lang/String;)V

    .line 723
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    const/4 v4, 0x0

    move-object v6, v5

    .line 724
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v6       #newExp:Lmiui/app/screenelement/data/Expression;
    goto :goto_43

    .line 722
    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    :cond_81
    const-string v11, ""

    goto :goto_6d

    .line 726
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    :pswitch_84
    new-instance v5, Lmiui/app/screenelement/data/Expression$StringExpression;

    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    iget-object v11, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v5, v11}, Lmiui/app/screenelement/data/Expression$StringExpression;-><init>(Ljava/lang/String;)V

    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    move-object v6, v5

    .line 727
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v6       #newExp:Lmiui/app/screenelement/data/Expression;
    goto :goto_43

    .line 729
    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    :pswitch_8d
    invoke-static {v10, v7}, Lmiui/app/screenelement/data/Expression;->buildBracket(Lmiui/app/screenelement/data/Expression$Tokenizer$Token;Ljava/util/Stack;)Lmiui/app/screenelement/data/Expression;

    move-result-object v5

    .line 730
    if-nez v5, :cond_42

    move-object v1, v12

    .line 731
    goto/16 :goto_c

    .line 741
    .end local v5           #newExp:Lmiui/app/screenelement/data/Expression;
    :pswitch_96
    iget-object v11, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    const-string v13, "-"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c6

    if-eqz v8, :cond_a8

    iget-object v11, v8, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->type:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    sget-object v13, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->OPE:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    if-ne v11, v13, :cond_c6

    .line 743
    :cond_a8
    const/4 v4, 0x1

    goto :goto_32

    .line 750
    :cond_aa
    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/Expression;

    .line 751
    .local v1, exp2:Lmiui/app/screenelement/data/Expression;
    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/data/Expression;

    .line 752
    .local v0, exp1:Lmiui/app/screenelement/data/Expression;
    new-instance v13, Lmiui/app/screenelement/data/Expression$BinaryExpression;

    invoke-virtual {v7}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    iget-object v11, v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v13, v0, v1, v11}, Lmiui/app/screenelement/data/Expression$BinaryExpression;-><init>(Lmiui/app/screenelement/data/Expression;Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V

    invoke-virtual {v3, v13}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    .end local v0           #exp1:Lmiui/app/screenelement/data/Expression;
    .end local v1           #exp2:Lmiui/app/screenelement/data/Expression;
    :cond_c6
    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v11

    if-lez v11, :cond_fe

    iget-object v13, v10, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    iget-object v11, v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-static {v13, v11}, Lmiui/app/screenelement/data/Expression;->cmpOpePri(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    if-gtz v11, :cond_fe

    .line 746
    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v11

    const/4 v13, 0x2

    if-ge v11, v13, :cond_aa

    .line 747
    const-string v11, "Expression"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "fail to buid: invalid operation position:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v12

    .line 748
    goto/16 :goto_c

    .line 754
    :cond_fe
    invoke-virtual {v7, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 755
    const/4 v4, 0x0

    .line 757
    goto/16 :goto_32

    .line 759
    :pswitch_104
    invoke-virtual {v7, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_32

    .line 765
    :cond_109
    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v11

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    if-eq v11, v13, :cond_130

    .line 766
    const-string v11, "Expression"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "fail to buid: invalid expression:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v12

    .line 767
    goto/16 :goto_c

    .line 770
    :cond_130
    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/data/Expression;

    .line 771
    .restart local v1       #exp2:Lmiui/app/screenelement/data/Expression;
    :goto_136
    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v11

    if-lez v11, :cond_c

    .line 772
    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/data/Expression;

    .line 773
    .restart local v0       #exp1:Lmiui/app/screenelement/data/Expression;
    new-instance v2, Lmiui/app/screenelement/data/Expression$BinaryExpression;

    invoke-virtual {v7}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    iget-object v11, v11, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v2, v0, v1, v11}, Lmiui/app/screenelement/data/Expression$BinaryExpression;-><init>(Lmiui/app/screenelement/data/Expression;Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V

    .end local v1           #exp2:Lmiui/app/screenelement/data/Expression;
    .local v2, exp2:Lmiui/app/screenelement/data/Expression;
    move-object v1, v2

    .line 774
    .end local v2           #exp2:Lmiui/app/screenelement/data/Expression;
    .restart local v1       #exp2:Lmiui/app/screenelement/data/Expression;
    goto :goto_136

    .end local v0           #exp1:Lmiui/app/screenelement/data/Expression;
    .end local v1           #exp2:Lmiui/app/screenelement/data/Expression;
    .restart local v6       #newExp:Lmiui/app/screenelement/data/Expression;
    :cond_151
    move-object v5, v6

    .end local v6           #newExp:Lmiui/app/screenelement/data/Expression;
    .restart local v5       #newExp:Lmiui/app/screenelement/data/Expression;
    goto/16 :goto_4c

    .line 707
    :pswitch_data_154
    .packed-switch 0x1
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_96
        :pswitch_104
    .end packed-switch

    .line 714
    :pswitch_data_166
    .packed-switch 0x1
        :pswitch_50
        :pswitch_59
        :pswitch_62
        :pswitch_84
        :pswitch_8d
    .end packed-switch
.end method

.method private static buildBracket(Lmiui/app/screenelement/data/Expression$Tokenizer$Token;Ljava/util/Stack;)Lmiui/app/screenelement/data/Expression;
    .registers 7
    .parameter "token"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/app/screenelement/data/Expression$Tokenizer$Token;",
            "Ljava/util/Stack",
            "<",
            "Lmiui/app/screenelement/data/Expression$Tokenizer$Token;",
            ">;)",
            "Lmiui/app/screenelement/data/Expression;"
        }
    .end annotation

    .prologue
    .line 780
    .local p1, opeStack:Ljava/util/Stack;,"Ljava/util/Stack<Lmiui/app/screenelement/data/Expression$Tokenizer$Token;>;"
    iget-object v2, p0, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-static {v2}, Lmiui/app/screenelement/data/Expression;->buildMultiple(Ljava/lang/String;)[Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    .line 783
    .local v1, newExps:[Lmiui/app/screenelement/data/Expression;
    :try_start_6
    invoke-virtual {p1}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_27

    invoke-virtual {p1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    iget-object v2, v2, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->type:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    sget-object v3, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->FUN:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    if-ne v2, v3, :cond_27

    .line 784
    new-instance v3, Lmiui/app/screenelement/data/Expression$FunctionExpression;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;

    iget-object v2, v2, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-direct {v3, v1, v2}, Lmiui/app/screenelement/data/Expression$FunctionExpression;-><init>([Lmiui/app/screenelement/data/Expression;Ljava/lang/String;)V

    move-object v2, v3

    .line 793
    :goto_26
    return-object v2

    .line 785
    :cond_27
    array-length v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_33

    .line 786
    const/4 v2, 0x0

    aget-object v2, v1, v2
    :try_end_2e
    .catch Lmiui/app/screenelement/ScreenElementLoadException; {:try_start_6 .. :try_end_2e} :catch_2f

    goto :goto_26

    .line 788
    :catch_2f
    move-exception v0

    .line 789
    .local v0, e:Lmiui/app/screenelement/ScreenElementLoadException;
    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementLoadException;->printStackTrace()V

    .line 792
    .end local v0           #e:Lmiui/app/screenelement/ScreenElementLoadException;
    :cond_33
    const-string v2, "Expression"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fail to buid: multiple expressions in brackets, but seems no function presents:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lmiui/app/screenelement/data/Expression$Tokenizer$Token;->token:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 793
    const/4 v2, 0x0

    goto :goto_26
.end method

.method public static buildMultiple(Ljava/lang/String;)[Lmiui/app/screenelement/data/Expression;
    .registers 9
    .parameter "exp"

    .prologue
    .line 664
    const/4 v0, 0x0

    .line 665
    .local v0, bracketCount:I
    const/4 v4, 0x0

    .line 666
    .local v4, inApostrophe:Z
    const/4 v6, 0x0

    .line 667
    .local v6, start:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 668
    .local v2, exps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lmiui/app/screenelement/data/Expression;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v3, v7, :cond_42

    .line 669
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 670
    .local v1, c:C
    if-nez v4, :cond_28

    .line 671
    const/16 v7, 0x2c

    if-ne v1, v7, :cond_32

    if-nez v0, :cond_32

    .line 672
    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    add-int/lit8 v6, v3, 0x1

    .line 680
    :cond_28
    :goto_28
    const/16 v7, 0x27

    if-ne v1, v7, :cond_2f

    .line 681
    if-nez v4, :cond_40

    const/4 v4, 0x1

    .line 668
    :cond_2f
    :goto_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 674
    :cond_32
    const/16 v7, 0x28

    if-ne v1, v7, :cond_39

    .line 675
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    .line 676
    :cond_39
    const/16 v7, 0x29

    if-ne v1, v7, :cond_28

    .line 677
    add-int/lit8 v0, v0, -0x1

    goto :goto_28

    .line 681
    :cond_40
    const/4 v4, 0x0

    goto :goto_2f

    .line 684
    .end local v1           #c:C
    :cond_42
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v5, v7, [Lmiui/app/screenelement/data/Expression;

    .line 686
    .local v5, ret:[Lmiui/app/screenelement/data/Expression;
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lmiui/app/screenelement/data/Expression;

    return-object v7
.end method

.method private static cmpOpePri(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .parameter "op1"
    .parameter "op2"

    .prologue
    .line 801
    invoke-static {p0}, Lmiui/app/screenelement/data/Expression;->getPriority(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1}, Lmiui/app/screenelement/data/Expression;->getPriority(Ljava/lang/String;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private static getPriority(Ljava/lang/String;)I
    .registers 3
    .parameter "op"

    .prologue
    .line 805
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget-object v1, Lmiui/app/screenelement/data/Expression;->mOperatorsPriority:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 806
    sget-object v1, Lmiui/app/screenelement/data/Expression;->mOperatorsPriority:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_11

    .line 809
    .end local v0           #i:I
    :goto_10
    return v0

    .line 805
    .restart local v0       #i:I
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 809
    :cond_14
    const/4 v0, -0x1

    goto :goto_10
.end method

.method private static isDigitChar(C)Z
    .registers 2
    .parameter "c"

    .prologue
    .line 655
    const/16 v0, 0x30

    if-lt p0, v0, :cond_8

    const/16 v0, 0x39

    if-le p0, v0, :cond_c

    :cond_8
    const/16 v0, 0x2e

    if-ne p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static isFunctionChar(C)Z
    .registers 2
    .parameter "c"

    .prologue
    .line 659
    const/16 v0, 0x61

    if-lt p0, v0, :cond_8

    const/16 v0, 0x7a

    if-le p0, v0, :cond_10

    :cond_8
    const/16 v0, 0x41

    if-lt p0, v0, :cond_12

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static isVariableChar(C)Z
    .registers 2
    .parameter "c"

    .prologue
    .line 651
    const/16 v0, 0x61

    if-lt p0, v0, :cond_8

    const/16 v0, 0x7a

    if-le p0, v0, :cond_20

    :cond_8
    const/16 v0, 0x41

    if-lt p0, v0, :cond_10

    const/16 v0, 0x5a

    if-le p0, v0, :cond_20

    :cond_10
    const/16 v0, 0x5f

    if-eq p0, v0, :cond_20

    const/16 v0, 0x2e

    if-eq p0, v0, :cond_20

    const/16 v0, 0x30

    if-lt p0, v0, :cond_22

    const/16 v0, 0x39

    if-gt p0, v0, :cond_22

    :cond_20
    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method


# virtual methods
.method public abstract evaluate(Lmiui/app/screenelement/data/Variables;)D
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 3
    .parameter "var"

    .prologue
    .line 819
    const/4 v0, 0x0

    return-object v0
.end method

.method public isNull(Lmiui/app/screenelement/data/Variables;)Z
    .registers 3
    .parameter "var"

    .prologue
    .line 815
    const/4 v0, 0x0

    return v0
.end method
