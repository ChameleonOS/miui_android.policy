.class public Lmiui/app/screenelement/SoundManager;
.super Ljava/lang/Object;
.source "SoundManager.java"

# interfaces
.implements Landroid/media/SoundPool$OnLoadCompleteListener;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mContext:Landroid/content/Context;

.field private mPendingSoundMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mPlayingSoundMap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mResourceManager:Lmiui/app/screenelement/ResourceManager;

.field private mSoundPool:Landroid/media/SoundPool;

.field private mSoundPoolMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;)V
    .registers 7
    .parameter "context"
    .parameter "rm"

    .prologue
    .line 32
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPoolMap:Ljava/util/HashMap;

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPendingSoundMap:Ljava/util/HashMap;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPlayingSoundMap:Ljava/util/ArrayList;

    .line 33
    iput-object p2, p0, Lmiui/app/screenelement/SoundManager;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    .line 34
    iput-object p1, p0, Lmiui/app/screenelement/SoundManager;->mContext:Landroid/content/Context;

    .line 35
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/16 v3, 0x64

    invoke-direct {v0, v1, v2, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    .line 36
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, p0}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 37
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mAudioManager:Landroid/media/AudioManager;

    .line 38
    return-void
.end method

.method private declared-synchronized playSoundImp(IZ)V
    .registers 13
    .parameter "sound"
    .parameter "stopCur"

    .prologue
    .line 75
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_2d

    if-nez v0, :cond_7

    .line 87
    :goto_5
    monitor-exit p0

    return-void

    .line 78
    :cond_7
    if-eqz p2, :cond_35

    :try_start_9
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPlayingSoundMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_35

    .line 79
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPlayingSoundMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_17
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 80
    .local v9, sd:Ljava/lang/Integer;
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V
    :try_end_2c
    .catchall {:try_start_9 .. :try_end_2c} :catchall_2d

    goto :goto_17

    .line 75
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v9           #sd:Ljava/lang/Integer;
    :catchall_2d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 82
    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_30
    :try_start_30
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPlayingSoundMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 85
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_35
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    const/high16 v2, 0x3f80

    const/high16 v3, 0x3f80

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f80

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v7

    .line 86
    .local v7, cur:I
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPlayingSoundMap:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_4d
    .catchall {:try_start_30 .. :try_end_4d} :catchall_2d

    goto :goto_5
.end method


# virtual methods
.method public onLoadComplete(Landroid/media/SoundPool;II)V
    .registers 6
    .parameter "soundPool"
    .parameter "sampleId"
    .parameter "status"

    .prologue
    .line 91
    if-nez p3, :cond_15

    .line 92
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPendingSoundMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-direct {p0, p2, v0}, Lmiui/app/screenelement/SoundManager;->playSoundImp(IZ)V

    .line 94
    :cond_15
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPendingSoundMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    return-void
.end method

.method public declared-synchronized playSound(Ljava/lang/String;Z)V
    .registers 13
    .parameter "sound"
    .parameter "stopCur"

    .prologue
    .line 41
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mAudioManager:Landroid/media/AudioManager;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_4b

    if-nez v0, :cond_b

    .line 63
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 44
    :cond_b
    :try_start_b
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    if-nez v0, :cond_9

    .line 47
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 48
    .local v9, sd:Ljava/lang/Integer;
    if-nez v9, :cond_6c

    .line 49
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ResourceManager;->getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_4b

    move-result-object v8

    .line 51
    .local v8, file:Landroid/os/MemoryFile;
    :try_start_23
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v8}, Landroid/os/MemoryFile;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-virtual {v8}, Landroid/os/MemoryFile;->length()I

    move-result v4

    int-to-long v4, v4

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->load(Ljava/io/FileDescriptor;JJI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 52
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    invoke-virtual {v8}, Landroid/os/MemoryFile;->close()V
    :try_end_41
    .catchall {:try_start_23 .. :try_end_41} :catchall_4b
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_41} :catch_4e

    .line 58
    :goto_41
    :try_start_41
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mPendingSoundMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catchall {:try_start_41 .. :try_end_4a} :catchall_4b

    goto :goto_9

    .line 41
    .end local v8           #file:Landroid/os/MemoryFile;
    .end local v9           #sd:Ljava/lang/Integer;
    :catchall_4b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 54
    .restart local v8       #file:Landroid/os/MemoryFile;
    .restart local v9       #sd:Ljava/lang/Integer;
    :catch_4e
    move-exception v7

    .line 55
    .local v7, e:Ljava/io/IOException;
    :try_start_4f
    const-string v0, "Lockscreen_SoundManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fail to load sound. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_41

    .line 62
    .end local v7           #e:Ljava/io/IOException;
    .end local v8           #file:Landroid/os/MemoryFile;
    :cond_6c
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0, p2}, Lmiui/app/screenelement/SoundManager;->playSoundImp(IZ)V
    :try_end_73
    .catchall {:try_start_4f .. :try_end_73} :catchall_4b

    goto :goto_9
.end method

.method public declared-synchronized release()V
    .registers 3

    .prologue
    .line 66
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_18

    .line 67
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 68
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 69
    iget-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/SoundManager;->mSoundPool:Landroid/media/SoundPool;
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1a

    .line 72
    :cond_18
    monitor-exit p0

    return-void

    .line 66
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
