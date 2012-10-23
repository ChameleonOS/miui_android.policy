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
    .line 24
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private containsFile(Ljava/lang/String;)Z
    .registers 3
    .parameter "manifestName"

    .prologue
    .line 91
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
    .line 29
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v4

    invoke-virtual {v4, p1}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v2

    .line 30
    .local v2, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    if-eqz v2, :cond_37

    .line 32
    :try_start_a
    iget v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mDensity:I

    if-eqz v4, :cond_12

    .line 33
    iget v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mDensity:I

    iput v4, p2, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 35
    :cond_12
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 36
    .local v3, padding:Landroid/graphics/Rect;
    iget-object v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-static {v4, v3, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 37
    .local v0, bmp:Landroid/graphics/Bitmap;
    new-instance v4, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    invoke-direct {v4, v0, v3}, Lmiui/app/screenelement/ResourceManager$BitmapInfo;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    :try_end_22
    .catchall {:try_start_a .. :try_end_22} :catchall_39
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_22} :catch_28

    .line 42
    :try_start_22
    iget-object v5, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_27} :catch_44

    .line 48
    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v3           #padding:Landroid/graphics/Rect;
    :goto_27
    return-object v4

    .line 38
    :catch_28
    move-exception v1

    .line 39
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :try_start_29
    const-string v4, "ResourceManager"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_32
    .catchall {:try_start_29 .. :try_end_32} :catchall_39

    .line 42
    :try_start_32
    iget-object v4, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_37} :catch_42

    .line 48
    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :cond_37
    :goto_37
    const/4 v4, 0x0

    goto :goto_27

    .line 41
    :catchall_39
    move-exception v4

    .line 42
    :try_start_3a
    iget-object v5, v2, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3f} :catch_40

    .line 44
    :goto_3f
    throw v4

    .line 43
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

    .line 96
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v8

    invoke-virtual {v8, p1}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v3

    .line 97
    .local v3, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    if-eqz v3, :cond_3e

    .line 98
    const/high16 v0, 0x1

    .line 99
    .local v0, COUNT:I
    new-array v1, v9, [B

    .line 101
    .local v1, buff:[B
    :try_start_11
    new-instance v4, Landroid/os/MemoryFile;

    const/4 v8, 0x0

    iget-wide v9, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mSize:J

    long-to-int v9, v9

    invoke-direct {v4, v8, v9}, Landroid/os/MemoryFile;-><init>(Ljava/lang/String;I)V

    .line 102
    .local v4, mf:Landroid/os/MemoryFile;
    const/4 v5, -0x1

    .line 103
    .local v5, read:I
    const/4 v6, 0x0

    .line 104
    .local v6, start:I
    :goto_1c
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    const/4 v9, 0x0

    const/high16 v10, 0x1

    invoke-virtual {v8, v1, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    if-lez v5, :cond_2d

    .line 105
    const/4 v8, 0x0

    invoke-virtual {v4, v1, v8, v6, v5}, Landroid/os/MemoryFile;->writeBytes([BIII)V

    .line 106
    add-int/2addr v6, v5

    goto :goto_1c

    .line 108
    :cond_2d
    invoke-virtual {v4}, Landroid/os/MemoryFile;->length()I
    :try_end_30
    .catchall {:try_start_11 .. :try_end_30} :catchall_64
    .catch Ljava/lang/OutOfMemoryError; {:try_start_11 .. :try_end_30} :catch_40
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_30} :catch_52

    move-result v8

    if-lez v8, :cond_39

    .line 116
    :try_start_33
    iget-object v7, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_6f

    .line 122
    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v4           #mf:Landroid/os/MemoryFile;
    .end local v5           #read:I
    .end local v6           #start:I
    :goto_38
    return-object v4

    .line 116
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

    .line 122
    goto :goto_38

    .line 110
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    :catch_40
    move-exception v2

    .line 111
    .local v2, e:Ljava/lang/OutOfMemoryError;
    :try_start_41
    const-string v8, "ResourceManager"

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4a
    .catchall {:try_start_41 .. :try_end_4a} :catchall_64

    .line 116
    :try_start_4a
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4f} :catch_50

    goto :goto_3e

    .line 117
    :catch_50
    move-exception v8

    goto :goto_3e

    .line 112
    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catch_52
    move-exception v2

    .line 113
    .local v2, e:Ljava/io/IOException;
    :try_start_53
    const-string v8, "ResourceManager"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5c
    .catchall {:try_start_53 .. :try_end_5c} :catchall_64

    .line 116
    :try_start_5c
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_61} :catch_62

    goto :goto_3e

    .line 117
    :catch_62
    move-exception v8

    goto :goto_3e

    .line 115
    .end local v2           #e:Ljava/io/IOException;
    :catchall_64
    move-exception v7

    .line 116
    :try_start_65
    iget-object v8, v3, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_6a} :catch_6b

    .line 118
    :goto_6a
    throw v7

    .line 117
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
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method public getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 12
    .parameter "language"

    .prologue
    .line 53
    const-string v7, "LockScreenResourceLoader"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getManifestRoot:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 55
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v4, 0x0

    .line 57
    .local v4, info:Lmiui/content/res/ThemeZipFile$ThemeFileInfo;
    :try_start_1d
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 58
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    const-string v5, "manifest.xml"

    .line 59
    .local v5, manifestName:Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4a

    .line 60
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "manifest_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".xml"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 61
    invoke-direct {p0, v5}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenResourceLoader;->containsFile(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4a

    .line 62
    const-string v5, "manifest.xml"

    .line 65
    :cond_4a
    invoke-static {}, Lmiui/content/res/ThemeResources;->getSystem()Lmiui/content/res/ThemeResourcesSystem;

    move-result-object v7

    invoke-virtual {v7, v5}, Lmiui/content/res/ThemeResourcesSystem;->getAwesomeLockscreenFileStream(Ljava/lang/String;)Lmiui/content/res/ThemeZipFile$ThemeFileInfo;

    move-result-object v4

    .line 66
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v0, v7}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 67
    .local v2, doc:Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 68
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

    .line 69
    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Lockscreen"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_8b
    .catchall {:try_start_1d .. :try_end_8b} :catchall_ad
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_8b} :catch_9f

    move-result v7

    if-eqz v7, :cond_96

    .line 75
    if-eqz v4, :cond_95

    .line 76
    :try_start_90
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_95
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_95} :catch_ba

    .line 82
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_95
    :goto_95
    return-object v6

    .line 75
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :cond_96
    if-eqz v4, :cond_9d

    .line 76
    :try_start_98
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_98 .. :try_end_9d} :catch_b8

    .line 82
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v5           #manifestName:Ljava/lang/String;
    .end local v6           #root:Lorg/w3c/dom/Element;
    :cond_9d
    :goto_9d
    const/4 v6, 0x0

    goto :goto_95

    .line 71
    :catch_9f
    move-exception v3

    .line 72
    .local v3, e:Ljava/lang/Exception;
    :try_start_a0
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a3
    .catchall {:try_start_a0 .. :try_end_a3} :catchall_ad

    .line 75
    if-eqz v4, :cond_9d

    .line 76
    :try_start_a5
    iget-object v7, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_aa} :catch_ab

    goto :goto_9d

    .line 78
    :catch_ab
    move-exception v7

    goto :goto_9d

    .line 74
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_ad
    move-exception v7

    .line 75
    if-eqz v4, :cond_b5

    .line 76
    :try_start_b0
    iget-object v8, v4, Lmiui/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b5} :catch_b6

    .line 79
    :cond_b5
    :goto_b5
    throw v7

    .line 78
    :catch_b6
    move-exception v8

    goto :goto_b5

    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    .restart local v5       #manifestName:Ljava/lang/String;
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :catch_b8
    move-exception v7

    goto :goto_9d

    :catch_ba
    move-exception v7

    goto :goto_95
.end method
