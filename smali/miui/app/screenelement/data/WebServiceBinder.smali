.class public Lmiui/app/screenelement/data/WebServiceBinder;
.super Ljava/lang/Object;
.source "WebServiceBinder.java"

# interfaces
.implements Lmiui/app/screenelement/data/VariableBinder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;,
        Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "WebServiceBinder"

.field private static final PREF_LAST_QUERY_TIME:Ljava/lang/String; = "LastQueryTime"

.field public static final TAG_NAME:Ljava/lang/String; = "WebServiceBinder"


# instance fields
.field private mContext:Lmiui/app/screenelement/ScreenContext;

.field private mLastQueryTime:J

.field protected mName:Ljava/lang/String;

.field private mParamsFormatter:Lmiui/app/screenelement/util/TextFormatter;

.field private mQueryInProgress:Z

.field private mQuerySuccessful:Z

.field private mQueryThread:Ljava/lang/Thread;

.field private mUpdateInterval:I

.field private mUpdateIntervalFail:I

.field protected mUriFormatter:Lmiui/app/screenelement/util/TextFormatter;

.field private mVariables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/data/WebServiceBinder$Variable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V
    .registers 5
    .parameter "node"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 131
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mVariables:Ljava/util/ArrayList;

    .line 66
    iput v1, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateInterval:I

    .line 68
    iput v1, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateIntervalFail:I

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQuerySuccessful:Z

    .line 132
    iput-object p2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;

    .line 133
    invoke-direct {p0, p1}, Lmiui/app/screenelement/data/WebServiceBinder;->load(Lorg/w3c/dom/Element;)V

    .line 134
    return-void
.end method

.method static synthetic access$000(Lmiui/app/screenelement/data/WebServiceBinder;)Lmiui/app/screenelement/ScreenContext;
    .registers 2
    .parameter "x0"

    .prologue
    .line 47
    iget-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-object v0
.end method

.method static synthetic access$100(Lmiui/app/screenelement/data/WebServiceBinder;)Lmiui/app/screenelement/util/TextFormatter;
    .registers 2
    .parameter "x0"

    .prologue
    .line 47
    iget-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mParamsFormatter:Lmiui/app/screenelement/util/TextFormatter;

    return-object v0
.end method

.method static synthetic access$200(Lmiui/app/screenelement/data/WebServiceBinder;Ljava/lang/String;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lmiui/app/screenelement/data/WebServiceBinder;->onQueryComplete(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$302(Lmiui/app/screenelement/data/WebServiceBinder;J)J
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    iput-wide p1, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    return-wide p1
.end method

.method static synthetic access$402(Lmiui/app/screenelement/data/WebServiceBinder;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    iput-boolean p1, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQueryInProgress:Z

    return p1
.end method

.method private load(Lorg/w3c/dom/Element;)V
    .registers 7
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 200
    if-nez p1, :cond_12

    .line 201
    const-string v0, "WebServiceBinder"

    const-string v1, "WebServiceBinder node is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    new-instance v0, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v1, "node is null"

    invoke-direct {v0, v1}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 204
    :cond_12
    const-string v0, "name"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    .line 205
    new-instance v0, Lmiui/app/screenelement/util/TextFormatter;

    const-string v1, "uri"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "uriFormat"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "uriParas"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/TextFormatter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUriFormatter:Lmiui/app/screenelement/util/TextFormatter;

    .line 207
    new-instance v0, Lmiui/app/screenelement/util/TextFormatter;

    const-string v1, "params"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "paramsFormat"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "paramsParas"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/TextFormatter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mParamsFormatter:Lmiui/app/screenelement/util/TextFormatter;

    .line 209
    const-string v0, "updateInterval"

    invoke-static {p1, v0, v4}, Lmiui/app/screenelement/util/Utils;->getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateInterval:I

    .line 210
    const-string v0, "updateIntervalFail"

    invoke-static {p1, v0, v4}, Lmiui/app/screenelement/util/Utils;->getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateIntervalFail:I

    .line 212
    invoke-direct {p0, p1}, Lmiui/app/screenelement/data/WebServiceBinder;->loadVariables(Lorg/w3c/dom/Element;)V

    .line 213
    return-void
.end method

.method private loadVariables(Lorg/w3c/dom/Element;)V
    .registers 7
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 216
    const-string v3, "Variable"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 217
    .local v2, variables:Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_7
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_22

    .line 218
    new-instance v1, Lmiui/app/screenelement/data/WebServiceBinder$Variable;

    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    iget-object v4, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v4, v4, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v1, v3, v4}, Lmiui/app/screenelement/data/WebServiceBinder$Variable;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/data/Variables;)V

    .line 219
    .local v1, v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    invoke-virtual {p0, v1}, Lmiui/app/screenelement/data/WebServiceBinder;->addVariable(Lmiui/app/screenelement/data/WebServiceBinder$Variable;)V

    .line 217
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 221
    .end local v1           #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    :cond_22
    return-void
.end method

.method private onQueryComplete(Ljava/lang/String;)V
    .registers 15
    .parameter "result"

    .prologue
    .line 237
    if-eqz p1, :cond_88

    .line 238
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v10

    invoke-virtual {v10}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v9

    .line 239
    .local v9, xpath:Ljavax/xml/xpath/XPath;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 240
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v5, 0x0

    .line 242
    .local v5, is:Ljava/io/InputStream;
    :try_start_f
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 243
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    new-instance v6, Ljava/io/ByteArrayInputStream;

    const-string v10, "utf-8"

    invoke-virtual {p1, v10}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1e
    .catchall {:try_start_f .. :try_end_1e} :catchall_126
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_f .. :try_end_1e} :catch_140
    .catch Lorg/xml/sax/SAXException; {:try_start_f .. :try_end_1e} :catch_13e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_f .. :try_end_1e} :catch_ec
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_1e} :catch_fe
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_1e} :catch_112

    .line 244
    .end local v5           #is:Ljava/io/InputStream;
    .local v6, is:Ljava/io/InputStream;
    :try_start_1e
    invoke-virtual {v0, v6}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 245
    .local v2, doc:Lorg/w3c/dom/Document;
    iget-object v10, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_28
    :goto_28
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_e1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;

    .line 246
    .local v7, v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;
    :try_end_36
    .catchall {:try_start_1e .. :try_end_36} :catchall_132
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1e .. :try_end_36} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_1e .. :try_end_36} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1e .. :try_end_36} :catch_13b
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_36} :catch_138
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_36} :catch_135

    if-eqz v10, :cond_89

    .line 248
    :try_start_38
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mXPath:Ljava/lang/String;

    sget-object v11, Ljavax/xml/xpath/XPathConstants;->STRING:Ljavax/xml/namespace/QName;

    invoke-interface {v9, v10, v2, v11}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 249
    .local v8, value:Ljava/lang/String;
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v10, v8}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V
    :try_end_47
    .catchall {:try_start_38 .. :try_end_47} :catchall_132
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_38 .. :try_end_47} :catch_48
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_38 .. :try_end_47} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_38 .. :try_end_47} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_38 .. :try_end_47} :catch_13b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_47} :catch_138
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_47} :catch_135

    goto :goto_28

    .line 250
    .end local v8           #value:Ljava/lang/String;
    :catch_48
    move-exception v3

    .line 251
    .local v3, e:Ljavax/xml/xpath/XPathExpressionException;
    :try_start_49
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    .line 252
    const-string v10, "WebServiceBinder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "fail to get variable: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Ljavax/xml/xpath/XPathExpressionException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_77
    .catchall {:try_start_49 .. :try_end_77} :catchall_132
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_49 .. :try_end_77} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_49 .. :try_end_77} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_49 .. :try_end_77} :catch_13b
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_77} :catch_138
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_77} :catch_135

    goto :goto_28

    .line 265
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v3           #e:Ljavax/xml/xpath/XPathExpressionException;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v7           #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    :catch_78
    move-exception v3

    move-object v5, v6

    .line 266
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v6           #is:Ljava/io/InputStream;
    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v5       #is:Ljava/io/InputStream;
    :goto_7a
    :try_start_7a
    const-string v10, "WebServiceBinder"

    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_83
    .catchall {:try_start_7a .. :try_end_83} :catchall_126

    .line 277
    if-eqz v5, :cond_88

    .line 278
    :try_start_85
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_88} :catch_12d

    .line 283
    .end local v1           #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    .end local v5           #is:Ljava/io/InputStream;
    .end local v9           #xpath:Ljavax/xml/xpath/XPath;
    :cond_88
    :goto_88
    return-void

    .line 254
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v1       #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v6       #is:Ljava/io/InputStream;
    .restart local v7       #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    .restart local v9       #xpath:Ljavax/xml/xpath/XPath;
    :cond_89
    :try_start_89
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;
    :try_end_8b
    .catchall {:try_start_89 .. :try_end_8b} :catchall_132
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_89 .. :try_end_8b} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_89 .. :try_end_8b} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_89 .. :try_end_8b} :catch_13b
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_8b} :catch_138
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_8b} :catch_135

    if-eqz v10, :cond_28

    .line 256
    :try_start_8d
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mXPath:Ljava/lang/String;

    sget-object v11, Ljavax/xml/xpath/XPathConstants;->NUMBER:Ljavax/xml/namespace/QName;

    invoke-interface {v9, v10, v2, v11}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    .line 257
    .local v8, value:Ljava/lang/Double;
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v10, v8}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(Ljava/lang/Double;)V
    :try_end_9c
    .catchall {:try_start_8d .. :try_end_9c} :catchall_132
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_8d .. :try_end_9c} :catch_9d
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_8d .. :try_end_9c} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_8d .. :try_end_9c} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8d .. :try_end_9c} :catch_13b
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_9c} :catch_138
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_9c} :catch_135

    goto :goto_28

    .line 258
    .end local v8           #value:Ljava/lang/Double;
    :catch_9d
    move-exception v3

    .line 259
    .local v3, e:Ljavax/xml/xpath/XPathExpressionException;
    :try_start_9e
    iget-object v10, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(Ljava/lang/Double;)V

    .line 260
    const-string v10, "WebServiceBinder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "fail to get variable: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v7, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Ljavax/xml/xpath/XPathExpressionException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_cc
    .catchall {:try_start_9e .. :try_end_cc} :catchall_132
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_9e .. :try_end_cc} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_9e .. :try_end_cc} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_9e .. :try_end_cc} :catch_13b
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_cc} :catch_138
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_cc} :catch_135

    goto/16 :goto_28

    .line 267
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v3           #e:Ljavax/xml/xpath/XPathExpressionException;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v7           #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    :catch_ce
    move-exception v3

    move-object v5, v6

    .line 268
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v6           #is:Ljava/io/InputStream;
    .local v3, e:Lorg/xml/sax/SAXException;
    .restart local v5       #is:Ljava/io/InputStream;
    :goto_d0
    :try_start_d0
    const-string v10, "WebServiceBinder"

    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d9
    .catchall {:try_start_d0 .. :try_end_d9} :catchall_126

    .line 277
    if-eqz v5, :cond_88

    .line 278
    :try_start_db
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_de} :catch_df

    goto :goto_88

    .line 279
    :catch_df
    move-exception v10

    goto :goto_88

    .line 264
    .end local v3           #e:Lorg/xml/sax/SAXException;
    .end local v5           #is:Ljava/io/InputStream;
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v6       #is:Ljava/io/InputStream;
    :cond_e1
    const/4 v10, 0x1

    :try_start_e2
    iput-boolean v10, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQuerySuccessful:Z
    :try_end_e4
    .catchall {:try_start_e2 .. :try_end_e4} :catchall_132
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_e2 .. :try_end_e4} :catch_78
    .catch Lorg/xml/sax/SAXException; {:try_start_e2 .. :try_end_e4} :catch_ce
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_e2 .. :try_end_e4} :catch_13b
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_e4} :catch_138
    .catch Ljava/lang/Exception; {:try_start_e2 .. :try_end_e4} :catch_135

    .line 277
    if-eqz v6, :cond_88

    .line 278
    :try_start_e6
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_e9
    .catch Ljava/io/IOException; {:try_start_e6 .. :try_end_e9} :catch_ea

    goto :goto_88

    .line 279
    :catch_ea
    move-exception v10

    goto :goto_88

    .line 269
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v6           #is:Ljava/io/InputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    :catch_ec
    move-exception v3

    .line 270
    .local v3, e:Ljava/io/UnsupportedEncodingException;
    :goto_ed
    :try_start_ed
    const-string v10, "WebServiceBinder"

    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f6
    .catchall {:try_start_ed .. :try_end_f6} :catchall_126

    .line 277
    if-eqz v5, :cond_88

    .line 278
    :try_start_f8
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_f8 .. :try_end_fb} :catch_fc

    goto :goto_88

    .line 279
    :catch_fc
    move-exception v10

    goto :goto_88

    .line 271
    .end local v3           #e:Ljava/io/UnsupportedEncodingException;
    :catch_fe
    move-exception v3

    .line 272
    .local v3, e:Ljava/io/IOException;
    :goto_ff
    :try_start_ff
    const-string v10, "WebServiceBinder"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_108
    .catchall {:try_start_ff .. :try_end_108} :catchall_126

    .line 277
    if-eqz v5, :cond_88

    .line 278
    :try_start_10a
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_10d
    .catch Ljava/io/IOException; {:try_start_10a .. :try_end_10d} :catch_10f

    goto/16 :goto_88

    .line 279
    :catch_10f
    move-exception v10

    goto/16 :goto_88

    .line 273
    .end local v3           #e:Ljava/io/IOException;
    :catch_112
    move-exception v3

    .line 274
    .local v3, e:Ljava/lang/Exception;
    :goto_113
    :try_start_113
    const-string v10, "WebServiceBinder"

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11c
    .catchall {:try_start_113 .. :try_end_11c} :catchall_126

    .line 277
    if-eqz v5, :cond_88

    .line 278
    :try_start_11e
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_121
    .catch Ljava/io/IOException; {:try_start_11e .. :try_end_121} :catch_123

    goto/16 :goto_88

    .line 279
    :catch_123
    move-exception v10

    goto/16 :goto_88

    .line 276
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_126
    move-exception v10

    .line 277
    :goto_127
    if-eqz v5, :cond_12c

    .line 278
    :try_start_129
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_12c
    .catch Ljava/io/IOException; {:try_start_129 .. :try_end_12c} :catch_130

    .line 280
    :cond_12c
    :goto_12c
    throw v10

    .line 279
    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_12d
    move-exception v10

    goto/16 :goto_88

    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_130
    move-exception v11

    goto :goto_12c

    .line 276
    .end local v5           #is:Ljava/io/InputStream;
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v6       #is:Ljava/io/InputStream;
    :catchall_132
    move-exception v10

    move-object v5, v6

    .end local v6           #is:Ljava/io/InputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    goto :goto_127

    .line 273
    .end local v5           #is:Ljava/io/InputStream;
    .restart local v6       #is:Ljava/io/InputStream;
    :catch_135
    move-exception v3

    move-object v5, v6

    .end local v6           #is:Ljava/io/InputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    goto :goto_113

    .line 271
    .end local v5           #is:Ljava/io/InputStream;
    .restart local v6       #is:Ljava/io/InputStream;
    :catch_138
    move-exception v3

    move-object v5, v6

    .end local v6           #is:Ljava/io/InputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    goto :goto_ff

    .line 269
    .end local v5           #is:Ljava/io/InputStream;
    .restart local v6       #is:Ljava/io/InputStream;
    :catch_13b
    move-exception v3

    move-object v5, v6

    .end local v6           #is:Ljava/io/InputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    goto :goto_ed

    .line 267
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    :catch_13e
    move-exception v3

    goto :goto_d0

    .line 265
    :catch_140
    move-exception v3

    goto/16 :goto_7a
.end method

.method private tryStartQuery()V
    .registers 9

    .prologue
    const-wide/16 v6, 0x0

    .line 188
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    sub-long v0, v2, v4

    .line 189
    .local v0, time:J
    cmp-long v2, v0, v6

    if-gez v2, :cond_10

    .line 190
    iput-wide v6, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    .line 192
    :cond_10
    iget-wide v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_34

    iget v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateInterval:I

    if-lez v2, :cond_23

    iget v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateInterval:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_34

    :cond_23
    iget-boolean v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQuerySuccessful:Z

    if-nez v2, :cond_37

    iget v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateIntervalFail:I

    if-lez v2, :cond_37

    iget v2, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mUpdateIntervalFail:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-lez v2, :cond_37

    .line 195
    :cond_34
    invoke-virtual {p0}, Lmiui/app/screenelement/data/WebServiceBinder;->startQuery()V

    .line 197
    :cond_37
    return-void
.end method


# virtual methods
.method protected addVariable(Lmiui/app/screenelement/data/WebServiceBinder$Variable;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 224
    iget-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 225
    return-void
.end method

.method public finish()V
    .registers 9

    .prologue
    .line 159
    iget-object v4, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v4, v4, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    const-string v5, "MamlPreferences"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 160
    .local v2, sp:Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 161
    .local v0, ed:Landroid/content/SharedPreferences$Editor;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "LastQueryTime"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-wide v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    invoke-interface {v0, v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 162
    const-string v4, "WebServiceBinder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "persist mLastQueryTime: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    iget-object v4, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_49
    :goto_49
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;

    .line 164
    .local v3, v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    iget-boolean v4, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mPersist:Z

    if-eqz v4, :cond_49

    .line 165
    iget-object v4, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    if-eqz v4, :cond_7c

    .line 166
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    invoke-virtual {v5}, Lmiui/app/screenelement/util/IndexedStringVariable;->get()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_49

    .line 167
    :cond_7c
    iget-object v4, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-eqz v4, :cond_49

    .line 168
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->get()Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->floatValue()F

    move-result v5

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_49

    .line 172
    .end local v3           #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    :cond_a3
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 173
    return-void
.end method

.method public bridge synthetic getName()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 47
    invoke-virtual {p0}, Lmiui/app/screenelement/data/WebServiceBinder;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public init()V
    .registers 8

    .prologue
    .line 141
    const/4 v3, 0x1

    iput-boolean v3, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQuerySuccessful:Z

    .line 142
    iget-object v3, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    const-string v4, "MamlPreferences"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 143
    .local v1, sp:Landroid/content/SharedPreferences;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "LastQueryTime"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-interface {v1, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    .line 144
    const-string v3, "WebServiceBinder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "get persisted mLastQueryTime: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    iget-object v3, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_4b
    :goto_4b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;

    .line 146
    .local v2, v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    iget-boolean v3, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mPersist:Z

    if-eqz v3, :cond_4b

    .line 147
    iget-object v3, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    if-eqz v3, :cond_7f

    .line 148
    iget-object v3, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mStringVar:Lmiui/app/screenelement/util/IndexedStringVariable;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lmiui/app/screenelement/util/IndexedStringVariable;->set(Ljava/lang/String;)V

    goto :goto_4b

    .line 149
    :cond_7f
    iget-object v3, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-eqz v3, :cond_4b

    .line 150
    iget-object v3, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mNumberVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lmiui/app/screenelement/data/WebServiceBinder$Variable;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    goto :goto_4b

    .line 155
    .end local v2           #v:Lmiui/app/screenelement/data/WebServiceBinder$Variable;
    :cond_a4
    invoke-direct {p0}, Lmiui/app/screenelement/data/WebServiceBinder;->tryStartQuery()V

    .line 156
    return-void
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 176
    return-void
.end method

.method public refresh()V
    .registers 1

    .prologue
    .line 184
    invoke-virtual {p0}, Lmiui/app/screenelement/data/WebServiceBinder;->startQuery()V

    .line 185
    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    .line 179
    invoke-direct {p0}, Lmiui/app/screenelement/data/WebServiceBinder;->tryStartQuery()V

    .line 180
    return-void
.end method

.method public startQuery()V
    .registers 2

    .prologue
    .line 228
    iget-boolean v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQueryInProgress:Z

    if-eqz v0, :cond_5

    .line 234
    :goto_4
    return-void

    .line 230
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQueryInProgress:Z

    .line 231
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQuerySuccessful:Z

    .line 232
    new-instance v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;-><init>(Lmiui/app/screenelement/data/WebServiceBinder;)V

    iput-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQueryThread:Ljava/lang/Thread;

    .line 233
    iget-object v0, p0, Lmiui/app/screenelement/data/WebServiceBinder;->mQueryThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_4
.end method
