.class public Lmiui/app/screenelement/util/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/util/Utils$XmlTraverseListener;,
        Lmiui/app/screenelement/util/Utils$Point;,
        Lmiui/app/screenelement/util/Utils$GetChildWrapper;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 174
    return-void
.end method

.method public static Dist(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/util/Utils$Point;Z)D
    .registers 11
    .parameter "a"
    .parameter "b"
    .parameter "sqr"

    .prologue
    .line 127
    iget-wide v4, p0, Lmiui/app/screenelement/util/Utils$Point;->x:D

    iget-wide v6, p1, Lmiui/app/screenelement/util/Utils$Point;->x:D

    sub-double v0, v4, v6

    .line 128
    .local v0, x:D
    iget-wide v4, p0, Lmiui/app/screenelement/util/Utils$Point;->y:D

    iget-wide v6, p1, Lmiui/app/screenelement/util/Utils$Point;->y:D

    sub-double v2, v4, v6

    .line 129
    .local v2, y:D
    if-eqz p2, :cond_18

    .line 130
    mul-double v4, v0, v0

    mul-double v6, v2, v2

    add-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    .line 132
    :goto_17
    return-wide v4

    :cond_18
    mul-double v4, v0, v0

    mul-double v6, v2, v2

    add-double/2addr v4, v6

    goto :goto_17
.end method

.method public static addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .parameter "src"
    .parameter "suffix"

    .prologue
    .line 165
    const-string v0, "_"

    invoke-static {p0, v0, p1}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .parameter "src"
    .parameter "separator"
    .parameter "suffix"

    .prologue
    .line 159
    const/16 v2, 0x2e

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 160
    .local v0, dot:I
    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .local v1, sb:Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static asserts(Z)V
    .registers 2
    .parameter "t"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 16
    const-string v0, "assert error"

    invoke-static {p0, v0}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 17
    return-void
.end method

.method public static asserts(ZLjava/lang/String;)V
    .registers 3
    .parameter "t"
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 20
    if-nez p0, :cond_8

    .line 21
    new-instance v0, Lmiui/app/screenelement/ScreenElementLoadException;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_8
    return-void
.end method

.method public static doubleToString(D)Ljava/lang/String;
    .registers 5
    .parameter "value"

    .prologue
    .line 170
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, str:Ljava/lang/String;
    const-string v1, ".0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .end local v0           #str:Ljava/lang/String;
    :cond_17
    return-object v0
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .parameter "a"
    .parameter "b"

    .prologue
    .line 136
    if-eq p0, p1, :cond_c

    if-nez p0, :cond_6

    :cond_4
    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_c
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public static getAttrAsFloat(Lorg/w3c/dom/Element;Ljava/lang/String;F)F
    .registers 5
    .parameter "ele"
    .parameter "name"
    .parameter "def"

    .prologue
    .line 62
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result p2

    .line 64
    .end local p2
    :goto_8
    return p2

    .line 63
    .restart local p2
    :catch_9
    move-exception v0

    .line 64
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_8
.end method

.method public static getAttrAsFloatThrows(Lorg/w3c/dom/Element;Ljava/lang/String;)F
    .registers 8
    .parameter "ele"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 70
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v1

    return v1

    .line 71
    :catch_9
    move-exception v0

    .line 72
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v1, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v2, "fail to get attribute name: %s of Element %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I
    .registers 5
    .parameter "ele"
    .parameter "name"
    .parameter "def"

    .prologue
    .line 27
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result p2

    .line 29
    .end local p2
    :goto_8
    return p2

    .line 28
    .restart local p2
    :catch_9
    move-exception v0

    .line 29
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_8
.end method

.method public static getAttrAsIntThrows(Lorg/w3c/dom/Element;Ljava/lang/String;)I
    .registers 8
    .parameter "ele"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 35
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v1

    return v1

    .line 36
    :catch_9
    move-exception v0

    .line 37
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v1, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v2, "fail to get attribute name: %s of Element %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getAttrAsLong(Lorg/w3c/dom/Element;Ljava/lang/String;J)J
    .registers 6
    .parameter "ele"
    .parameter "name"
    .parameter "def"

    .prologue
    .line 45
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-wide p2

    .line 47
    .end local p2
    :goto_8
    return-wide p2

    .line 46
    .restart local p2
    :catch_9
    move-exception v0

    .line 47
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_8
.end method

.method public static getAttrAsLongThrows(Lorg/w3c/dom/Element;Ljava/lang/String;)J
    .registers 8
    .parameter "ele"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 53
    :try_start_0
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-wide v1

    return-wide v1

    .line 54
    :catch_9
    move-exception v0

    .line 55
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v1, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v2, "fail to get attribute name: %s of Element %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 8
    .parameter "ele"
    .parameter "name"

    .prologue
    const/4 v3, 0x0

    .line 95
    if-nez p0, :cond_5

    move-object v1, v3

    .line 105
    :goto_4
    return-object v1

    .line 98
    :cond_5
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 99
    .local v2, nl:Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_a
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v0, v4, :cond_2b

    .line 100
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 101
    .local v1, item:Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_28

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 102
    check-cast v1, Lorg/w3c/dom/Element;

    goto :goto_4

    .line 99
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .end local v1           #item:Lorg/w3c/dom/Node;
    :cond_2b
    move-object v1, v3

    .line 105
    goto :goto_4
.end method

.method public static getVariableNumber(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)D
    .registers 6
    .parameter "object"
    .parameter "property"
    .parameter "vars"

    .prologue
    .line 232
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-direct {v0, p0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    .line 233
    .local v0, tmp:Lmiui/app/screenelement/util/IndexedNumberVariable;
    invoke-virtual {v0}, Lmiui/app/screenelement/util/IndexedNumberVariable;->get()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    return-wide v1
.end method

.method public static getVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)D
    .registers 4
    .parameter "property"
    .parameter "vars"

    .prologue
    .line 228
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lmiui/app/screenelement/util/Utils;->getVariableNumber(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    return-wide v0
.end method

.method public static getVariableString(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 5
    .parameter "object"
    .parameter "property"
    .parameter "vars"

    .prologue
    .line 223
    new-instance v0, Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-direct {v0, p0, p1, p2}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    .line 224
    .local v0, tmp:Lmiui/app/screenelement/util/IndexedStringVariable;
    invoke-virtual {v0}, Lmiui/app/screenelement/util/IndexedStringVariable;->get()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getVariableString(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;
    .registers 3
    .parameter "property"
    .parameter "vars"

    .prologue
    .line 219
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lmiui/app/screenelement/util/Utils;->getVariableString(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static mixAlpha(II)I
    .registers 4
    .parameter "a1"
    .parameter "a2"

    .prologue
    const/16 v0, 0xff

    .line 190
    if-lt p0, v0, :cond_5

    .line 195
    .end local p1
    :goto_4
    return p1

    .line 192
    .restart local p1
    :cond_5
    if-lt p1, v0, :cond_9

    move p1, p0

    .line 193
    goto :goto_4

    .line 195
    :cond_9
    mul-int v0, p0, p1

    int-to-float v0, v0

    const/high16 v1, 0x437f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    goto :goto_4
.end method

.method public static pointProjectionOnSegment(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/util/Utils$Point;Z)Lmiui/app/screenelement/util/Utils$Point;
    .registers 15
    .parameter "a"
    .parameter "b"
    .parameter "c"
    .parameter "nearestEnd"

    .prologue
    .line 143
    invoke-virtual {p1, p0}, Lmiui/app/screenelement/util/Utils$Point;->minus(Lmiui/app/screenelement/util/Utils$Point;)Lmiui/app/screenelement/util/Utils$Point;

    move-result-object v0

    .line 144
    .local v0, AB:Lmiui/app/screenelement/util/Utils$Point;
    invoke-virtual {p2, p0}, Lmiui/app/screenelement/util/Utils$Point;->minus(Lmiui/app/screenelement/util/Utils$Point;)Lmiui/app/screenelement/util/Utils$Point;

    move-result-object v1

    .line 145
    .local v1, AC:Lmiui/app/screenelement/util/Utils$Point;
    iget-wide v5, v0, Lmiui/app/screenelement/util/Utils$Point;->x:D

    iget-wide v7, v1, Lmiui/app/screenelement/util/Utils$Point;->x:D

    mul-double/2addr v5, v7

    iget-wide v7, v0, Lmiui/app/screenelement/util/Utils$Point;->y:D

    iget-wide v9, v1, Lmiui/app/screenelement/util/Utils$Point;->y:D

    mul-double/2addr v7, v9

    add-double v3, v5, v7

    .line 146
    .local v3, r:D
    const/4 v5, 0x0

    invoke-static {p0, p1, v5}, Lmiui/app/screenelement/util/Utils;->Dist(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/util/Utils$Point;Z)D

    move-result-wide v5

    div-double/2addr v3, v5

    .line 147
    const-wide/16 v5, 0x0

    cmpg-double v5, v3, v5

    if-ltz v5, :cond_26

    const-wide/high16 v5, 0x3ff0

    cmpl-double v5, v3, v5

    if-lez v5, :cond_33

    .line 148
    :cond_26
    if-nez p3, :cond_2b

    const/4 p0, 0x0

    .end local p0
    :cond_29
    :goto_29
    move-object v2, p0

    .line 154
    :goto_2a
    return-object v2

    .line 148
    .restart local p0
    :cond_2b
    const-wide/16 v5, 0x0

    cmpg-double v5, v3, v5

    if-ltz v5, :cond_29

    move-object p0, p1

    goto :goto_29

    .line 150
    :cond_33
    move-object v2, v0

    .line 151
    .local v2, D:Lmiui/app/screenelement/util/Utils$Point;
    iget-wide v5, v2, Lmiui/app/screenelement/util/Utils$Point;->x:D

    mul-double/2addr v5, v3

    iput-wide v5, v2, Lmiui/app/screenelement/util/Utils$Point;->x:D

    .line 152
    iget-wide v5, v2, Lmiui/app/screenelement/util/Utils$Point;->y:D

    mul-double/2addr v5, v3

    iput-wide v5, v2, Lmiui/app/screenelement/util/Utils$Point;->y:D

    .line 153
    invoke-virtual {v2, p0}, Lmiui/app/screenelement/util/Utils$Point;->Offset(Lmiui/app/screenelement/util/Utils$Point;)V

    goto :goto_2a
.end method

.method public static putVariableNumber(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V
    .registers 5
    .parameter "object"
    .parameter "property"
    .parameter "vars"
    .parameter "value"

    .prologue
    .line 214
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-direct {v0, p0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    .line 215
    .local v0, tmp:Lmiui/app/screenelement/util/IndexedNumberVariable;
    invoke-virtual {v0, p3}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(Ljava/lang/Double;)V

    .line 216
    return-void
.end method

.method public static putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V
    .registers 4
    .parameter "property"
    .parameter "vars"
    .parameter "value"

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 211
    return-void
.end method

.method public static putVariableString(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/String;)V
    .registers 5
    .parameter "object"
    .parameter "property"
    .parameter "vars"
    .parameter "str"

    .prologue
    .line 205
    new-instance v0, Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-direct {v0, p0, p1, p2}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    .line 206
    .local v0, tmp:Lmiui/app/screenelement/util/IndexedStringVariable;
    invoke-virtual {v0, p3}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public static putVariableString(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/String;)V
    .registers 4
    .parameter "property"
    .parameter "vars"
    .parameter "str"

    .prologue
    .line 201
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lmiui/app/screenelement/util/Utils;->putVariableString(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public static traverseXmlElementChildren(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/util/Utils$XmlTraverseListener;)V
    .registers 8
    .parameter "parent"
    .parameter "tag"
    .parameter "l"

    .prologue
    .line 179
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 180
    .local v0, children:Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_5
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_2a

    .line 181
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 182
    .local v2, node:Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_27

    if-eqz p1, :cond_22

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 184
    :cond_22
    check-cast v2, Lorg/w3c/dom/Element;

    .end local v2           #node:Lorg/w3c/dom/Node;
    invoke-interface {p2, v2}, Lmiui/app/screenelement/util/Utils$XmlTraverseListener;->onChild(Lorg/w3c/dom/Element;)V

    .line 180
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 187
    :cond_2a
    return-void
.end method
