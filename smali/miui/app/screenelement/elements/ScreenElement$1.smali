.class synthetic Lmiui/app/screenelement/elements/ScreenElement$1;
.super Ljava/lang/Object;
.source "ScreenElement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/ScreenElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

.field static final synthetic $SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    invoke-static {}, Lmiui/app/screenelement/elements/ScreenElement$Align;->values()[Lmiui/app/screenelement/elements/ScreenElement$Align;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

    :try_start_9
    sget-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$Align;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$Align;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ScreenElement$Align;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_45

    :goto_14
    :try_start_14
    sget-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$Align;->RIGHT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ScreenElement$Align;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_43

    :goto_1f
    invoke-static {}, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->values()[Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I

    :try_start_28
    sget-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I

    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_41

    :goto_33
    :try_start_33
    sget-object v0, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I

    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->BOTTOM:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3f

    :goto_3e
    return-void

    :catch_3f
    move-exception v0

    goto :goto_3e

    :catch_41
    move-exception v0

    goto :goto_33

    :catch_43
    move-exception v0

    goto :goto_1f

    :catch_45
    move-exception v0

    goto :goto_14
.end method
