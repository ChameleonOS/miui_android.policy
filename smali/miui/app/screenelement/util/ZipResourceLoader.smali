.class public Lmiui/app/screenelement/util/ZipResourceLoader;
.super Lmiui/app/screenelement/ResourceLoader;
.source "ZipResourceLoader.java"


# static fields
.field private static final IMAGES_FOLDER_NAME:Ljava/lang/String; = "images"

.field private static final MANIFEST_FILE_NAME:Ljava/lang/String; = "manifest.xml"

.field private static final TAG:Ljava/lang/String; = "MAML_ZipResourceLoader"


# instance fields
.field private mInnerPath:Ljava/lang/String;

.field private mManifestName:Ljava/lang/String;

.field private mResourcePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .parameter "zipPath"

    .prologue
    .line 41
    const/4 v0, 0x0

    const-string v1, "manifest.xml"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/util/ZipResourceLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .parameter "zipPath"
    .parameter "innerPath"

    .prologue
    .line 45
    const-string v0, "manifest.xml"

    invoke-direct {p0, p1, p2, v0}, Lmiui/app/screenelement/util/ZipResourceLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "zipPath"
    .parameter "innerPath"
    .parameter "manifestName"

    .prologue
    .line 54
    invoke-direct {p0}, Lmiui/app/screenelement/ResourceLoader;-><init>()V

    .line 55
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "empty zip path"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_11
    iput-object p1, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    .line 59
    if-nez p2, :cond_17

    const-string p2, ""

    .end local p2
    :cond_17
    iput-object p2, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    .line 60
    iput-object p3, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    .line 61
    return-void
.end method


# virtual methods
.method public getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    .registers 13
    .parameter "src"
    .parameter "opts"

    .prologue
    const/4 v7, 0x0

    .line 65
    const/4 v5, 0x0

    .line 66
    .local v5, zip:Ljava/util/zip/ZipFile;
    const/4 v3, 0x0

    .line 68
    .local v3, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v6, Ljava/util/zip/ZipFile;

    iget-object v8, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v6, v8}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_fe
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_d0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_e7

    .line 69
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .local v6, zip:Ljava/util/zip/ZipFile;
    const/4 v2, 0x0

    .line 70
    .local v2, entry:Ljava/util/zip/ZipEntry;
    :try_start_b
    iget-object v8, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_42

    .line 72
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "images"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 74
    :cond_42
    if-nez v2, :cond_7b

    iget-object v8, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_7b

    .line 76
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "images"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 79
    :cond_7b
    if-nez v2, :cond_94

    .line 80
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 82
    :cond_94
    if-eqz v2, :cond_c3

    .line 83
    invoke-virtual {v6, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    .line 84
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 85
    .local v4, padding:Landroid/graphics/Rect;
    invoke-static {v3, v4, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_a2
    .catchall {:try_start_b .. :try_end_a2} :catchall_11c
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_a2} :catch_122
    .catch Ljava/lang/OutOfMemoryError; {:try_start_b .. :try_end_a2} :catch_11f

    move-result-object v0

    .line 86
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_b1

    .line 95
    if-eqz v3, :cond_aa

    .line 99
    :try_start_a7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_aa} :catch_10a

    .line 105
    :cond_aa
    :goto_aa
    if-eqz v6, :cond_af

    .line 107
    :try_start_ac
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_af
    .catch Ljava/io/IOException; {:try_start_ac .. :try_end_af} :catch_10c

    :cond_af
    :goto_af
    move-object v5, v6

    .line 113
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    .end local v4           #padding:Landroid/graphics/Rect;
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    :cond_b0
    :goto_b0
    return-object v7

    .line 88
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v4       #padding:Landroid/graphics/Rect;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_b1
    :try_start_b1
    new-instance v8, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    invoke-direct {v8, v0, v4}, Lmiui/app/screenelement/ResourceManager$BitmapInfo;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    :try_end_b6
    .catchall {:try_start_b1 .. :try_end_b6} :catchall_11c
    .catch Ljava/io/IOException; {:try_start_b1 .. :try_end_b6} :catch_122
    .catch Ljava/lang/OutOfMemoryError; {:try_start_b1 .. :try_end_b6} :catch_11f

    .line 95
    if-eqz v3, :cond_bb

    .line 99
    :try_start_b8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_bb
    .catch Ljava/io/IOException; {:try_start_b8 .. :try_end_bb} :catch_10e

    .line 105
    :cond_bb
    :goto_bb
    if-eqz v6, :cond_c0

    .line 107
    :try_start_bd
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_c0
    .catch Ljava/io/IOException; {:try_start_bd .. :try_end_c0} :catch_110

    :cond_c0
    :goto_c0
    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    move-object v7, v8

    .line 109
    goto :goto_b0

    .line 95
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v4           #padding:Landroid/graphics/Rect;
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_c3
    if-eqz v3, :cond_c6

    .line 99
    :try_start_c5
    throw v3
    :try_end_c6
    .catch Ljava/io/IOException; {:try_start_c5 .. :try_end_c6} :catch_112

    .line 105
    :cond_c6
    :goto_c6
    if-eqz v6, :cond_125

    .line 107
    :try_start_c8
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cb} :catch_cd

    move-object v5, v6

    .line 109
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_b0

    .line 108
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_cd
    move-exception v8

    move-object v5, v6

    .line 109
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_b0

    .line 90
    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    :catch_d0
    move-exception v1

    .line 91
    .local v1, e:Ljava/io/IOException;
    :goto_d1
    :try_start_d1
    const-string v8, "MAML_ZipResourceLoader"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_da
    .catchall {:try_start_d1 .. :try_end_da} :catchall_fe

    .line 95
    if-eqz v3, :cond_df

    .line 99
    :try_start_dc
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_df
    .catch Ljava/io/IOException; {:try_start_dc .. :try_end_df} :catch_114

    .line 105
    :cond_df
    :goto_df
    if-eqz v5, :cond_b0

    .line 107
    :try_start_e1
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_e4
    .catch Ljava/io/IOException; {:try_start_e1 .. :try_end_e4} :catch_e5

    goto :goto_b0

    .line 108
    :catch_e5
    move-exception v8

    goto :goto_b0

    .line 92
    .end local v1           #e:Ljava/io/IOException;
    :catch_e7
    move-exception v1

    .line 93
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :goto_e8
    :try_start_e8
    const-string v8, "MAML_ZipResourceLoader"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f1
    .catchall {:try_start_e8 .. :try_end_f1} :catchall_fe

    .line 95
    if-eqz v3, :cond_f6

    .line 99
    :try_start_f3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_f6
    .catch Ljava/io/IOException; {:try_start_f3 .. :try_end_f6} :catch_116

    .line 105
    :cond_f6
    :goto_f6
    if-eqz v5, :cond_b0

    .line 107
    :try_start_f8
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_f8 .. :try_end_fb} :catch_fc

    goto :goto_b0

    .line 108
    :catch_fc
    move-exception v8

    goto :goto_b0

    .line 95
    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :catchall_fe
    move-exception v7

    :goto_ff
    if-eqz v3, :cond_104

    .line 99
    :try_start_101
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_104
    .catch Ljava/io/IOException; {:try_start_101 .. :try_end_104} :catch_118

    .line 105
    :cond_104
    :goto_104
    if-eqz v5, :cond_109

    .line 107
    :try_start_106
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_109
    .catch Ljava/io/IOException; {:try_start_106 .. :try_end_109} :catch_11a

    .line 109
    :cond_109
    :goto_109
    throw v7

    .line 100
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v4       #padding:Landroid/graphics/Rect;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_10a
    move-exception v8

    goto :goto_aa

    .line 108
    :catch_10c
    move-exception v8

    goto :goto_af

    .line 100
    :catch_10e
    move-exception v7

    goto :goto_bb

    .line 108
    :catch_110
    move-exception v7

    goto :goto_c0

    .line 100
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v4           #padding:Landroid/graphics/Rect;
    :catch_112
    move-exception v8

    goto :goto_c6

    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .local v1, e:Ljava/io/IOException;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    :catch_114
    move-exception v8

    goto :goto_df

    .local v1, e:Ljava/lang/OutOfMemoryError;
    :catch_116
    move-exception v8

    goto :goto_f6

    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :catch_118
    move-exception v8

    goto :goto_104

    .line 108
    :catch_11a
    move-exception v8

    goto :goto_109

    .line 95
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catchall_11c
    move-exception v7

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_ff

    .line 92
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_11f
    move-exception v1

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_e8

    .line 90
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_122
    move-exception v1

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_d1

    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_125
    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_b0
.end method

.method public getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
    .registers 16
    .parameter "src"

    .prologue
    const/4 v11, 0x0

    .line 118
    const/4 v9, 0x0

    .line 119
    .local v9, zip:Ljava/util/zip/ZipFile;
    const/4 v4, 0x0

    .line 121
    .local v4, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v10, Ljava/util/zip/ZipFile;

    iget-object v12, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v10, v12}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_a8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_7a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_91

    .line 122
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .local v10, zip:Ljava/util/zip/ZipFile;
    :try_start_a
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v3

    .line 123
    .local v3, entry:Ljava/util/zip/ZipEntry;
    if-eqz v3, :cond_6a

    .line 124
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    long-to-int v7, v12

    .line 125
    .local v7, size:I
    invoke-virtual {v10, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_2b
    .catchall {:try_start_a .. :try_end_2b} :catchall_c7
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_2b} :catch_cd
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_2b} :catch_ca

    move-result-object v4

    .line 126
    if-nez v4, :cond_3b

    .line 146
    if-eqz v4, :cond_33

    .line 150
    :try_start_30
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_b4

    .line 156
    :cond_33
    :goto_33
    if-eqz v10, :cond_38

    .line 158
    :try_start_35
    invoke-virtual {v10}, Ljava/util/zip/ZipFile;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_b7

    :cond_38
    :goto_38
    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    move-object v5, v11

    .line 164
    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    .end local v7           #size:I
    :goto_3a
    return-object v5

    .line 129
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v7       #size:I
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :cond_3b
    const/high16 v0, 0x1

    .line 130
    .local v0, COUNT:I
    const/high16 v12, 0x1

    :try_start_3f
    new-array v1, v12, [B

    .line 131
    .local v1, buff:[B
    new-instance v5, Landroid/os/MemoryFile;

    const/4 v12, 0x0

    invoke-direct {v5, v12, v7}, Landroid/os/MemoryFile;-><init>(Ljava/lang/String;I)V

    .line 132
    .local v5, mf:Landroid/os/MemoryFile;
    const/4 v6, -0x1

    .line 133
    .local v6, read:I
    const/4 v8, 0x0

    .line 134
    .local v8, start:I
    :goto_49
    const/4 v12, 0x0

    const/high16 v13, 0x1

    invoke-virtual {v4, v1, v12, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-lez v6, :cond_58

    .line 135
    const/4 v12, 0x0

    invoke-virtual {v5, v1, v12, v8, v6}, Landroid/os/MemoryFile;->writeBytes([BIII)V

    .line 136
    add-int/2addr v8, v6

    goto :goto_49

    .line 138
    :cond_58
    invoke-virtual {v5}, Landroid/os/MemoryFile;->length()I
    :try_end_5b
    .catchall {:try_start_3f .. :try_end_5b} :catchall_c7
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_5b} :catch_cd
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3f .. :try_end_5b} :catch_ca

    move-result v12

    if-lez v12, :cond_6a

    .line 146
    if-eqz v4, :cond_63

    .line 150
    :try_start_60
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_b9

    .line 156
    :cond_63
    :goto_63
    if-eqz v10, :cond_68

    .line 158
    :try_start_65
    invoke-virtual {v10}, Ljava/util/zip/ZipFile;->close()V
    :try_end_68
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_68} :catch_bb

    :cond_68
    :goto_68
    move-object v9, v10

    .line 160
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_3a

    .line 146
    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v5           #mf:Landroid/os/MemoryFile;
    .end local v6           #read:I
    .end local v7           #size:I
    .end local v8           #start:I
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :cond_6a
    if-eqz v4, :cond_6f

    .line 150
    :try_start_6c
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_bd

    .line 156
    :cond_6f
    :goto_6f
    if-eqz v10, :cond_d0

    .line 158
    :try_start_71
    invoke-virtual {v10}, Ljava/util/zip/ZipFile;->close()V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_74} :catch_77

    move-object v9, v10

    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    :cond_75
    :goto_75
    move-object v5, v11

    .line 164
    goto :goto_3a

    .line 159
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_77
    move-exception v12

    move-object v9, v10

    .line 160
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_75

    .line 141
    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    :catch_7a
    move-exception v2

    .line 142
    .local v2, e:Ljava/io/IOException;
    :goto_7b
    :try_start_7b
    const-string v12, "MAML_ZipResourceLoader"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_84
    .catchall {:try_start_7b .. :try_end_84} :catchall_a8

    .line 146
    if-eqz v4, :cond_89

    .line 150
    :try_start_86
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_89} :catch_bf

    .line 156
    :cond_89
    :goto_89
    if-eqz v9, :cond_75

    .line 158
    :try_start_8b
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_8e
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_8e} :catch_8f

    goto :goto_75

    .line 159
    :catch_8f
    move-exception v12

    goto :goto_75

    .line 143
    .end local v2           #e:Ljava/io/IOException;
    :catch_91
    move-exception v2

    .line 144
    .local v2, e:Ljava/lang/OutOfMemoryError;
    :goto_92
    :try_start_92
    const-string v12, "MAML_ZipResourceLoader"

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9b
    .catchall {:try_start_92 .. :try_end_9b} :catchall_a8

    .line 146
    if-eqz v4, :cond_a0

    .line 150
    :try_start_9d
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_a0
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_a0} :catch_c1

    .line 156
    :cond_a0
    :goto_a0
    if-eqz v9, :cond_75

    .line 158
    :try_start_a2
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_a5
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_a5} :catch_a6

    goto :goto_75

    .line 159
    :catch_a6
    move-exception v12

    goto :goto_75

    .line 146
    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catchall_a8
    move-exception v11

    :goto_a9
    if-eqz v4, :cond_ae

    .line 150
    :try_start_ab
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_ae} :catch_c3

    .line 156
    :cond_ae
    :goto_ae
    if-eqz v9, :cond_b3

    .line 158
    :try_start_b0
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b3} :catch_c5

    .line 160
    :cond_b3
    :goto_b3
    throw v11

    .line 151
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v7       #size:I
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_b4
    move-exception v12

    goto/16 :goto_33

    .line 159
    :catch_b7
    move-exception v12

    goto :goto_38

    .line 151
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    .restart local v5       #mf:Landroid/os/MemoryFile;
    .restart local v6       #read:I
    .restart local v8       #start:I
    :catch_b9
    move-exception v11

    goto :goto_63

    .line 159
    :catch_bb
    move-exception v11

    goto :goto_68

    .line 151
    .end local v0           #COUNT:I
    .end local v1           #buff:[B
    .end local v5           #mf:Landroid/os/MemoryFile;
    .end local v6           #read:I
    .end local v7           #size:I
    .end local v8           #start:I
    :catch_bd
    move-exception v12

    goto :goto_6f

    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .local v2, e:Ljava/io/IOException;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    :catch_bf
    move-exception v12

    goto :goto_89

    .local v2, e:Ljava/lang/OutOfMemoryError;
    :catch_c1
    move-exception v12

    goto :goto_a0

    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catch_c3
    move-exception v12

    goto :goto_ae

    .line 159
    :catch_c5
    move-exception v12

    goto :goto_b3

    .line 146
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catchall_c7
    move-exception v11

    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_a9

    .line 143
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_ca
    move-exception v2

    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_92

    .line 141
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_cd
    move-exception v2

    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_7b

    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :cond_d0
    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_75
.end method

.method public getManifestRoot()Lorg/w3c/dom/Element;
    .registers 13

    .prologue
    const/4 v9, 0x0

    .line 169
    const/4 v7, 0x0

    .line 170
    .local v7, zip:Ljava/util/zip/ZipFile;
    const/4 v5, 0x0

    .line 172
    .local v5, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v8, Ljava/util/zip/ZipFile;

    iget-object v10, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v8, v10}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_12a
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_b3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_ca
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_3 .. :try_end_a} :catch_e1
    .catch Lorg/xml/sax/SAXException; {:try_start_3 .. :try_end_a} :catch_f8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a} :catch_111

    .line 173
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .local v8, zip:Ljava/util/zip/ZipFile;
    const/4 v4, 0x0

    .line 174
    .local v4, entry:Ljava/util/zip/ZipEntry;
    :try_start_b
    iget-object v10, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_32

    .line 175
    iget-object v10, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    iget-object v11, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v10, v11}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 176
    .local v6, manifestName:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    .line 178
    .end local v6           #manifestName:Ljava/lang/String;
    :cond_32
    if-nez v4, :cond_5b

    iget-object v10, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_5b

    .line 179
    iget-object v10, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    iget-object v11, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-static {v10, v11}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 180
    .restart local v6       #manifestName:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    .line 183
    .end local v6           #manifestName:Ljava/lang/String;
    :cond_5b
    if-nez v4, :cond_76

    .line 184
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    .line 186
    :cond_76
    if-eqz v4, :cond_a6

    .line 187
    invoke-virtual {v8, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_7b
    .catchall {:try_start_b .. :try_end_7b} :catchall_154
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_7b} :catch_164
    .catch Ljava/lang/OutOfMemoryError; {:try_start_b .. :try_end_7b} :catch_160
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_b .. :try_end_7b} :catch_15d
    .catch Lorg/xml/sax/SAXException; {:try_start_b .. :try_end_7b} :catch_15a
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_7b} :catch_157

    move-result-object v5

    .line 188
    if-nez v5, :cond_8a

    .line 206
    if-eqz v5, :cond_83

    .line 210
    :try_start_80
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_83
    .catch Ljava/io/IOException; {:try_start_80 .. :try_end_83} :catch_136

    .line 216
    :cond_83
    :goto_83
    if-eqz v8, :cond_88

    .line 218
    :try_start_85
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_88} :catch_139

    :cond_88
    :goto_88
    move-object v7, v8

    .line 224
    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    :cond_89
    :goto_89
    return-object v9

    .line 190
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_8a
    :try_start_8a
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 191
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 192
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 193
    .local v2, doc:Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;
    :try_end_99
    .catchall {:try_start_8a .. :try_end_99} :catchall_154
    .catch Ljava/io/IOException; {:try_start_8a .. :try_end_99} :catch_164
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8a .. :try_end_99} :catch_160
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_8a .. :try_end_99} :catch_15d
    .catch Lorg/xml/sax/SAXException; {:try_start_8a .. :try_end_99} :catch_15a
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_99} :catch_157

    move-result-object v9

    .line 206
    if-eqz v5, :cond_9f

    .line 210
    :try_start_9c
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_9f} :catch_13c

    .line 216
    :cond_9f
    :goto_9f
    if-eqz v8, :cond_a4

    .line 218
    :try_start_a1
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_a4
    .catch Ljava/io/IOException; {:try_start_a1 .. :try_end_a4} :catch_13f

    :cond_a4
    :goto_a4
    move-object v7, v8

    .line 220
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_89

    .line 206
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_a6
    if-eqz v5, :cond_a9

    .line 210
    :try_start_a8
    throw v5
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a8 .. :try_end_a9} :catch_142

    .line 216
    :cond_a9
    :goto_a9
    if-eqz v8, :cond_168

    .line 218
    :try_start_ab
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_ae} :catch_b0

    move-object v7, v8

    .line 220
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_89

    .line 219
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_b0
    move-exception v10

    move-object v7, v8

    .line 220
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_89

    .line 195
    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    :catch_b3
    move-exception v3

    .line 196
    .local v3, e:Ljava/io/IOException;
    :goto_b4
    :try_start_b4
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_bd
    .catchall {:try_start_b4 .. :try_end_bd} :catchall_12a

    .line 206
    if-eqz v5, :cond_c2

    .line 210
    :try_start_bf
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_c2
    .catch Ljava/io/IOException; {:try_start_bf .. :try_end_c2} :catch_145

    .line 216
    :cond_c2
    :goto_c2
    if-eqz v7, :cond_89

    .line 218
    :try_start_c4
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_c4 .. :try_end_c7} :catch_c8

    goto :goto_89

    .line 219
    :catch_c8
    move-exception v10

    goto :goto_89

    .line 197
    .end local v3           #e:Ljava/io/IOException;
    :catch_ca
    move-exception v3

    .line 198
    .local v3, e:Ljava/lang/OutOfMemoryError;
    :goto_cb
    :try_start_cb
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d4
    .catchall {:try_start_cb .. :try_end_d4} :catchall_12a

    .line 206
    if-eqz v5, :cond_d9

    .line 210
    :try_start_d6
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_d9
    .catch Ljava/io/IOException; {:try_start_d6 .. :try_end_d9} :catch_148

    .line 216
    :cond_d9
    :goto_d9
    if-eqz v7, :cond_89

    .line 218
    :try_start_db
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_de} :catch_df

    goto :goto_89

    .line 219
    :catch_df
    move-exception v10

    goto :goto_89

    .line 199
    .end local v3           #e:Ljava/lang/OutOfMemoryError;
    :catch_e1
    move-exception v3

    .line 200
    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :goto_e2
    :try_start_e2
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_eb
    .catchall {:try_start_e2 .. :try_end_eb} :catchall_12a

    .line 206
    if-eqz v5, :cond_f0

    .line 210
    :try_start_ed
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_f0
    .catch Ljava/io/IOException; {:try_start_ed .. :try_end_f0} :catch_14a

    .line 216
    :cond_f0
    :goto_f0
    if-eqz v7, :cond_89

    .line 218
    :try_start_f2
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_f5
    .catch Ljava/io/IOException; {:try_start_f2 .. :try_end_f5} :catch_f6

    goto :goto_89

    .line 219
    :catch_f6
    move-exception v10

    goto :goto_89

    .line 201
    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_f8
    move-exception v3

    .line 202
    .local v3, e:Lorg/xml/sax/SAXException;
    :goto_f9
    :try_start_f9
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_102
    .catchall {:try_start_f9 .. :try_end_102} :catchall_12a

    .line 206
    if-eqz v5, :cond_107

    .line 210
    :try_start_104
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_107
    .catch Ljava/io/IOException; {:try_start_104 .. :try_end_107} :catch_14c

    .line 216
    :cond_107
    :goto_107
    if-eqz v7, :cond_89

    .line 218
    :try_start_109
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_10c
    .catch Ljava/io/IOException; {:try_start_109 .. :try_end_10c} :catch_10e

    goto/16 :goto_89

    .line 219
    :catch_10e
    move-exception v10

    goto/16 :goto_89

    .line 203
    .end local v3           #e:Lorg/xml/sax/SAXException;
    :catch_111
    move-exception v3

    .line 204
    .local v3, e:Ljava/lang/Exception;
    :goto_112
    :try_start_112
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11b
    .catchall {:try_start_112 .. :try_end_11b} :catchall_12a

    .line 206
    if-eqz v5, :cond_120

    .line 210
    :try_start_11d
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_120
    .catch Ljava/io/IOException; {:try_start_11d .. :try_end_120} :catch_14e

    .line 216
    :cond_120
    :goto_120
    if-eqz v7, :cond_89

    .line 218
    :try_start_122
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_125
    .catch Ljava/io/IOException; {:try_start_122 .. :try_end_125} :catch_127

    goto/16 :goto_89

    .line 219
    :catch_127
    move-exception v10

    goto/16 :goto_89

    .line 206
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_12a
    move-exception v9

    :goto_12b
    if-eqz v5, :cond_130

    .line 210
    :try_start_12d
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_130
    .catch Ljava/io/IOException; {:try_start_12d .. :try_end_130} :catch_150

    .line 216
    :cond_130
    :goto_130
    if-eqz v7, :cond_135

    .line 218
    :try_start_132
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_135
    .catch Ljava/io/IOException; {:try_start_132 .. :try_end_135} :catch_152

    .line 220
    :cond_135
    :goto_135
    throw v9

    .line 211
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_136
    move-exception v10

    goto/16 :goto_83

    .line 219
    :catch_139
    move-exception v10

    goto/16 :goto_88

    .line 211
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v1       #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    :catch_13c
    move-exception v10

    goto/16 :goto_9f

    .line 219
    :catch_13f
    move-exception v10

    goto/16 :goto_a4

    .line 211
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    :catch_142
    move-exception v10

    goto/16 :goto_a9

    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .local v3, e:Ljava/io/IOException;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    :catch_145
    move-exception v10

    goto/16 :goto_c2

    .local v3, e:Ljava/lang/OutOfMemoryError;
    :catch_148
    move-exception v10

    goto :goto_d9

    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_14a
    move-exception v10

    goto :goto_f0

    .local v3, e:Lorg/xml/sax/SAXException;
    :catch_14c
    move-exception v10

    goto :goto_107

    .local v3, e:Ljava/lang/Exception;
    :catch_14e
    move-exception v10

    goto :goto_120

    .end local v3           #e:Ljava/lang/Exception;
    :catch_150
    move-exception v10

    goto :goto_130

    .line 219
    :catch_152
    move-exception v10

    goto :goto_135

    .line 206
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catchall_154
    move-exception v9

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_12b

    .line 203
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_157
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_112

    .line 201
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_15a
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_f9

    .line 199
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_15d
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_e2

    .line 197
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_160
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_cb

    .line 195
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_164
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_b4

    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_168
    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_89
.end method
