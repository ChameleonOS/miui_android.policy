.class Lmiui/app/screenelement/elements/VariableArrayElement$Item;
.super Ljava/lang/Object;
.source "VariableArrayElement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/VariableArrayElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Item"
.end annotation


# instance fields
.field public mExpression:Lmiui/app/screenelement/data/Expression;

.field public mNumValue:D

.field public mStrValue:Ljava/lang/String;

.field final synthetic this$0:Lmiui/app/screenelement/elements/VariableArrayElement;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/elements/VariableArrayElement;Lorg/w3c/dom/Element;)V
    .registers 5
    .parameter
    .parameter "ele"

    .prologue
    .line 122
    iput-object p1, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->this$0:Lmiui/app/screenelement/elements/VariableArrayElement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 123
    if-eqz p2, :cond_29

    .line 124
    const-string v0, "expression"

    invoke-interface {p2, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    .line 125
    const-string v0, "value"

    invoke-interface {p2, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mStrValue:Ljava/lang/String;

    .line 126
    #getter for: Lmiui/app/screenelement/elements/VariableArrayElement;->mIsStringType:Z
    invoke-static {p1}, Lmiui/app/screenelement/elements/VariableArrayElement;->access$000(Lmiui/app/screenelement/elements/VariableArrayElement;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 128
    :try_start_21
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mStrValue:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mNumValue:D
    :try_end_29
    .catch Ljava/lang/NumberFormatException; {:try_start_21 .. :try_end_29} :catch_2a

    .line 133
    :cond_29
    :goto_29
    return-void

    .line 129
    :catch_2a
    move-exception v0

    goto :goto_29
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)Ljava/lang/Double;
    .registers 4
    .parameter "vars"

    .prologue
    .line 146
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v0, :cond_19

    .line 147
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    .line 149
    :goto_d
    return-object v0

    .line 147
    :cond_e
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_d

    .line 149
    :cond_19
    iget-wide v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mNumValue:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_d
.end method

.method public evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 3
    .parameter "vars"

    .prologue
    .line 140
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v0, :cond_b

    .line 141
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v0

    .line 142
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mStrValue:Ljava/lang/String;

    goto :goto_a
.end method

.method public isExpression()Z
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$Item;->mExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
