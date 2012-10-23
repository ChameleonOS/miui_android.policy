.class public Lmiui/app/screenelement/util/ZipResourceLoader;
.super Ljava/lang/Object;
.source "ZipResourceLoader.java"

# interfaces
.implements Lmiui/app/screenelement/ResourceManager$ResourceLoader;


# static fields
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
    .line 42
    const/4 v0, 0x0

    const-string v1, "manifest.xml"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/util/ZipResourceLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .parameter "zipPath"
    .parameter "innerPath"

    .prologue
    .line 46
    const-string v0, "manifest.xml"

    invoke-direct {p0, p1, p2, v0}, Lmiui/app/screenelement/util/ZipResourceLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "zipPath"
    .parameter "innerPath"
    .parameter "manifestName"

    .prologue
    .line 55
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "empty zip path"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_11
    iput-object p1, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    .line 60
    if-nez p2, :cond_17

    const-string p2, ""

    .end local p2
    :cond_17
    iput-object p2, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mInnerPath:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    .registers 13
    .parameter "src"
    .parameter "opts"

    .prologue
    const/4 v7, 0x0

    .line 66
    const/4 v5, 0x0

    .line 67
    .local v5, zip:Ljava/util/zip/ZipFile;
    const/4 v3, 0x0

    .line 69
    .local v3, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v6, Ljava/util/zip/ZipFile;

    iget-object v8, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v6, v8}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8b
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_5d
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_74

    .line 70
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .local v6, zip:Ljava/util/zip/ZipFile;
    :try_start_a
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

    .line 71
    .local v2, entry:Ljava/util/zip/ZipEntry;
    if-eqz v2, :cond_50

    .line 72
    invoke-virtual {v6, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    .line 73
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 74
    .local v4, padding:Landroid/graphics/Rect;
    invoke-static {v3, v4, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_2f
    .catchall {:try_start_a .. :try_end_2f} :catchall_a9
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_2f} :catch_af
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_2f} :catch_ac

    move-result-object v0

    .line 75
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_3e

    .line 84
    if-eqz v3, :cond_37

    .line 88
    :try_start_34
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_37} :catch_97

    .line 94
    :cond_37
    :goto_37
    if-eqz v6, :cond_3c

    .line 96
    :try_start_39
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_99

    :cond_3c
    :goto_3c
    move-object v5, v6

    .line 102
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    .end local v4           #padding:Landroid/graphics/Rect;
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    :cond_3d
    :goto_3d
    return-object v7

    .line 77
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v4       #padding:Landroid/graphics/Rect;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_3e
    :try_start_3e
    new-instance v8, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    invoke-direct {v8, v0, v4}, Lmiui/app/screenelement/ResourceManager$BitmapInfo;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)V
    :try_end_43
    .catchall {:try_start_3e .. :try_end_43} :catchall_a9
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_43} :catch_af
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3e .. :try_end_43} :catch_ac

    .line 84
    if-eqz v3, :cond_48

    .line 88
    :try_start_45
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_9b

    .line 94
    :cond_48
    :goto_48
    if-eqz v6, :cond_4d

    .line 96
    :try_start_4a
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_9d

    :cond_4d
    :goto_4d
    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    move-object v7, v8

    .line 98
    goto :goto_3d

    .line 84
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v4           #padding:Landroid/graphics/Rect;
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_50
    if-eqz v3, :cond_53

    .line 88
    :try_start_52
    throw v3
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_53} :catch_9f

    .line 94
    :cond_53
    :goto_53
    if-eqz v6, :cond_b2

    .line 96
    :try_start_55
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_5a

    move-object v5, v6

    .line 98
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_3d

    .line 97
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_5a
    move-exception v8

    move-object v5, v6

    .line 98
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_3d

    .line 79
    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    :catch_5d
    move-exception v1

    .line 80
    .local v1, e:Ljava/io/IOException;
    :goto_5e
    :try_start_5e
    const-string v8, "MAML_ZipResourceLoader"

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_67
    .catchall {:try_start_5e .. :try_end_67} :catchall_8b

    .line 84
    if-eqz v3, :cond_6c

    .line 88
    :try_start_69
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6c
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_6c} :catch_a1

    .line 94
    :cond_6c
    :goto_6c
    if-eqz v5, :cond_3d

    .line 96
    :try_start_6e
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_72

    goto :goto_3d

    .line 97
    :catch_72
    move-exception v8

    goto :goto_3d

    .line 81
    .end local v1           #e:Ljava/io/IOException;
    :catch_74
    move-exception v1

    .line 82
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :goto_75
    :try_start_75
    const-string v8, "MAML_ZipResourceLoader"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7e
    .catchall {:try_start_75 .. :try_end_7e} :catchall_8b

    .line 84
    if-eqz v3, :cond_83

    .line 88
    :try_start_80
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_83
    .catch Ljava/io/IOException; {:try_start_80 .. :try_end_83} :catch_a3

    .line 94
    :cond_83
    :goto_83
    if-eqz v5, :cond_3d

    .line 96
    :try_start_85
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_88} :catch_89

    goto :goto_3d

    .line 97
    :catch_89
    move-exception v8

    goto :goto_3d

    .line 84
    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :catchall_8b
    move-exception v7

    :goto_8c
    if-eqz v3, :cond_91

    .line 88
    :try_start_8e
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_91} :catch_a5

    .line 94
    :cond_91
    :goto_91
    if-eqz v5, :cond_96

    .line 96
    :try_start_93
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_96
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_96} :catch_a7

    .line 98
    :cond_96
    :goto_96
    throw v7

    .line 89
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v4       #padding:Landroid/graphics/Rect;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_97
    move-exception v8

    goto :goto_37

    .line 97
    :catch_99
    move-exception v8

    goto :goto_3c

    .line 89
    :catch_9b
    move-exception v7

    goto :goto_48

    .line 97
    :catch_9d
    move-exception v7

    goto :goto_4d

    .line 89
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v4           #padding:Landroid/graphics/Rect;
    :catch_9f
    move-exception v8

    goto :goto_53

    .end local v2           #entry:Ljava/util/zip/ZipEntry;
    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .local v1, e:Ljava/io/IOException;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    :catch_a1
    move-exception v8

    goto :goto_6c

    .local v1, e:Ljava/lang/OutOfMemoryError;
    :catch_a3
    move-exception v8

    goto :goto_83

    .end local v1           #e:Ljava/lang/OutOfMemoryError;
    :catch_a5
    move-exception v8

    goto :goto_91

    .line 97
    :catch_a7
    move-exception v8

    goto :goto_96

    .line 84
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catchall_a9
    move-exception v7

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_8c

    .line 81
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_ac
    move-exception v1

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_75

    .line 79
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :catch_af
    move-exception v1

    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_5e

    .end local v5           #zip:Ljava/util/zip/ZipFile;
    .restart local v2       #entry:Ljava/util/zip/ZipEntry;
    .restart local v6       #zip:Ljava/util/zip/ZipFile;
    :cond_b2
    move-object v5, v6

    .end local v6           #zip:Ljava/util/zip/ZipFile;
    .restart local v5       #zip:Ljava/util/zip/ZipFile;
    goto :goto_3d
.end method

.method public getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
    .registers 16
    .parameter "src"

    .prologue
    const/4 v11, 0x0

    .line 107
    const/4 v9, 0x0

    .line 108
    .local v9, zip:Ljava/util/zip/ZipFile;
    const/4 v4, 0x0

    .line 110
    .local v4, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v10, Ljava/util/zip/ZipFile;

    iget-object v12, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v10, v12}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_a8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_7a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_91

    .line 111
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

    .line 112
    .local v3, entry:Ljava/util/zip/ZipEntry;
    if-eqz v3, :cond_6a

    .line 113
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v12

    long-to-int v7, v12

    .line 114
    .local v7, size:I
    invoke-virtual {v10, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_2b
    .catchall {:try_start_a .. :try_end_2b} :catchall_c7
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_2b} :catch_cd
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_2b} :catch_ca

    move-result-object v4

    .line 115
    if-nez v4, :cond_3b

    .line 135
    if-eqz v4, :cond_33

    .line 139
    :try_start_30
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_b4

    .line 145
    :cond_33
    :goto_33
    if-eqz v10, :cond_38

    .line 147
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

    .line 153
    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    .end local v7           #size:I
    :goto_3a
    return-object v5

    .line 118
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v7       #size:I
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :cond_3b
    const/high16 v0, 0x1

    .line 119
    .local v0, COUNT:I
    const/high16 v12, 0x1

    :try_start_3f
    new-array v1, v12, [B

    .line 120
    .local v1, buff:[B
    new-instance v5, Landroid/os/MemoryFile;

    const/4 v12, 0x0

    invoke-direct {v5, v12, v7}, Landroid/os/MemoryFile;-><init>(Ljava/lang/String;I)V

    .line 121
    .local v5, mf:Landroid/os/MemoryFile;
    const/4 v6, -0x1

    .line 122
    .local v6, read:I
    const/4 v8, 0x0

    .line 123
    .local v8, start:I
    :goto_49
    const/4 v12, 0x0

    const/high16 v13, 0x1

    invoke-virtual {v4, v1, v12, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-lez v6, :cond_58

    .line 124
    const/4 v12, 0x0

    invoke-virtual {v5, v1, v12, v8, v6}, Landroid/os/MemoryFile;->writeBytes([BIII)V

    .line 125
    add-int/2addr v8, v6

    goto :goto_49

    .line 127
    :cond_58
    invoke-virtual {v5}, Landroid/os/MemoryFile;->length()I
    :try_end_5b
    .catchall {:try_start_3f .. :try_end_5b} :catchall_c7
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_5b} :catch_cd
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3f .. :try_end_5b} :catch_ca

    move-result v12

    if-lez v12, :cond_6a

    .line 135
    if-eqz v4, :cond_63

    .line 139
    :try_start_60
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_b9

    .line 145
    :cond_63
    :goto_63
    if-eqz v10, :cond_68

    .line 147
    :try_start_65
    invoke-virtual {v10}, Ljava/util/zip/ZipFile;->close()V
    :try_end_68
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_68} :catch_bb

    :cond_68
    :goto_68
    move-object v9, v10

    .line 149
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_3a

    .line 135
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

    .line 139
    :try_start_6c
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_bd

    .line 145
    :cond_6f
    :goto_6f
    if-eqz v10, :cond_d0

    .line 147
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

    .line 153
    goto :goto_3a

    .line 148
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_77
    move-exception v12

    move-object v9, v10

    .line 149
    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_75

    .line 130
    .end local v3           #entry:Ljava/util/zip/ZipEntry;
    :catch_7a
    move-exception v2

    .line 131
    .local v2, e:Ljava/io/IOException;
    :goto_7b
    :try_start_7b
    const-string v12, "MAML_ZipResourceLoader"

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_84
    .catchall {:try_start_7b .. :try_end_84} :catchall_a8

    .line 135
    if-eqz v4, :cond_89

    .line 139
    :try_start_86
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_89} :catch_bf

    .line 145
    :cond_89
    :goto_89
    if-eqz v9, :cond_75

    .line 147
    :try_start_8b
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_8e
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_8e} :catch_8f

    goto :goto_75

    .line 148
    :catch_8f
    move-exception v12

    goto :goto_75

    .line 132
    .end local v2           #e:Ljava/io/IOException;
    :catch_91
    move-exception v2

    .line 133
    .local v2, e:Ljava/lang/OutOfMemoryError;
    :goto_92
    :try_start_92
    const-string v12, "MAML_ZipResourceLoader"

    invoke-virtual {v2}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9b
    .catchall {:try_start_92 .. :try_end_9b} :catchall_a8

    .line 135
    if-eqz v4, :cond_a0

    .line 139
    :try_start_9d
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_a0
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_a0} :catch_c1

    .line 145
    :cond_a0
    :goto_a0
    if-eqz v9, :cond_75

    .line 147
    :try_start_a2
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_a5
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_a5} :catch_a6

    goto :goto_75

    .line 148
    :catch_a6
    move-exception v12

    goto :goto_75

    .line 135
    .end local v2           #e:Ljava/lang/OutOfMemoryError;
    :catchall_a8
    move-exception v11

    :goto_a9
    if-eqz v4, :cond_ae

    .line 139
    :try_start_ab
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_ae} :catch_c3

    .line 145
    :cond_ae
    :goto_ae
    if-eqz v9, :cond_b3

    .line 147
    :try_start_b0
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b3} :catch_c5

    .line 149
    :cond_b3
    :goto_b3
    throw v11

    .line 140
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v3       #entry:Ljava/util/zip/ZipEntry;
    .restart local v7       #size:I
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_b4
    move-exception v12

    goto/16 :goto_33

    .line 148
    :catch_b7
    move-exception v12

    goto :goto_38

    .line 140
    .restart local v0       #COUNT:I
    .restart local v1       #buff:[B
    .restart local v5       #mf:Landroid/os/MemoryFile;
    .restart local v6       #read:I
    .restart local v8       #start:I
    :catch_b9
    move-exception v11

    goto :goto_63

    .line 148
    :catch_bb
    move-exception v11

    goto :goto_68

    .line 140
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

    .line 148
    :catch_c5
    move-exception v12

    goto :goto_b3

    .line 135
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catchall_c7
    move-exception v11

    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_a9

    .line 132
    .end local v9           #zip:Ljava/util/zip/ZipFile;
    .restart local v10       #zip:Ljava/util/zip/ZipFile;
    :catch_ca
    move-exception v2

    move-object v9, v10

    .end local v10           #zip:Ljava/util/zip/ZipFile;
    .restart local v9       #zip:Ljava/util/zip/ZipFile;
    goto :goto_92

    .line 130
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
    .registers 2

    .prologue
    .line 214
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/util/ZipResourceLoader;->getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method public getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 14
    .parameter "language"

    .prologue
    const/4 v9, 0x0

    .line 158
    const/4 v7, 0x0

    .line 159
    .local v7, zip:Ljava/util/zip/ZipFile;
    const/4 v5, 0x0

    .line 161
    .local v5, is:Ljava/io/InputStream;
    :try_start_3
    new-instance v8, Ljava/util/zip/ZipFile;

    iget-object v10, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mResourcePath:Ljava/lang/String;

    invoke-direct {v8, v10}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_100
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_a} :catch_89
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_a} :catch_a0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_3 .. :try_end_a} :catch_b7
    .catch Lorg/xml/sax/SAXException; {:try_start_3 .. :try_end_a} :catch_ce
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a} :catch_e7

    .line 162
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .local v8, zip:Ljava/util/zip/ZipFile;
    :try_start_a
    iget-object v6, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    .line 163
    .local v6, manifestName:Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_33

    .line 164
    iget-object v10, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    invoke-static {v10, p1}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 165
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

    move-result-object v10

    if-eqz v10, :cond_33

    .line 166
    iget-object v6, p0, Lmiui/app/screenelement/util/ZipResourceLoader;->mManifestName:Ljava/lang/String;

    .line 170
    :cond_33
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

    .line 171
    .local v4, entry:Ljava/util/zip/ZipEntry;
    if-eqz v4, :cond_7c

    .line 172
    invoke-virtual {v8, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_51
    .catchall {:try_start_a .. :try_end_51} :catchall_12a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_51} :catch_13a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_51} :catch_136
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_a .. :try_end_51} :catch_133
    .catch Lorg/xml/sax/SAXException; {:try_start_a .. :try_end_51} :catch_130
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_51} :catch_12d

    move-result-object v5

    .line 173
    if-nez v5, :cond_60

    .line 191
    if-eqz v5, :cond_59

    .line 195
    :try_start_56
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_10c

    .line 201
    :cond_59
    :goto_59
    if-eqz v8, :cond_5e

    .line 203
    :try_start_5b
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_10f

    :cond_5e
    :goto_5e
    move-object v7, v8

    .line 209
    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    .end local v6           #manifestName:Ljava/lang/String;
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    :cond_5f
    :goto_5f
    return-object v9

    .line 175
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v6       #manifestName:Ljava/lang/String;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_60
    :try_start_60
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 176
    .local v1, dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 177
    .local v0, db:Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, v5}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 178
    .local v2, doc:Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;
    :try_end_6f
    .catchall {:try_start_60 .. :try_end_6f} :catchall_12a
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_6f} :catch_13a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_60 .. :try_end_6f} :catch_136
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_60 .. :try_end_6f} :catch_133
    .catch Lorg/xml/sax/SAXException; {:try_start_60 .. :try_end_6f} :catch_130
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_6f} :catch_12d

    move-result-object v9

    .line 191
    if-eqz v5, :cond_75

    .line 195
    :try_start_72
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_112

    .line 201
    :cond_75
    :goto_75
    if-eqz v8, :cond_7a

    .line 203
    :try_start_77
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_115

    :cond_7a
    :goto_7a
    move-object v7, v8

    .line 205
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_5f

    .line 191
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_7c
    if-eqz v5, :cond_7f

    .line 195
    :try_start_7e
    throw v5
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_7f} :catch_118

    .line 201
    :cond_7f
    :goto_7f
    if-eqz v8, :cond_13e

    .line 203
    :try_start_81
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_86

    move-object v7, v8

    .line 205
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_5f

    .line 204
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_86
    move-exception v10

    move-object v7, v8

    .line 205
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_5f

    .line 180
    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    .end local v6           #manifestName:Ljava/lang/String;
    :catch_89
    move-exception v3

    .line 181
    .local v3, e:Ljava/io/IOException;
    :goto_8a
    :try_start_8a
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_93
    .catchall {:try_start_8a .. :try_end_93} :catchall_100

    .line 191
    if-eqz v5, :cond_98

    .line 195
    :try_start_95
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_95 .. :try_end_98} :catch_11b

    .line 201
    :cond_98
    :goto_98
    if-eqz v7, :cond_5f

    .line 203
    :try_start_9a
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_9d} :catch_9e

    goto :goto_5f

    .line 204
    :catch_9e
    move-exception v10

    goto :goto_5f

    .line 182
    .end local v3           #e:Ljava/io/IOException;
    :catch_a0
    move-exception v3

    .line 183
    .local v3, e:Ljava/lang/OutOfMemoryError;
    :goto_a1
    :try_start_a1
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_aa
    .catchall {:try_start_a1 .. :try_end_aa} :catchall_100

    .line 191
    if-eqz v5, :cond_af

    .line 195
    :try_start_ac
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_af
    .catch Ljava/io/IOException; {:try_start_ac .. :try_end_af} :catch_11e

    .line 201
    :cond_af
    :goto_af
    if-eqz v7, :cond_5f

    .line 203
    :try_start_b1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_b4
    .catch Ljava/io/IOException; {:try_start_b1 .. :try_end_b4} :catch_b5

    goto :goto_5f

    .line 204
    :catch_b5
    move-exception v10

    goto :goto_5f

    .line 184
    .end local v3           #e:Ljava/lang/OutOfMemoryError;
    :catch_b7
    move-exception v3

    .line 185
    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :goto_b8
    :try_start_b8
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljavax/xml/parsers/ParserConfigurationException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c1
    .catchall {:try_start_b8 .. :try_end_c1} :catchall_100

    .line 191
    if-eqz v5, :cond_c6

    .line 195
    :try_start_c3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_c6
    .catch Ljava/io/IOException; {:try_start_c3 .. :try_end_c6} :catch_120

    .line 201
    :cond_c6
    :goto_c6
    if-eqz v7, :cond_5f

    .line 203
    :try_start_c8
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cb} :catch_cc

    goto :goto_5f

    .line 204
    :catch_cc
    move-exception v10

    goto :goto_5f

    .line 186
    .end local v3           #e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_ce
    move-exception v3

    .line 187
    .local v3, e:Lorg/xml/sax/SAXException;
    :goto_cf
    :try_start_cf
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Lorg/xml/sax/SAXException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d8
    .catchall {:try_start_cf .. :try_end_d8} :catchall_100

    .line 191
    if-eqz v5, :cond_dd

    .line 195
    :try_start_da
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_dd
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_dd} :catch_122

    .line 201
    :cond_dd
    :goto_dd
    if-eqz v7, :cond_5f

    .line 203
    :try_start_df
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_e4

    goto/16 :goto_5f

    .line 204
    :catch_e4
    move-exception v10

    goto/16 :goto_5f

    .line 188
    .end local v3           #e:Lorg/xml/sax/SAXException;
    :catch_e7
    move-exception v3

    .line 189
    .local v3, e:Ljava/lang/Exception;
    :goto_e8
    :try_start_e8
    const-string v10, "MAML_ZipResourceLoader"

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f1
    .catchall {:try_start_e8 .. :try_end_f1} :catchall_100

    .line 191
    if-eqz v5, :cond_f6

    .line 195
    :try_start_f3
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_f6
    .catch Ljava/io/IOException; {:try_start_f3 .. :try_end_f6} :catch_124

    .line 201
    :cond_f6
    :goto_f6
    if-eqz v7, :cond_5f

    .line 203
    :try_start_f8
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_fb
    .catch Ljava/io/IOException; {:try_start_f8 .. :try_end_fb} :catch_fd

    goto/16 :goto_5f

    .line 204
    :catch_fd
    move-exception v10

    goto/16 :goto_5f

    .line 191
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_100
    move-exception v9

    :goto_101
    if-eqz v5, :cond_106

    .line 195
    :try_start_103
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_106
    .catch Ljava/io/IOException; {:try_start_103 .. :try_end_106} :catch_126

    .line 201
    :cond_106
    :goto_106
    if-eqz v7, :cond_10b

    .line 203
    :try_start_108
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_10b
    .catch Ljava/io/IOException; {:try_start_108 .. :try_end_10b} :catch_128

    .line 205
    :cond_10b
    :goto_10b
    throw v9

    .line 196
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v6       #manifestName:Ljava/lang/String;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_10c
    move-exception v10

    goto/16 :goto_59

    .line 204
    :catch_10f
    move-exception v10

    goto/16 :goto_5e

    .line 196
    .restart local v0       #db:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v1       #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v2       #doc:Lorg/w3c/dom/Document;
    :catch_112
    move-exception v10

    goto/16 :goto_75

    .line 204
    :catch_115
    move-exception v10

    goto/16 :goto_7a

    .line 196
    .end local v0           #db:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #dbf:Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v2           #doc:Lorg/w3c/dom/Document;
    :catch_118
    move-exception v10

    goto/16 :goto_7f

    .end local v4           #entry:Ljava/util/zip/ZipEntry;
    .end local v6           #manifestName:Ljava/lang/String;
    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .local v3, e:Ljava/io/IOException;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    :catch_11b
    move-exception v10

    goto/16 :goto_98

    .local v3, e:Ljava/lang/OutOfMemoryError;
    :catch_11e
    move-exception v10

    goto :goto_af

    .local v3, e:Ljavax/xml/parsers/ParserConfigurationException;
    :catch_120
    move-exception v10

    goto :goto_c6

    .local v3, e:Lorg/xml/sax/SAXException;
    :catch_122
    move-exception v10

    goto :goto_dd

    .local v3, e:Ljava/lang/Exception;
    :catch_124
    move-exception v10

    goto :goto_f6

    .end local v3           #e:Ljava/lang/Exception;
    :catch_126
    move-exception v10

    goto :goto_106

    .line 204
    :catch_128
    move-exception v10

    goto :goto_10b

    .line 191
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catchall_12a
    move-exception v9

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_101

    .line 188
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_12d
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_e8

    .line 186
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_130
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_cf

    .line 184
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_133
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto :goto_b8

    .line 182
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_136
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_a1

    .line 180
    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :catch_13a
    move-exception v3

    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_8a

    .end local v7           #zip:Ljava/util/zip/ZipFile;
    .restart local v4       #entry:Ljava/util/zip/ZipEntry;
    .restart local v6       #manifestName:Ljava/lang/String;
    .restart local v8       #zip:Ljava/util/zip/ZipFile;
    :cond_13e
    move-object v7, v8

    .end local v8           #zip:Ljava/util/zip/ZipFile;
    .restart local v7       #zip:Ljava/util/zip/ZipFile;
    goto/16 :goto_5f
.end method
