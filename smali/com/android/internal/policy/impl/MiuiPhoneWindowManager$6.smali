.class Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;
.super Ljava/lang/Object;
.source "MiuiPhoneWindowManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

.field final synthetic val$msg:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Ljava/lang/CharSequence;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 845
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iput-object p2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->val$msg:Ljava/lang/CharSequence;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 847
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    if-nez v4, :cond_d1

    .line 848
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    new-instance v5, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6$1;

    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v6, v6, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    const v7, 0x10300f0

    invoke-direct {v5, p0, v6, v7}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6$1;-><init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;Landroid/content/Context;I)V

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4, v5}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$702(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 872
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 873
    .local v1, layoutInflater:Landroid/view/LayoutInflater;
    const v4, 0x603002e

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 874
    .local v3, view:Landroid/view/View;
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const v4, 0x60b0021

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;
    invoke-static {v5, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$802(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 875
    const v4, 0x60b0022

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 876
    .local v0, animationView:Landroid/widget/ImageView;
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 878
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x7e5

    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 880
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x102

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 883
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/high16 v5, 0x3f80

    invoke-virtual {v4, v5}, Landroid/view/Window;->setDimAmount(F)V

    .line 884
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 885
    .local v2, lp:Landroid/view/WindowManager$LayoutParams;
    const/4 v4, 0x5

    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->screenOrientation:I

    .line 886
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 887
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const v5, 0x60201e4

    invoke-virtual {v4, v5}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 888
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 889
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMiuiBootMsgDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$700(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    .line 891
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/AnimationDrawable;

    #setter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;
    invoke-static {v5, v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$902(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/graphics/drawable/AnimationDrawable;)Landroid/graphics/drawable/AnimationDrawable;

    .line 892
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mAnimationDrawable:Landroid/graphics/drawable/AnimationDrawable;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$900(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/graphics/drawable/AnimationDrawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 895
    .end local v0           #animationView:Landroid/widget/ImageView;
    .end local v1           #layoutInflater:Landroid/view/LayoutInflater;
    .end local v2           #lp:Landroid/view/WindowManager$LayoutParams;
    .end local v3           #view:Landroid/view/View;
    :cond_d1
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    #getter for: Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mMsgText:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->access$800(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;)Landroid/widget/TextView;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$6;->val$msg:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 896
    return-void
.end method
