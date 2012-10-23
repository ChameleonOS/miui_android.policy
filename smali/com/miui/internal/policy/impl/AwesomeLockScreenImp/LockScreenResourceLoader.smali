.class public Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;
.super Lmiui/app/screenelement/ResourceLoader;
.source "LockScreenResourceLoader.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "LockScreenResourceLoader"

.field private static final MANIFEST_XML:Ljava/lang/String; = "manifest.xml"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lmiui/app/screenelement/ResourceLoader;-><init>()V

    return-void
.end method

.method private containsFile(Ljava/lang/String;)Z
    .registers 3
    .parameter "manifestName"

    .prologue
    .line 96
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/content/res/ThemeResourcesSystem;->containsAwesomeLockscreenEntry(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    .registers 9
    .parameter "src"
    .parameter "opts"

    .prologue
    .line 31
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v4

    invoke-virtual {v4, p1}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v2

    .line 32
    .local v2, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    if-eqz v2, :cond_37

    .line 34
    :try_start_a
    iget v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mDensity:I

    if-eqz v4, :cond_12

    .line 35
    iget v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mDensity:I

    iput v4, p2, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 37
    :cond_12
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 38
    .local v3, padding:Landroid/graphics/Rect;
    iget-object v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-static {v4, v3, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 39
    .local v0, bmp:Landroid/graphics/Bitmap;
    new-instance v4, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    invoke-direct {v4, v0, v3}, Lmiui/app/screenelement/ResourceManager$BitmapInfo;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    :try_end_22
    .catchall {:try_start_a .. :try_end_22} :catchall_39
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_22} :catch_28

    .line 44
    :try_start_22
    iget-object v5, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_27} :catch_44

    .line 50
    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v3           #padding:Landroid/graphics/Rect;
    :goto_27
    return-object v4

    .line 40
    :catch_28
    move-exception v1

    .line 41
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :try_start_29
    const-string v4, "ResourceManager"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_32
    .catchall {:try_start_29 .. :try_end_32} :catchall_39

    .line 44
    :try_start_32
    iget-object v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_37} :catch_42

    .line 50
    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :cond_37
    :goto_37
    const/4 v4, 0x0

    goto :goto_27

    .line 43
    :catchall_39
    move-exception v4

    .line 44
    :try_start_3a
    iget-object v5, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3f} :catch_40

    .line 46
    :goto_3f
    throw v4

    .line 45
    :catch_40
    move-exception v5

    goto :goto_3f

    .restart local v1       #e:Ljava/lang/OutOfMemoryError;
    :catch_42
    move-exception v4

    goto :goto_37

    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    .restart local v0       #bmp:Landroid/graphics/Bitmap;
    .restart local v3       #padding:Landroid/graphics/Rect;
    :catch_44
    move-exception v5

    goto :goto_27
.end method

.method public getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
    .registers 13
    .parameter "src"

    .prologue
    const/4 v7, 0x0

    const/high16 v9, 0x1

    .line 101
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v8

    invoke-virtual {v8, p1}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v3

    .line 102
    .local v3, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    if-eqz v3, :cond_3e

    .line 103
    const/high16 v0, 0x1

    .line 104
    .local v0, COUNT:I
    new-array v1, v9, [B

    .line 106
    .local v1, buff:[B
    :try_start_11
    new-instance v4, Landroid/os/MemoryFile;

    const/4 v8, 0x0

    iget-wide v9, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mSize:J

    long-to-int v9, v9

    invoke-direct {v4, v8, v9}, Landroid/os/MemoryFile;-><init>(Ljava/lang/String;I)V

    .line 107
    .local v4, mf:Landroid/os/MemoryFile;
    const/4 v5, -0x1

    .line 108
    .local v5, read:I
    const/4 v6, 0x0

    .line 109
    .local v6, start:I
    :goto_1c
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    const/4 v9, 0x0

    const/high16 v10, 0x1

    invoke-virtual {v8, v1, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-lez v5, :cond_2d

    .line 110
    const/4 v8, 0x0

    invoke-virtual {v4, v1, v8, v6, v5}, Landroid/os/MemoryFile;->writeBytes([BIII)V

    .line 111
    add-int/2addr v6, v5

    goto :goto_1c

    .line 113
    :cond_2d
    invoke-virtual {v4}, Landroid/os/MemoryFile;->length()I
    :try_end_30
    .catchall {:try_start_11 .. :try_end_30} :catchall_64
    .catch Ljava/lang/OutOfMemoryError; {:try_start_11 .. :try_end_30} :catch_40
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_30} :catch_52

    move-result v8

    if-lez v8, :cond_39

    .line 121
    :try_start_33
    iget-object v7, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_6f

    .line 127
    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v6           #start:I
    :goto_38
    return-object v4

    .line 121
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    .restart local v4       #mf:Landroid/os/MemoryFile;
    .restart local v5       #read:I
    .restart local v6       #start:I
    :cond_39
    :try_start_39
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3e} :catch_6d

    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v6           #start:I
    :cond_3e
    :goto_3e
    move-object v4, v7

    .line 127
    goto :goto_38

    .line 115
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    :catch_40
    move-exception v2

    .line 116
    .local v2, e:Ljava/lang/OutOfMemoryError;
    :try_start_41
    const-string v8, "ResourceManager"

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4a
    .catchall {:try_start_41 .. :try_end_4a} :catchall_64

    .line 121
    :try_start_4a
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4f} :catch_50

    goto :goto_3e

    .line 122
    :catch_50
    move-exception v8

    goto :goto_3e

    .line 117
    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catch_52
    move-exception v2

    .line 118
    .local v2, e:Ljava/io/IOException;
    :try_start_53
    const-string v8, "ResourceManager"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5c
    .catchall {:try_start_53 .. :try_end_5c} :catchall_64

    .line 121
    :try_start_5c
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_61} :catch_62

    goto :goto_3e

    .line 122
    :catch_62
    move-exception v8

    goto :goto_3e

    .line 120
    .end local v2           #e:Ljava/io/IOException;
    :catchall_64
    move-exception v7

    .line 121
    :try_start_65
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_6a} :catch_6b

    .line 123
    :goto_6a
    throw v7

    .line 122
    :catch_6b
    move-exception v8

    goto :goto_6a

    .restart local v4       #mf:Landroid/os/MemoryFile;
    .restart local v5       #read:I
    .restart local v6       #start:I
    :catch_6d
    move-exception v8

    goto :goto_3e

    :catch_6f
    move-exception v7

    goto :goto_38
.end method

.method public getManifestRoot()Lorg/w3c/dom/Element;
    .registers 11

    .prologue
    .line 55
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 56
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v4, 0x0

    .line 58
    .local v4, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    :try_start_5
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 59
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    const/4 v5, 0x0

    .line 60
    .local v5, manifestName:Ljava/lang/String;
    iget-object v7, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_21

    .line 61
    const-string v7, "manifest.xml"

    iget-object v8, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v7, v8}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 62
    invoke-direct {p0, v5}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->containsFile(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_21

    .line 63
    const/4 v5, 0x0

    .line 66
    :cond_21
    iget-object v7, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3a

    if-nez v5, :cond_3a

    .line 67
    const-string v7, "manifest.xml"

    iget-object v8, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-static {v7, v8}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 68
    invoke-direct {p0, v5}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->containsFile(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3a

    .line 69
    const/4 v5, 0x0

    .line 72
    :cond_3a
    if-nez v5, :cond_3e

    .line 73
    const-string v5, "manifest.xml"

    .line 75
    :cond_3e
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v7

    invoke-virtual {v7, v5}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v4

    .line 76
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v0, v7}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 77
    .local v2, doc:Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 78
    .local v6, root:Lorg/w3c/dom/Element;
    const-string v7, "LockScreenResourceLoader"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "load root:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " from: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Lockscreen"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_7f
    .catchall {:try_start_5 .. :try_end_7f} :catchall_a1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_7f} :catch_93

    move-result v7

    if-eqz v7, :cond_8a

    .line 85
    if-eqz v4, :cond_89

    .line 86
    :try_start_84
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_89} :catch_ae

    .line 92
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_89
    :goto_89
    return-object v6

    .line 85
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :cond_8a
    if-eqz v4, :cond_91

    .line 86
    :try_start_8c
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_8c .. :try_end_91} :catch_ac

    .line 92
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_91
    :goto_91
    const/4 v6, 0x0

    goto :goto_89

    .line 81
    :catch_93
    move-exception v3

    .line 82
    .local v3, e:Ljava/lang/Exception;
    :try_start_94
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_97
    .catchall {:try_start_94 .. :try_end_97} :catchall_a1

    .line 85
    if-eqz v4, :cond_91

    .line 86
    :try_start_99
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9e} :catch_9f

    goto :goto_91

    .line 88
    :catch_9f
    move-exception v7

    goto :goto_91

    .line 84
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_a1
    move-exception v7

    .line 85
    if-eqz v4, :cond_a9

    .line 86
    :try_start_a4
    iget-object v8, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_a9} :catch_aa

    .line 89
    :cond_a9
    :goto_a9
    throw v7

    .line 88
    :catch_aa
    move-exception v8

    goto :goto_a9

    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :catch_ac
    move-exception v7

    goto :goto_91

    :catch_ae
    move-exception v7

    goto :goto_89
.end method
