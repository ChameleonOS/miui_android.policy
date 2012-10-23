.class public Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;
.super Ljava/lang/Object;
.source "LockScreenResourceLoader.java"

# interfaces
.implements Lmiui/app/screenelement/ResourceManager$ResourceLoader;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "LockScreenResourceLoader"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private containsFile(Ljava/lang/String;)Z
    .registers 3
    .parameter "manifestName"

    .prologue
    .line 92
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/content/res/ThemeResourcesSystem;->containsAwesomeLockscreenEntry(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    .registers 10
    .parameter "src"
    .parameter "opts"

    .prologue
    const/4 v5, 0x0

    .line 27
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v4

    invoke-virtual {v4, p1, v5}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;[I)Ljava/io/InputStream;

    move-result-object v2

    .line 28
    .local v2, is:Ljava/io/InputStream;
    if-eqz v2, :cond_2a

    .line 30
    :try_start_b
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .local v3, padding:Landroid/graphics/Rect;
    invoke-static {v2, v3, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 32
    .local v0, bmp:Landroid/graphics/Bitmap;
    new-instance v4, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    invoke-direct {v4, v0, v3}, Lmiui/app/screenelement/ResourceManager$BitmapInfo;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    :try_end_19
    .catchall {:try_start_b .. :try_end_19} :catchall_2c
    .catch Ljava/lang/OutOfMemoryError; {:try_start_b .. :try_end_19} :catch_1d

    .line 37
    :try_start_19
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_31

    .line 43
    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v3           #padding:Landroid/graphics/Rect;
    :goto_1c
    return-object v4

    .line 33
    :catch_1d
    move-exception v1

    .line 34
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :try_start_1e
    const-string v4, "ResourceManager"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_27
    .catchall {:try_start_1e .. :try_end_27} :catchall_2c

    .line 37
    :try_start_27
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_33

    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :cond_2a
    :goto_2a
    move-object v4, v5

    .line 43
    goto :goto_1c

    .line 36
    :catchall_2c
    move-exception v4

    .line 37
    :try_start_2d
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_35

    .line 39
    :goto_30
    throw v4

    .line 38
    .restart local v0       #bmp:Landroid/graphics/Bitmap;
    .restart local v3       #padding:Landroid/graphics/Rect;
    :catch_31
    move-exception v5

    goto :goto_1c

    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v3           #padding:Landroid/graphics/Rect;
    .restart local v1       #e:Ljava/lang/OutOfMemoryError;
    :catch_33
    move-exception v4

    goto :goto_2a

    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :catch_35
    move-exception v5

    goto :goto_30
.end method

.method public getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
    .registers 13
    .parameter "src"

    .prologue
    const/4 v8, 0x0

    const/high16 v10, 0x1

    .line 97
    const/4 v9, 0x1

    new-array v6, v9, [I

    .line 98
    .local v6, size:[I
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v9

    invoke-virtual {v9, p1, v6}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;[I)Ljava/io/InputStream;

    move-result-object v3

    .line 99
    .local v3, is:Ljava/io/InputStream;
    if-eqz v3, :cond_3b

    .line 100
    const/high16 v0, 0x1

    .line 101
    .local v0, COUNT:I
    new-array v1, v10, [B

    .line 103
    .local v1, buff:[B
    :try_start_14
    new-instance v4, Landroid/os/MemoryFile;

    const/4 v9, 0x0

    const/4 v10, 0x0

    aget v10, v6, v10

    invoke-direct {v4, v9, v10}, Landroid/os/MemoryFile;-><init>(Ljava/lang/String;I)V

    .line 104
    .local v4, mf:Landroid/os/MemoryFile;
    const/4 v5, -0x1

    .line 105
    .local v5, read:I
    const/4 v7, 0x0

    .line 106
    .local v7, start:I
    :goto_1f
    const/4 v9, 0x0

    const/high16 v10, 0x1

    invoke-virtual {v3, v1, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-lez v5, :cond_2e

    .line 107
    const/4 v9, 0x0

    invoke-virtual {v4, v1, v9, v7, v5}, Landroid/os/MemoryFile;->writeBytes([BIII)V

    .line 108
    add-int/2addr v7, v5

    goto :goto_1f

    .line 110
    :cond_2e
    invoke-virtual {v4}, Landroid/os/MemoryFile;->length()I
    :try_end_31
    .catchall {:try_start_14 .. :try_end_31} :catchall_5d
    .catch Ljava/lang/OutOfMemoryError; {:try_start_14 .. :try_end_31} :catch_3d
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_31} :catch_4d

    move-result v9

    if-lez v9, :cond_38

    .line 118
    :try_start_34
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_37} :catch_62

    .line 124
    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v7           #start:I
    :goto_37
    return-object v4

    .line 118
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    .restart local v4       #mf:Landroid/os/MemoryFile;
    .restart local v5       #read:I
    .restart local v7       #start:I
    :cond_38
    :try_start_38
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3b} :catch_64

    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v7           #start:I
    :cond_3b
    :goto_3b
    move-object v4, v8

    .line 124
    goto :goto_37

    .line 112
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    :catch_3d
    move-exception v2

    .line 113
    .local v2, e:Ljava/lang/OutOfMemoryError;
    :try_start_3e
    const-string v9, "ResourceManager"

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_5d

    .line 118
    :try_start_47
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4a} :catch_4b

    goto :goto_3b

    .line 119
    :catch_4b
    move-exception v9

    goto :goto_3b

    .line 114
    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catch_4d
    move-exception v2

    .line 115
    .local v2, e:Ljava/io/IOException;
    :try_start_4e
    const-string v9, "ResourceManager"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_57
    .catchall {:try_start_4e .. :try_end_57} :catchall_5d

    .line 118
    :try_start_57
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_5a} :catch_5b

    goto :goto_3b

    .line 119
    :catch_5b
    move-exception v9

    goto :goto_3b

    .line 117
    .end local v2           #e:Ljava/io/IOException;
    :catchall_5d
    move-exception v8

    .line 118
    :try_start_5e
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_61} :catch_66

    .line 120
    :goto_61
    throw v8

    .line 119
    .restart local v4       #mf:Landroid/os/MemoryFile;
    .restart local v5       #read:I
    .restart local v7       #start:I
    :catch_62
    move-exception v8

    goto :goto_37

    :catch_64
    move-exception v9

    goto :goto_3b

    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v7           #start:I
    :catch_66
    move-exception v9

    goto :goto_61
.end method

.method public getManifestRoot()Lorg/w3c/dom/Element;
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method public getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 13
    .parameter "language"

    .prologue
    const/4 v7, 0x0

    .line 48
    const-string v8, "LockScreenResourceLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getManifestRoot:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 50
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v4, 0x0

    .line 52
    .local v4, is:Ljava/io/InputStream;
    :try_start_1e
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 53
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    const-string v5, "manifest.xml"

    .line 54
    .local v5, manifestName:Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4b

    .line 55
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "manifest_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".xml"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 56
    invoke-direct {p0, v5}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->containsFile(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4b

    .line 57
    const-string v5, "manifest.xml"

    .line 60
    :cond_4b
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v5, v9}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;[I)Ljava/io/InputStream;

    move-result-object v4

    .line 61
    invoke-virtual {v0, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 62
    .local v2, doc:Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 63
    .local v6, root:Lorg/w3c/dom/Element;
    const-string v8, "LockScreenResourceLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "load root:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " from: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Lockscreen"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_8b
    .catchall {:try_start_1e .. :try_end_8b} :catchall_cb
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1e .. :try_end_8b} :catch_9b
    .catch Lorg/xml/sax/SAXException; {:try_start_1e .. :try_end_8b} :catch_a7
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_8b} :catch_b3
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_8b} :catch_bf

    move-result v8

    if-eqz v8, :cond_94

    .line 77
    if-eqz v4, :cond_93

    .line 78
    :try_start_90
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_93
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_93} :catch_d2

    .line 83
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_93
    :goto_93
    return-object v6

    .line 77
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :cond_94
    if-eqz v4, :cond_99

    .line 78
    :try_start_96
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_96 .. :try_end_99} :catch_d4

    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_99
    :goto_99
    move-object v6, v7

    .line 83
    goto :goto_93

    .line 67
    :catch_9b
    move-exception v3

    .line 68
    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :try_start_9c
    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V
    :try_end_9f
    .catchall {:try_start_9c .. :try_end_9f} :catchall_cb

    .line 77
    if-eqz v4, :cond_99

    .line 78
    :try_start_a1
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_a4
    .catch Ljava/io/IOException; {:try_start_a1 .. :try_end_a4} :catch_a5

    goto :goto_99

    .line 79
    :catch_a5
    move-exception v8

    goto :goto_99

    .line 69
    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_a7
    move-exception v3

    .line 70
    .local v3, e:Lorg/xml/sax/SAXException;
    :try_start_a8
    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->printStackTrace()V
    :try_end_ab
    .catchall {:try_start_a8 .. :try_end_ab} :catchall_cb

    .line 77
    if-eqz v4, :cond_99

    .line 78
    :try_start_ad
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_b0
    .catch Ljava/io/IOException; {:try_start_ad .. :try_end_b0} :catch_b1

    goto :goto_99

    .line 79
    :catch_b1
    move-exception v8

    goto :goto_99

    .line 71
    .end local v3           #e:Lorg/xml/sax/SAXException;
    :catch_b3
    move-exception v3

    .line 72
    .local v3, e:Ljava/io/IOException;
    :try_start_b4
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_b7
    .catchall {:try_start_b4 .. :try_end_b7} :catchall_cb

    .line 77
    if-eqz v4, :cond_99

    .line 78
    :try_start_b9
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_bc
    .catch Ljava/io/IOException; {:try_start_b9 .. :try_end_bc} :catch_bd

    goto :goto_99

    .line 79
    :catch_bd
    move-exception v8

    goto :goto_99

    .line 73
    .end local v3           #e:Ljava/io/IOException;
    :catch_bf
    move-exception v3

    .line 74
    .local v3, e:Ljava/lang/Exception;
    :try_start_c0
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_c3
    .catchall {:try_start_c0 .. :try_end_c3} :catchall_cb

    .line 77
    if-eqz v4, :cond_99

    .line 78
    :try_start_c5
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_c8
    .catch Ljava/io/IOException; {:try_start_c5 .. :try_end_c8} :catch_c9

    goto :goto_99

    .line 79
    :catch_c9
    move-exception v8

    goto :goto_99

    .line 76
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_cb
    move-exception v7

    .line 77
    if-eqz v4, :cond_d1

    .line 78
    :try_start_ce
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_d1
    .catch Ljava/io/IOException; {:try_start_ce .. :try_end_d1} :catch_d6

    .line 80
    :cond_d1
    :goto_d1
    throw v7

    .line 79
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :catch_d2
    move-exception v7

    goto :goto_93

    :catch_d4
    move-exception v8

    goto :goto_99

    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :catch_d6
    move-exception v8

    goto :goto_d1
.end method
