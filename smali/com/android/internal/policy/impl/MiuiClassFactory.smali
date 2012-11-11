.class public Lcom/android/internal/policy/impl/MiuiClassFactory;
.super Ljava/lang/Object;
.source "MiuiClassFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createKeyguardView(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardViewCallback;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardWindowController;)Lcom/android/internal/policy/impl/KeyguardViewBase;
    .registers 11
    .parameter "context"
    .parameter "callback"
    .parameter "updateMonitor"
    .parameter "lockPatternUtils"
    .parameter "controller"

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardView;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/KeyguardViewCallback;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardWindowController;)V

    return-object v0
.end method

.method public static createKeyguardViewMediator(Landroid/content/Context;Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/os/LocalPowerManager;)Lcom/android/internal/policy/impl/KeyguardViewMediator;
    .registers 4
    .parameter "context"
    .parameter "callback"
    .parameter "powerManager"

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MiuiKeyguardViewMediator;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/internal/policy/impl/MiuiKeyguardViewMediator;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/os/LocalPowerManager;)V

    return-object v0
.end method

.method public static createKeyguardViewProperties(Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)Lcom/android/internal/policy/impl/KeyguardViewProperties;
    .registers 3
    .parameter "lockPatternUtils"
    .parameter "updateMonitor"

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardViewProperties;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/policy/impl/MiuiLockPatternKeyguardViewProperties;-><init>(Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V

    return-object v0
.end method

.method public static createPhoneFallbackEventHandler(Landroid/content/Context;)Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;
    .registers 2
    .parameter "context"

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneFallbackEventHandler;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/MiuiPhoneFallbackEventHandler;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static createPhoneWindowManager()Lcom/android/internal/policy/impl/PhoneWindowManager;
    .registers 1

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-direct {v0}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;-><init>()V

    return-object v0
.end method
