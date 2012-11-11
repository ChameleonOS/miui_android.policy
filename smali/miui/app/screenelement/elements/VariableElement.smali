.class public Lmiui/app/screenelement/elements/VariableElement;
.super Lmiui/app/screenelement/elements/ScreenElement;
.source "VariableElement.java"


# static fields
.field private static final OLD_VALUE:Ljava/lang/String; = "old_value"

.field public static final TAG_NAME:Ljava/lang/String; = "Var"


# instance fields
.field private mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

.field private mConst:Z

.field private mExpression:Lmiui/app/screenelement/data/Expression;

.field private mIsStringType:Z

.field private mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mOldNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mOldStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

.field private mOldValue:Ljava/lang/Double;

.field private mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

.field private mThreshold:D

.field private mTrigger:Lmiui/app/screenelement/CommandTrigger;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 11
    .parameter "ele"
    .parameter "c"
    .parameter "root"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 44
    const/4 v3, 0x0

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    .line 56
    if-eqz p1, :cond_79

    .line 57
    const-string v3, "expression"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v3

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    .line 58
    const-string v3, "threshold"

    const/high16 v4, 0x3f80

    invoke-static {p1, v3, v4}, Lmiui/app/screenelement/util/Utils;->getAttrAsFloat(Lorg/w3c/dom/Element;Ljava/lang/String;F)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    iput-wide v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mThreshold:D

    .line 59
    const-string v3, "string"

    const-string v4, "type"

    invoke-interface {p1, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mIsStringType:Z

    .line 60
    const-string v3, "const"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mConst:Z

    .line 61
    iget-boolean v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mIsStringType:Z

    if-eqz v3, :cond_7a

    .line 62
    new-instance v3, Lmiui/app/screenelement/util/IndexedStringVariable;

    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    iget-object v5, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    .line 63
    new-instance v3, Lmiui/app/screenelement/util/IndexedStringVariable;

    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v5, "old_value"

    iget-object v6, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v3, v4, v5, v6}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    .line 69
    :goto_59
    const-string v3, "VariableAnimation"

    invoke-static {p1, v3}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 70
    .local v0, ani:Lorg/w3c/dom/Element;
    if-eqz v0, :cond_68

    .line 72
    :try_start_61
    new-instance v3, Lmiui/app/screenelement/animation/VariableAnimation;

    invoke-direct {v3, v0, p2}, Lmiui/app/screenelement/animation/VariableAnimation;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;
    :try_end_68
    .catch Lmiui/app/screenelement/ScreenElementLoadException; {:try_start_61 .. :try_end_68} :catch_93

    .line 79
    :cond_68
    :goto_68
    const-string v3, "Trigger"

    invoke-static {p1, v3}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 80
    .local v2, trigger:Lorg/w3c/dom/Element;
    if-eqz v2, :cond_79

    .line 82
    :try_start_70
    new-instance v3, Lmiui/app/screenelement/CommandTrigger;

    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v3, v4, v2, p3}, Lmiui/app/screenelement/CommandTrigger;-><init>(Lmiui/app/screenelement/ScreenContext;Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mTrigger:Lmiui/app/screenelement/CommandTrigger;
    :try_end_79
    .catch Lmiui/app/screenelement/ScreenElementLoadException; {:try_start_70 .. :try_end_79} :catch_98

    .line 88
    .end local v0           #ani:Lorg/w3c/dom/Element;
    .end local v2           #trigger:Lorg/w3c/dom/Element;
    :cond_79
    :goto_79
    return-void

    .line 65
    :cond_7a
    new-instance v3, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    iget-object v5, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 66
    new-instance v3, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v5, "old_value"

    iget-object v6, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v3, v4, v5, v6}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v3, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    goto :goto_59

    .line 73
    .restart local v0       #ani:Lorg/w3c/dom/Element;
    :catch_93
    move-exception v1

    .line 74
    .local v1, e:Lmiui/app/screenelement/ScreenElementLoadException;
    invoke-virtual {v1}, Lmiui/app/screenelement/ScreenElementLoadException;->printStackTrace()V

    goto :goto_68

    .line 83
    .end local v1           #e:Lmiui/app/screenelement/ScreenElementLoadException;
    .restart local v2       #trigger:Lorg/w3c/dom/Element;
    :catch_98
    move-exception v1

    .line 84
    .restart local v1       #e:Lmiui/app/screenelement/ScreenElementLoadException;
    invoke-virtual {v1}, Lmiui/app/screenelement/ScreenElementLoadException;->printStackTrace()V

    goto :goto_79
.end method

.method private update()V
    .registers 9

    .prologue
    .line 122
    iget-object v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v4, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    .line 123
    .local v3, var:Lmiui/app/screenelement/data/Variables;
    iget-boolean v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mIsStringType:Z

    if-eqz v4, :cond_33

    .line 124
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    if-nez v4, :cond_d

    .line 155
    :cond_c
    :goto_c
    return-void

    .line 126
    :cond_d
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v4, v3}, Lmiui/app/screenelement/data/Expression;->evaluateStr(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v1

    .line 127
    .local v1, str:Ljava/lang/String;
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v4}, Lmiui/app/screenelement/util/IndexedStringVariable;->get()Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, oldStr:Ljava/lang/String;
    invoke-static {v1, v0}, Lmiui/app/screenelement/util/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 129
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v4, v0}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    .line 130
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v4, v1}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    .line 131
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mTrigger:Lmiui/app/screenelement/CommandTrigger;

    if-eqz v4, :cond_c

    .line 132
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mTrigger:Lmiui/app/screenelement/CommandTrigger;

    invoke-virtual {v4}, Lmiui/app/screenelement/CommandTrigger;->perform()V

    goto :goto_c

    .line 136
    .end local v0           #oldStr:Ljava/lang/String;
    .end local v1           #str:Ljava/lang/String;
    :cond_33
    const/4 v2, 0x0

    .line 137
    .local v2, value:Ljava/lang/Double;
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    if-eqz v4, :cond_7f

    .line 138
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    invoke-virtual {v4}, Lmiui/app/screenelement/animation/VariableAnimation;->getValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 142
    :cond_42
    :goto_42
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v4, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(Ljava/lang/Double;)V

    .line 144
    if-eqz v2, :cond_c

    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    invoke-virtual {v2, v4}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 145
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    if-nez v4, :cond_57

    .line 146
    iput-object v2, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    .line 148
    :cond_57
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v5, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    invoke-virtual {v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(Ljava/lang/Double;)V

    .line 149
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mTrigger:Lmiui/app/screenelement/CommandTrigger;

    if-eqz v4, :cond_7c

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    iget-object v6, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    sub-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    iget-wide v6, p0, Lmiui/app/screenelement/elements/VariableElement;->mThreshold:D

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_7c

    .line 150
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mTrigger:Lmiui/app/screenelement/CommandTrigger;

    invoke-virtual {v4}, Lmiui/app/screenelement/CommandTrigger;->perform()V

    .line 152
    :cond_7c
    iput-object v2, p0, Lmiui/app/screenelement/elements/VariableElement;->mOldValue:Ljava/lang/Double;

    goto :goto_c

    .line 139
    :cond_7f
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v4, :cond_42

    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v4, v3}, Lmiui/app/screenelement/data/Expression;->isNull(Lmiui/app/screenelement/data/Variables;)Z

    move-result v4

    if-nez v4, :cond_42

    .line 140
    iget-object v4, p0, Lmiui/app/screenelement/elements/VariableElement;->mExpression:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v4, v3}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    goto :goto_42
.end method


# virtual methods
.method public doRender(Landroid/graphics/Canvas;)V
    .registers 2
    .parameter "c"

    .prologue
    .line 93
    return-void
.end method

.method public init()V
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    if-eqz v0, :cond_9

    .line 110
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/VariableAnimation;->init()V

    .line 111
    :cond_9
    invoke-direct {p0}, Lmiui/app/screenelement/elements/VariableElement;->update()V

    .line 112
    return-void
.end method

.method public reset(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 115
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    if-eqz v0, :cond_9

    .line 116
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/animation/VariableAnimation;->reset(J)V

    .line 117
    :cond_9
    invoke-direct {p0}, Lmiui/app/screenelement/elements/VariableElement;->update()V

    .line 118
    return-void
.end method

.method public tick(J)V
    .registers 4
    .parameter "currentTime"

    .prologue
    .line 97
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    .line 98
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-nez v0, :cond_8

    .line 106
    :cond_7
    :goto_7
    return-void

    .line 101
    :cond_8
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    if-eqz v0, :cond_11

    .line 102
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mAnimation:Lmiui/app/screenelement/animation/VariableAnimation;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/animation/VariableAnimation;->tick(J)V

    .line 104
    :cond_11
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/VariableElement;->mConst:Z

    if-nez v0, :cond_7

    .line 105
    invoke-direct {p0}, Lmiui/app/screenelement/elements/VariableElement;->update()V

    goto :goto_7
.end method
