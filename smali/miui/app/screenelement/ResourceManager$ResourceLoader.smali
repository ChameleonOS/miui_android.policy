.class public interface abstract Lmiui/app/screenelement/ResourceManager$ResourceLoader;
.super Ljava/lang/Object;
.source "ResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ResourceLoader"
.end annotation


# virtual methods
.method public abstract getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
.end method

.method public abstract getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
.end method

.method public abstract getManifestRoot()Lorg/w3c/dom/Element;
.end method

.method public abstract getManifestRoot(Ljava/lang/String;)Lorg/w3c/dom/Element;
.end method
