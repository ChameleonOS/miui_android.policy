.class public Lmiui/app/screenelement/LanguageHelper;
.super Ljava/lang/Object;
.source "LanguageHelper.java"


# static fields
.field private static final DEFAULT_STRING_FILE_PATH:Ljava/lang/String; = "strings/strings.xml"

.field private static final LOG_TAG:Ljava/lang/String; = "LanguageHelper"

.field private static final STRING_FILE_PATH:Ljava/lang/String; = "strings/strings.xml"

.field private static final STRING_ROOT_TAG:Ljava/lang/String; = "strings"

.field private static final STRING_TAG:Ljava/lang/String; = "string"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static load(Ljava/util/Locale;Lmiui/app/screenelement/ResourceManager;Lmiui/app/screenelement/data/Variables;)Z
    .registers 12
    .parameter "locale"
    .parameter "resourceManager"
    .parameter "variables"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .local v5, stringFile:Landroid/os/MemoryFile;
    if-eqz p0, :cond_22

    const-string v7, "strings/strings.xml"

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lmiui/app/screenelement/ResourceManager;->getFile(Ljava/lang/String;)Landroid/os/MemoryFile;

    move-result-object v5

    if-nez v5, :cond_22

    const-string v7, "strings/strings.xml"

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lmiui/app/screenelement/ResourceManager;->getFile(Ljava/lang/String;)Landroid/os/MemoryFile;

    move-result-object v5

    :cond_22
    if-nez v5, :cond_34

    const-string v7, "strings/strings.xml"

    invoke-virtual {p1, v7}, Lmiui/app/screenelement/ResourceManager;->getFile(Ljava/lang/String;)Landroid/os/MemoryFile;

    move-result-object v5

    if-nez v5, :cond_34

    const-string v7, "LanguageHelper"

    const-string v8, "no available string resources to load."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_33
    return v6

    :cond_34
    const/4 v1, 0x0

    .local v1, doc:Lorg/w3c/dom/Document;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .local v3, factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_start_39
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .local v0, builder:Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v5}, Landroid/os/MemoryFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .local v4, is:Ljava/io/InputStream;
    invoke-virtual {v0, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_44} :catch_4a

    move-result-object v1

    invoke-static {v1, p2}, Lmiui/app/screenelement/LanguageHelper;->setVariables(Lorg/w3c/dom/Document;Lmiui/app/screenelement/data/Variables;)Z

    move-result v6

    goto :goto_33

    .end local v0           #builder:Ljavax/xml/parsers/DocumentBuilder;
    .end local v4           #is:Ljava/io/InputStream;
    :catch_4a
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    const-string v7, "LanguageHelper"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_33
.end method

.method private static setVariables(Lorg/w3c/dom/Document;Lmiui/app/screenelement/data/Variables;)Z
    .registers 10
    .parameter "doc"
    .parameter "variables"

    .prologue
    const/4 v6, 0x0

    const-string v7, "strings"

    invoke-interface {p0, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .local v2, rootsList:Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, root:Lorg/w3c/dom/Element;
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-gtz v7, :cond_f

    :goto_e
    return v6

    :cond_f
    invoke-interface {v2, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .end local v1           #root:Lorg/w3c/dom/Element;
    check-cast v1, Lorg/w3c/dom/Element;

    .restart local v1       #root:Lorg/w3c/dom/Element;
    const-string v6, "string"

    invoke-interface {v1, v6}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .local v4, stringList:Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1c
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v0, v6, :cond_3f

    invoke-interface {v4, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .local v3, string:Lorg/w3c/dom/Element;
    new-instance v5, Lmiui/app/screenelement/util/IndexedStringVariable;

    const-string v6, "name"

    invoke-interface {v3, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1}, Lmiui/app/screenelement/util/IndexedStringVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    .local v5, stringVar:Lmiui/app/screenelement/util/IndexedStringVariable;
    const-string v6, "value"

    invoke-interface {v3, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .end local v3           #string:Lorg/w3c/dom/Element;
    .end local v5           #stringVar:Lmiui/app/screenelement/util/IndexedStringVariable;
    :cond_3f
    const/4 v6, 0x1

    goto :goto_e
.end method
