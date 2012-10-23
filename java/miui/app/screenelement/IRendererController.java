// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;


public interface IRendererController {

    public abstract FramerateTokenList.FramerateToken createToken(String s);

    public abstract void doRender();

    public abstract void doneUpdate();

    public abstract void finish();

    public abstract float getFramerate();

    public abstract void init();

    public abstract void pause();

    public abstract void requestUpdate();

    public abstract void resume();

    public abstract boolean shouldUpdate();

    public abstract void updateFramerate(long l);
}
