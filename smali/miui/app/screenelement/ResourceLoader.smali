.class public abstract Lmiui/app/screenelement/ResourceLoader;
.super Ljava/lang/Object;
.source "ResourceLoader.java"


# instance fields
.field protected mLanguageCountrySuffix:Ljava/lang/String;

.field protected mLanguageSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getBitmapInfo(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lmiui/app/screenelement/ResourceManager$BitmapInfo;
.end method

.method public abstract getFile(Ljava/lang/String;)Landroid/os/MemoryFile;
.end method

.method public abstract getManifestRoot()Lorg/w3c/dom/Element;
.end method

.method public setLocal(Ljava/util/Locale;)Lmiui/app/screenelement/ResourceLoader;
    .registers 4
    .parameter "locale"

    .prologue
    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    iget-object v0, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    iget-object v1, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageCountrySuffix:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ResourceLoader;->mLanguageSuffix:Ljava/lang/String;

    :cond_1b
    return-object p0
.end method
