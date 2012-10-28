.class Lcom/android/internal/policy/impl/PasswordUnlockScreen$Injector;
.super Ljava/lang/Object;
.source "PasswordUnlockScreen.java"


# annotations
.annotation build Landroid/annotation/MiuiHook;
    value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_CLASS:Landroid/annotation/MiuiHook$MiuiHookType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/PasswordUnlockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clearPinLockForFindDevice(Lcom/android/internal/policy/impl/PasswordUnlockScreen;Ljava/lang/String;)V
    .registers 5
    .parameter "screen"
    .parameter "entry"

    .prologue
    const/4 v2, 0x0

    .line 90
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->mIsLockByFindDevice:Z

    if-eqz v0, :cond_1c

    .line 91
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->getLockPatternUtils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/internal/widget/LockPatternUtils;->clearLock(Z)V

    .line 92
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lmiui/provider/ExtraSettings$Secure;->FIND_DEVICE_PIN_LOCK:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 93
    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->mIsLockByFindDevice:Z

    .line 97
    :goto_1b
    return-void

    .line 95
    :cond_1c
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/security/KeyStore;->password(Ljava/lang/String;)Z

    goto :goto_1b
.end method

.method static hideKeyBoardViewIfNeed(Lcom/android/internal/policy/impl/PasswordUnlockScreen;)V
    .registers 3
    .parameter "screen"

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lmiui/view/inputmethod/CustomizedImeForMiui;->defaultImeIsCustomizedForMiui(Landroid/content/ContentResolver;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 101
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->getKeyboardView()Lcom/android/internal/widget/PasswordEntryKeyboardView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/PasswordEntryKeyboardView;->setVisibility(I)V

    .line 103
    :cond_17
    return-void
.end method

.method static initLockByFindDevice(Lcom/android/internal/policy/impl/PasswordUnlockScreen;)V
    .registers 5
    .parameter "screen"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 84
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lmiui/provider/ExtraSettings$Secure;->FIND_DEVICE_PIN_LOCK:Ljava/lang/String;

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_15

    :goto_12
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/PasswordUnlockScreen;->mIsLockByFindDevice:Z

    .line 87
    return-void

    :cond_15
    move v0, v1

    .line 84
    goto :goto_12
.end method

.method static initialize(Lcom/android/internal/policy/impl/PasswordUnlockScreen;)V
    .registers 1
    .parameter "screen"

    .prologue
    .line 79
    invoke-static {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen$Injector;->initLockByFindDevice(Lcom/android/internal/policy/impl/PasswordUnlockScreen;)V

    .line 80
    invoke-static {p0}, Lcom/android/internal/policy/impl/PasswordUnlockScreen$Injector;->hideKeyBoardViewIfNeed(Lcom/android/internal/policy/impl/PasswordUnlockScreen;)V

    .line 81
    return-void
.end method
