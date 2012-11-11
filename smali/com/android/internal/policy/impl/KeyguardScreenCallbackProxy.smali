.class public Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;
.super Ljava/lang/Object;
.source "KeyguardScreenCallbackProxy.java"

# interfaces
.implements Lcom/android/internal/policy/impl/KeyguardScreenCallback;


# instance fields
.field private mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/KeyguardScreenCallback;)V
    .registers 2
    .parameter "client"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    return-void
.end method


# virtual methods
.method public doesFallbackUnlockScreenExist()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->doesFallbackUnlockScreenExist()Z

    move-result v0

    return v0
.end method

.method public forgotPattern(Z)V
    .registers 3
    .parameter "isForgotten"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->forgotPattern(Z)V

    return-void
.end method

.method public goToLockScreen()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->goToLockScreen()V

    return-void
.end method

.method public goToUnlockScreen()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    return-void
.end method

.method public isSecure()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->isSecure()Z

    move-result v0

    return v0
.end method

.method public isVerifyUnlockOnly()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->isVerifyUnlockOnly()Z

    move-result v0

    return v0
.end method

.method public keyguardDone(Z)V
    .registers 3
    .parameter "authenticated"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->keyguardDone(Z)V

    return-void
.end method

.method public keyguardDoneDrawing()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->keyguardDoneDrawing()V

    return-void
.end method

.method public pokeWakelock()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    return-void
.end method

.method public pokeWakelock(I)V
    .registers 3
    .parameter "millis"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock(I)V

    return-void
.end method

.method public recreateMe(Landroid/content/res/Configuration;)V
    .registers 3
    .parameter "config"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0, p1}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->recreateMe(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public reportFailedUnlockAttempt()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->reportFailedUnlockAttempt()V

    return-void
.end method

.method public reportSuccessfulUnlockAttempt()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->reportSuccessfulUnlockAttempt()V

    return-void
.end method

.method public takeEmergencyCallAction()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/KeyguardScreenCallbackProxy;->mClient:Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->takeEmergencyCallAction()V

    return-void
.end method
