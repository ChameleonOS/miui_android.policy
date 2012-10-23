.class synthetic Lmiui/app/screenelement/data/Expression$1;
.super Ljava/lang/Object;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/Expression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

.field static final synthetic $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

.field static final synthetic $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

.field static final synthetic $SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 714
    invoke-static {}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->values()[Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    :try_start_9
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->VAR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_25d

    :goto_14
    :try_start_14
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->VARSTR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_25a

    :goto_1f
    :try_start_1f
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->NUM:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_257

    :goto_2a
    :try_start_2a
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->STR:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_254

    :goto_35
    :try_start_35
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->BRACKET:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_251

    :goto_40
    :try_start_40
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->OPE:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_24e

    :goto_4b
    :try_start_4b
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->FUN:Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$Tokenizer$TokenType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_24b

    .line 525
    :goto_56
    invoke-static {}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->values()[Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    :try_start_5f
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_6a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5f .. :try_end_6a} :catch_248

    :goto_6a
    :try_start_6a
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->COS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_75
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6a .. :try_end_75} :catch_245

    :goto_75
    :try_start_75
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->TAN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_80
    .catch Ljava/lang/NoSuchFieldError; {:try_start_75 .. :try_end_80} :catch_242

    :goto_80
    :try_start_80
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ASIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_8b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_80 .. :try_end_8b} :catch_23f

    :goto_8b
    :try_start_8b
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ACOS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_96
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8b .. :try_end_96} :catch_23c

    :goto_96
    :try_start_96
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ATAN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_a1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_96 .. :try_end_a1} :catch_239

    :goto_a1
    :try_start_a1
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SINH:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_ac
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a1 .. :try_end_ac} :catch_236

    :goto_ac
    :try_start_ac
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->COSH:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_b8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_ac .. :try_end_b8} :catch_233

    :goto_b8
    :try_start_b8
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SQRT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_c4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b8 .. :try_end_c4} :catch_230

    :goto_c4
    :try_start_c4
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ABS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_d0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c4 .. :try_end_d0} :catch_22d

    :goto_d0
    :try_start_d0
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LEN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_dc
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d0 .. :try_end_dc} :catch_22a

    :goto_dc
    :try_start_dc
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ROUND:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_e8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_dc .. :try_end_e8} :catch_227

    :goto_e8
    :try_start_e8
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->INT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_f4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e8 .. :try_end_f4} :catch_224

    :goto_f4
    :try_start_f4
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ISNULL:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_100
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f4 .. :try_end_100} :catch_221

    :goto_100
    :try_start_100
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->NOT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_10c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_100 .. :try_end_10c} :catch_21e

    :goto_10c
    :try_start_10c
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->MIN:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_118
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10c .. :try_end_118} :catch_21b

    :goto_118
    :try_start_118
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->MAX:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_124
    .catch Ljava/lang/NoSuchFieldError; {:try_start_118 .. :try_end_124} :catch_218

    :goto_124
    :try_start_124
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->DIGIT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_130
    .catch Ljava/lang/NoSuchFieldError; {:try_start_124 .. :try_end_130} :catch_215

    :goto_130
    :try_start_130
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->EQ:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_13c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_130 .. :try_end_13c} :catch_212

    :goto_13c
    :try_start_13c
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->NE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_148
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13c .. :try_end_148} :catch_20f

    :goto_148
    :try_start_148
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->GE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_154
    .catch Ljava/lang/NoSuchFieldError; {:try_start_148 .. :try_end_154} :catch_20c

    :goto_154
    :try_start_154
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->GT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_160
    .catch Ljava/lang/NoSuchFieldError; {:try_start_154 .. :try_end_160} :catch_209

    :goto_160
    :try_start_160
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_16c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_160 .. :try_end_16c} :catch_206

    :goto_16c
    :try_start_16c
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->LT:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_178
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16c .. :try_end_178} :catch_203

    :goto_178
    :try_start_178
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->IFELSE:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x19

    aput v2, v0, v1
    :try_end_184
    .catch Ljava/lang/NoSuchFieldError; {:try_start_178 .. :try_end_184} :catch_201

    :goto_184
    :try_start_184
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->EQS:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x1a

    aput v2, v0, v1
    :try_end_190
    .catch Ljava/lang/NoSuchFieldError; {:try_start_184 .. :try_end_190} :catch_1ff

    :goto_190
    :try_start_190
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->SUBSTR:Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$FunctionExpression$Fun;->ordinal()I

    move-result v1

    const/16 v2, 0x1b

    aput v2, v0, v1
    :try_end_19c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_190 .. :try_end_19c} :catch_1fd

    .line 367
    :goto_19c
    invoke-static {}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->values()[Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    :try_start_1a5
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ADD:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1b0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a5 .. :try_end_1b0} :catch_1fb

    :goto_1b0
    :try_start_1b0
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MIN:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1bb
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b0 .. :try_end_1bb} :catch_1f9

    :goto_1bb
    :try_start_1bb
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MUL:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_1c6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1bb .. :try_end_1c6} :catch_1f7

    :goto_1c6
    :try_start_1c6
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->DIV:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1d1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c6 .. :try_end_1d1} :catch_1f5

    :goto_1d1
    :try_start_1d1
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->MOD:Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$BinaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1dc
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d1 .. :try_end_1dc} :catch_1f3

    .line 303
    :goto_1dc
    invoke-static {}, Lmiui/app/screenelement/data/Expression$UnaryExpression$Ope;->values()[Lmiui/app/screenelement/data/Expression$UnaryExpression$Ope;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope:[I

    :try_start_1e5
    sget-object v0, Lmiui/app/screenelement/data/Expression$1;->$SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope:[I

    sget-object v1, Lmiui/app/screenelement/data/Expression$UnaryExpression$Ope;->MIN:Lmiui/app/screenelement/data/Expression$UnaryExpression$Ope;

    invoke-virtual {v1}, Lmiui/app/screenelement/data/Expression$UnaryExpression$Ope;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1f0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e5 .. :try_end_1f0} :catch_1f1

    :goto_1f0
    return-void

    :catch_1f1
    move-exception v0

    goto :goto_1f0

    .line 367
    :catch_1f3
    move-exception v0

    goto :goto_1dc

    :catch_1f5
    move-exception v0

    goto :goto_1d1

    :catch_1f7
    move-exception v0

    goto :goto_1c6

    :catch_1f9
    move-exception v0

    goto :goto_1bb

    :catch_1fb
    move-exception v0

    goto :goto_1b0

    .line 525
    :catch_1fd
    move-exception v0

    goto :goto_19c

    :catch_1ff
    move-exception v0

    goto :goto_190

    :catch_201
    move-exception v0

    goto :goto_184

    :catch_203
    move-exception v0

    goto/16 :goto_178

    :catch_206
    move-exception v0

    goto/16 :goto_16c

    :catch_209
    move-exception v0

    goto/16 :goto_160

    :catch_20c
    move-exception v0

    goto/16 :goto_154

    :catch_20f
    move-exception v0

    goto/16 :goto_148

    :catch_212
    move-exception v0

    goto/16 :goto_13c

    :catch_215
    move-exception v0

    goto/16 :goto_130

    :catch_218
    move-exception v0

    goto/16 :goto_124

    :catch_21b
    move-exception v0

    goto/16 :goto_118

    :catch_21e
    move-exception v0

    goto/16 :goto_10c

    :catch_221
    move-exception v0

    goto/16 :goto_100

    :catch_224
    move-exception v0

    goto/16 :goto_f4

    :catch_227
    move-exception v0

    goto/16 :goto_e8

    :catch_22a
    move-exception v0

    goto/16 :goto_dc

    :catch_22d
    move-exception v0

    goto/16 :goto_d0

    :catch_230
    move-exception v0

    goto/16 :goto_c4

    :catch_233
    move-exception v0

    goto/16 :goto_b8

    :catch_236
    move-exception v0

    goto/16 :goto_ac

    :catch_239
    move-exception v0

    goto/16 :goto_a1

    :catch_23c
    move-exception v0

    goto/16 :goto_96

    :catch_23f
    move-exception v0

    goto/16 :goto_8b

    :catch_242
    move-exception v0

    goto/16 :goto_80

    :catch_245
    move-exception v0

    goto/16 :goto_75

    :catch_248
    move-exception v0

    goto/16 :goto_6a

    .line 714
    :catch_24b
    move-exception v0

    goto/16 :goto_56

    :catch_24e
    move-exception v0

    goto/16 :goto_4b

    :catch_251
    move-exception v0

    goto/16 :goto_40

    :catch_254
    move-exception v0

    goto/16 :goto_35

    :catch_257
    move-exception v0

    goto/16 :goto_2a

    :catch_25a
    move-exception v0

    goto/16 :goto_1f

    :catch_25d
    move-exception v0

    goto/16 :goto_14
.end method
