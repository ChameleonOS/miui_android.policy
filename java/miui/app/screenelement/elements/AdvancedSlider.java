// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.content.ComponentName;
import android.content.Intent;
import android.graphics.Canvas;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.*;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.*;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement, ElementGroup

public class AdvancedSlider extends ScreenElement {
    private class CheckTouchResult {

        public EndPoint endPoint;
        public boolean reached;
        final AdvancedSlider this$0;

        private CheckTouchResult() {
            this$0 = AdvancedSlider.this;
            super();
        }

    }

    private class EndPoint extends SliderPoint {

        private miui.app.screenelement.util.Utils.Point getNearestPoint(float f, float f1) {
            miui.app.screenelement.util.Utils.Point point;
            if(mPath == null) {
                point = new miui.app.screenelement.util.Utils.Point(f - mTouchOffsetX, f1 - mTouchOffsetY);
            } else {
                point = null;
                double d = 1.7976931348623157E+308D;
                int i = 1;
                while(i < mPath.size())  {
                    float f2 = f - mTouchOffsetX;
                    float f3 = f1 - mTouchOffsetY;
                    Position position = (Position)mPath.get(i - 1);
                    Position position1 = (Position)mPath.get(i);
                    miui.app.screenelement.util.Utils.Point point1 = new miui.app.screenelement.util.Utils.Point(position.getX(), position.getY());
                    miui.app.screenelement.util.Utils.Point point2 = new miui.app.screenelement.util.Utils.Point(position1.getX(), position1.getY());
                    miui.app.screenelement.util.Utils.Point point3 = new miui.app.screenelement.util.Utils.Point(f2, f3);
                    miui.app.screenelement.util.Utils.Point point4 = Utils.pointProjectionOnSegment(point1, point2, point3, true);
                    double d1 = Utils.Dist(point4, point3, false);
                    if(d1 < d) {
                        d = d1;
                        point = point4;
                    }
                    i++;
                }
            }
            return point;
        }

        private void load(Element element) throws ScreenElementLoadException {
            loadTask(element);
            loadPath(element);
        }

        private void loadPath(Element element) throws ScreenElementLoadException {
            Element element1 = Utils.getChild(element, "Path");
            if(element1 == null) {
                mPath = null;
            } else {
                mTolerance = Utils.getAttrAsInt(element1, "tolerance", 150);
                mPath = new ArrayList();
                mPathX = Expression.build(element1.getAttribute("x"));
                mPathY = Expression.build(element1.getAttribute("y"));
                NodeList nodelist = element1.getElementsByTagName("Position");
                int i = 0;
                while(i < nodelist.getLength())  {
                    Element element2 = (Element)nodelist.item(i);
                    mPath.add(new Position(element2, mPathX, mPathY));
                    i++;
                }
            }
        }

        private void loadTask(Element element) {
            Element element1;
            Element element2;
            Element element3;
            element1 = Utils.getChild(element, "Intent");
            element2 = Utils.getChild(element, "Command");
            element3 = Utils.getChild(element, "Trigger");
            if(element1 != null || element2 != null || element3 != null) goto _L2; else goto _L1
_L1:
            return;
_L2:
            mAction = new UnlockAction();
            if(element1 != null)
                mAction.mTask = Task.load(element1);
            else
            if(element2 != null) {
                mAction.mCommand = ActionCommand.create(mContext, element2, mRoot);
                if(mAction.mCommand == null)
                    Log.w("LockScreen_AdvancedSlider", (new StringBuilder()).append("invalid Command element: ").append(element2.toString()).toString());
            } else
            if(element3 != null) {
                try {
                    mAction.mTrigger = new CommandTrigger(mContext, element3, mRoot);
                }
                catch(ScreenElementLoadException screenelementloadexception) {
                    screenelementloadexception.printStackTrace();
                }
                if(mAction.mTrigger == null)
                    Log.w("LockScreen_AdvancedSlider", (new StringBuilder()).append("invalid Trigger element: ").append(element3.toString()).toString());
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        public void finish() {
            super.finish();
            if(mAction != null)
                mAction.finish();
        }

        public float getTransformedDist(miui.app.screenelement.util.Utils.Point point, float f, float f1) {
            if(mPath != null) goto _L2; else goto _L1
_L1:
            float f4 = 1.701412E+38F;
_L4:
            return f4;
_L2:
            if(point == null) {
                f4 = 3.402823E+38F;
            } else {
                float f2 = f - mTouchOffsetX;
                float f3 = f1 - mTouchOffsetY;
                f4 = (float)Utils.Dist(point, new miui.app.screenelement.util.Utils.Point(f2, f3), true);
                if(f4 >= mTolerance)
                    f4 = 3.402823E+38F;
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void init() {
            super.init();
            if(mAction != null)
                mAction.init();
            mTolerance = scale(mTolerance);
        }

        protected void onStateChange(State state, State state1) {
            if(state != State.Invalid) goto _L2; else goto _L1
_L1:
            return;
_L2:
            class _cls1 {

                static final int $SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State[];

                static  {
                    $SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State = new int[State.values().length];
                    NoSuchFieldError nosuchfielderror2;
                    try {
                        $SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State[State.Normal.ordinal()] = 1;
                    }
                    catch(NoSuchFieldError nosuchfielderror) { }
                    try {
                        $SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State[State.Pressed.ordinal()] = 2;
                    }
                    catch(NoSuchFieldError nosuchfielderror1) { }
                    $SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State[State.Reached.ordinal()] = 3;
_L2:
                    return;
                    nosuchfielderror2;
                    if(true) goto _L2; else goto _L1
_L1:
                }
            }

            switch(_cls1..SwitchMap.miui.app.screenelement.elements.AdvancedSlider.State[state1.ordinal()]) {
            case 3: // '\003'
                mRoot.playSound(super.mReachedSound);
                break;
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        public void pause() {
            super.pause();
            if(mAction != null)
                mAction.pause();
        }

        public void resume() {
            super.resume();
            if(mAction != null)
                mAction.resume();
        }

        public static final String TAG_NAME = "EndPoint";
        public UnlockAction mAction;
        private ArrayList mPath;
        private Expression mPathX;
        private Expression mPathY;
        private float mTolerance;
        final AdvancedSlider this$0;



        public EndPoint(Element element) throws ScreenElementLoadException {
            this$0 = AdvancedSlider.this;
            super(element, "EndPoint");
            mTolerance = 150F;
            load(element);
        }
    }

    private class UnlockAction {

        private Intent performTask() {
            if(mTask != null) goto _L2; else goto _L1
_L1:
            Intent intent = null;
_L4:
            return intent;
_L2:
            intent = null;
            if(!mConfigTaskLoaded) {
                Task task = mRoot.findTask(mTask.id);
                if(task != null && !TextUtils.isEmpty(task.action))
                    mTask = task;
                mConfigTaskLoaded = true;
            }
            if(!TextUtils.isEmpty(mTask.action)) {
                intent = new Intent(mTask.action);
                if(!TextUtils.isEmpty(mTask.type))
                    intent.setType(mTask.type);
                if(!TextUtils.isEmpty(mTask.category))
                    intent.addCategory(mTask.category);
                if(!TextUtils.isEmpty(mTask.packageName) && !TextUtils.isEmpty(mTask.className))
                    intent.setComponent(new ComponentName(mTask.packageName, mTask.className));
                intent.setFlags(0x34000000);
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void finish() {
            if(mCommand != null)
                mCommand.finish();
            if(mTrigger != null)
                mTrigger.finish();
        }

        public void init() {
            if(mCommand != null)
                mCommand.init();
            if(mTrigger != null)
                mTrigger.init();
        }

        public void pause() {
            if(mCommand != null)
                mCommand.pause();
            if(mTrigger != null)
                mTrigger.pause();
        }

        public Intent perform() {
            if(mTask == null) goto _L2; else goto _L1
_L1:
            Intent intent = performTask();
_L4:
            return intent;
_L2:
            if(mCommand == null)
                break; /* Loop/switch isn't completed */
            mCommand.perform();
_L6:
            intent = null;
            if(true) goto _L4; else goto _L3
_L3:
            if(mTrigger == null) goto _L6; else goto _L5
_L5:
            mTrigger.perform();
              goto _L6
        }

        public void resume() {
            if(mCommand != null)
                mCommand.resume();
            if(mTrigger != null)
                mTrigger.resume();
        }

        public ActionCommand mCommand;
        public boolean mConfigTaskLoaded;
        public Task mTask;
        public CommandTrigger mTrigger;
        final AdvancedSlider this$0;

        private UnlockAction() {
            this$0 = AdvancedSlider.this;
            super();
        }

    }

    private class Position {

        public float getX() {
            AdvancedSlider advancedslider = AdvancedSlider.this;
            double d;
            if(mBaseX == null)
                d = x;
            else
                d = (double)x + mBaseX.evaluate(mContext.mVariables);
            return advancedslider.scale(d);
        }

        public float getY() {
            AdvancedSlider advancedslider = AdvancedSlider.this;
            double d;
            if(mBaseY == null)
                d = y;
            else
                d = (double)y + mBaseY.evaluate(mContext.mVariables);
            return advancedslider.scale(d);
        }

        public void load(Element element) throws ScreenElementLoadException {
            if(element == null) {
                Log.e("LockScreen_AdvancedSlider", "node is null");
                throw new ScreenElementLoadException("node is null");
            } else {
                Utils.asserts(element.getNodeName().equalsIgnoreCase("Position"), "wrong node tag");
                x = Utils.getAttrAsInt(element, "x", 0);
                y = Utils.getAttrAsInt(element, "y", 0);
                return;
            }
        }

        public static final String TAG_NAME = "Position";
        private Expression mBaseX;
        private Expression mBaseY;
        final AdvancedSlider this$0;
        private int x;
        private int y;

        public Position(Element element, Expression expression, Expression expression1) throws ScreenElementLoadException {
            this$0 = AdvancedSlider.this;
            super();
            mBaseX = expression;
            mBaseY = expression1;
            load(element);
        }
    }

    private class StartPoint extends SliderPoint {

        protected void onStateChange(State state, State state1) {
            if(state != State.Invalid) goto _L2; else goto _L1
_L1:
            return;
_L2:
            switch(_cls1..SwitchMap.miui.app.screenelement.elements.AdvancedSlider.State[state1.ordinal()]) {
            case 1: // '\001'
                mRoot.playSound(super.mNormalSound);
                break;

            case 2: // '\002'
                if(!mPressed)
                    mRoot.playSound(super.mPressedSound);
                break;
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        public static final String TAG_NAME = "StartPoint";
        final AdvancedSlider this$0;

        public StartPoint(Element element) throws ScreenElementLoadException {
            this$0 = AdvancedSlider.this;
            super(element, "StartPoint");
        }
    }

    private class SliderPoint {

        private ElementGroup loadGroup(Element element, String s) throws ScreenElementLoadException {
            Element element1 = Utils.getChild(element, s);
            ElementGroup elementgroup;
            if(element1 != null)
                elementgroup = new ElementGroup(element1, mContext, mRoot);
            else
                elementgroup = null;
            return elementgroup;
        }

        public ScreenElement findElement(String s) {
            if(mPressedStateElements == null) goto _L2; else goto _L1
_L1:
            ScreenElement screenelement3 = mPressedStateElements.findElement(s);
            if(screenelement3 == null) goto _L2; else goto _L3
_L3:
            ScreenElement screenelement = screenelement3;
_L5:
            return screenelement;
_L2:
            if(mNormalStateElements != null) {
                ScreenElement screenelement2 = mNormalStateElements.findElement(s);
                if(screenelement2 != null) {
                    screenelement = screenelement2;
                    continue; /* Loop/switch isn't completed */
                }
            }
            if(mReachedStateElements != null) {
                ScreenElement screenelement1 = mReachedStateElements.findElement(s);
                if(screenelement1 != null) {
                    screenelement = screenelement1;
                    continue; /* Loop/switch isn't completed */
                }
            }
            screenelement = null;
            if(true) goto _L5; else goto _L4
_L4:
        }

        public void finish() {
            if(mNormalStateElements != null)
                mNormalStateElements.finish();
            if(mPressedStateElements != null)
                mPressedStateElements.finish();
            if(mReachedStateElements != null)
                mReachedStateElements.finish();
        }

        public float getCurrentX() {
            return mCurrentX;
        }

        public float getCurrentY() {
            return mCurrentY;
        }

        public State getState() {
            return mState;
        }

        public float getX() {
            return scale(mX.evaluate(mContext.mVariables));
        }

        public float getY() {
            return scale(mY.evaluate(mContext.mVariables));
        }

        public void init() {
            mCurrentX = scale(mX.evaluate(mContext.mVariables));
            mCurrentY = scale(mY.evaluate(mContext.mVariables));
            if(mNormalStateElements != null)
                mNormalStateElements.init();
            if(mPressedStateElements != null)
                mPressedStateElements.init();
            if(mReachedStateElements != null)
                mReachedStateElements.init();
            setState(State.Normal);
        }

        public void load(Element element, String s) throws ScreenElementLoadException {
            Utils.asserts(element.getNodeName().equalsIgnoreCase(s), "wrong node name");
            mName = element.getAttribute("name");
            mNormalSound = element.getAttribute("normalSound");
            mPressedSound = element.getAttribute("pressedSound");
            mReachedSound = element.getAttribute("reachedSound");
            mX = Expression.build(element.getAttribute("x"));
            mY = Expression.build(element.getAttribute("y"));
            mWidth = Expression.build(element.getAttribute("w"));
            mHeight = Expression.build(element.getAttribute("h"));
            mNormalStateElements = loadGroup(element, "NormalState");
            mPressedStateElements = loadGroup(element, "PressedState");
            mReachedStateElements = loadGroup(element, "ReachedState");
        }

        public void moveTo(float f, float f1) {
            mCurrentX = f;
            mCurrentY = f1;
        }

        protected void onStateChange(State state, State state1) {
        }

        public void pause() {
            if(mNormalStateElements != null)
                mNormalStateElements.pause();
            if(mPressedStateElements != null)
                mPressedStateElements.pause();
            if(mReachedStateElements != null)
                mReachedStateElements.pause();
        }

        public void render(Canvas canvas) {
            float f = scale(mX.evaluate(mContext.mVariables));
            float f1 = scale(mY.evaluate(mContext.mVariables));
            int i = canvas.save();
            canvas.translate(mCurrentX - f, mCurrentY - f1);
            if(mCurrentStateElements != null)
                mCurrentStateElements.render(canvas);
            canvas.restoreToCount(i);
        }

        public void reset(long l) {
            if(mNormalStateElements != null)
                mNormalStateElements.reset(l);
            if(mPressedStateElements != null)
                mPressedStateElements.reset(l);
            if(mReachedStateElements != null)
                mReachedStateElements.reset(l);
        }

        public void resume() {
            if(mNormalStateElements != null)
                mNormalStateElements.resume();
            if(mPressedStateElements != null)
                mPressedStateElements.resume();
            if(mReachedStateElements != null)
                mReachedStateElements.resume();
        }

        public void setState(State state) {
            if(mState != state) goto _L2; else goto _L1
_L1:
            return;
_L2:
            State state1;
            Object obj;
            boolean flag;
            state1 = mState;
            mState = state;
            obj = null;
            flag = false;
            _cls1..SwitchMap.miui.app.screenelement.elements.AdvancedSlider.State[state.ordinal()];
            JVM INSTR tableswitch 1 3: default 60
        //                       1 90
        //                       2 114
        //                       3 163;
               goto _L3 _L4 _L5 _L6
_L6:
            break MISSING_BLOCK_LABEL_163;
_L3:
            break; /* Loop/switch isn't completed */
_L4:
            break; /* Loop/switch isn't completed */
_L8:
            if(obj != null && flag)
                ((ElementGroup) (obj)).reset();
            mCurrentStateElements = ((ScreenElement) (obj));
            onStateChange(state1, mState);
            if(true) goto _L1; else goto _L7
_L7:
            obj = mNormalStateElements;
            if(mPressedStateElements != null)
                flag = true;
            else
                flag = false;
              goto _L8
_L5:
            if(mPressedStateElements != null)
                obj = mPressedStateElements;
            else
                obj = mNormalStateElements;
            if(mPressedStateElements != null && !mPressed)
                flag = true;
            else
                flag = false;
              goto _L8
            if(mReachedStateElements != null)
                obj = mReachedStateElements;
            else
            if(mPressedStateElements != null)
                obj = mPressedStateElements;
            else
                obj = mNormalStateElements;
            if(mReachedStateElements != null)
                flag = true;
            else
                flag = false;
              goto _L8
        }

        public void showCategory(String s, boolean flag) {
            if(mPressedStateElements != null)
                mPressedStateElements.showCategory(s, flag);
            if(mNormalStateElements != null)
                mNormalStateElements.showCategory(s, flag);
            if(mReachedStateElements != null)
                mReachedStateElements.showCategory(s, flag);
        }

        public void tick(long l) {
            if(mCurrentStateElements != null)
                mCurrentStateElements.tick(l);
        }

        public boolean touched(float f, float f1) {
            float f2 = scale(mX.evaluate(mContext.mVariables));
            float f3 = scale(mWidth.evaluate(mContext.mVariables));
            float f4 = scale(mY.evaluate(mContext.mVariables));
            float f5 = scale(mHeight.evaluate(mContext.mVariables));
            boolean flag;
            if(f >= f2 && f <= f2 + f3 && f1 >= f4 && f1 <= f4 + f5)
                flag = true;
            else
                flag = false;
            return flag;
        }

        private ScreenElement mCurrentStateElements;
        protected float mCurrentX;
        protected float mCurrentY;
        private Expression mHeight;
        protected String mName;
        protected String mNormalSound;
        protected ElementGroup mNormalStateElements;
        protected String mPressedSound;
        protected ElementGroup mPressedStateElements;
        protected String mReachedSound;
        private ElementGroup mReachedStateElements;
        private State mState;
        private Expression mWidth;
        protected Expression mX;
        protected Expression mY;
        final AdvancedSlider this$0;

        public SliderPoint(Element element, String s) throws ScreenElementLoadException {
            this$0 = AdvancedSlider.this;
            super();
            mState = State.Invalid;
            load(element, s);
        }
    }

    private static final class State extends Enum {

        public static State valueOf(String s) {
            return (State)Enum.valueOf(miui/app/screenelement/elements/AdvancedSlider$State, s);
        }

        public static State[] values() {
            return (State[])$VALUES.clone();
        }

        private static final State $VALUES[];
        public static final State Invalid;
        public static final State Normal;
        public static final State Pressed;
        public static final State Reached;

        static  {
            Normal = new State("Normal", 0);
            Pressed = new State("Pressed", 1);
            Reached = new State("Reached", 2);
            Invalid = new State("Invalid", 3);
            State astate[] = new State[4];
            astate[0] = Normal;
            astate[1] = Pressed;
            astate[2] = Reached;
            astate[3] = Invalid;
            $VALUES = astate;
        }

        private State(String s, int i) {
            super(s, i);
        }
    }

    private class BounceAnimationController {

        private miui.app.screenelement.util.Utils.Point getPoint(float f, float f1, float f2, float f3, long l) {
            miui.app.screenelement.util.Utils.Point point = new miui.app.screenelement.util.Utils.Point(f, f1);
            miui.app.screenelement.util.Utils.Point point1 = new miui.app.screenelement.util.Utils.Point(f2, f3);
            double d = Utils.Dist(point, point1, true);
            miui.app.screenelement.util.Utils.Point point2;
            if((double)l >= d) {
                point2 = null;
            } else {
                double d1 = (d - (double)l) / d;
                double d2 = d1 * (point1.x - point.x);
                double d3 = d1 * (point1.y - point.y);
                point2 = new miui.app.screenelement.util.Utils.Point(d2 + point.x, d3 + point.y);
            }
            return point2;
        }

        private void startBounceAnimation(EndPoint endpoint) {
            miui.app.screenelement.util.Utils.Point point;
            int i;
            if(mBounceInitSpeedExp != null)
                mBounceInitSpeed = (int)mBounceInitSpeedExp.evaluate(mContext.mVariables);
            if(mBounceAccelationExp != null)
                mBounceAccelation = (int)mBounceAccelationExp.evaluate(mContext.mVariables);
            mBounceStartTime = 0L;
            mEndPoint = endpoint;
            mStartX = mStartPoint.getCurrentX();
            mStartY = mStartPoint.getCurrentY();
            mBounceStartPointIndex = -1;
            mTraveledDistance = 0.0D;
            point = new miui.app.screenelement.util.Utils.Point(mStartX, mStartY);
            if(endpoint == null || endpoint.mPath == null)
                break MISSING_BLOCK_LABEL_308;
            i = 1;
_L5:
            if(i >= endpoint.mPath.size()) goto _L2; else goto _L1
_L1:
            miui.app.screenelement.util.Utils.Point point1;
            miui.app.screenelement.util.Utils.Point point2;
            miui.app.screenelement.util.Utils.Point point3;
            Position position = (Position)endpoint.mPath.get(i - 1);
            Position position1 = (Position)endpoint.mPath.get(i);
            point1 = new miui.app.screenelement.util.Utils.Point(position.getX(), position.getY());
            point2 = new miui.app.screenelement.util.Utils.Point(position1.getX(), position1.getY());
            point3 = Utils.pointProjectionOnSegment(point1, point2, point, false);
            if(point3 == null) goto _L4; else goto _L3
_L3:
            mBounceStartPointIndex = i - 1;
            mTraveledDistance = mTraveledDistance + Utils.Dist(point1, point3, true);
_L2:
            if(mTraveledDistance < 3D) {
                cancelMoving();
                mBounceStartTime = -1L;
            } else {
                if(mBounceProgress != null)
                    mBounceProgress.set(0.0D);
                requestUpdate();
            }
            return;
_L4:
            mTraveledDistance = mTraveledDistance + Utils.Dist(point1, point2, true);
            i++;
              goto _L5
            mTraveledDistance = Utils.Dist(new miui.app.screenelement.util.Utils.Point(mStartPoint.getX(), mStartPoint.getY()), point, true);
              goto _L2
        }

        public void init() {
            mBounceStartTime = -1L;
            if(mBounceProgress != null)
                mBounceProgress.set(1.0D);
        }

        public void load(Element element) {
            mBounceInitSpeedExp = Expression.build(element.getAttribute("bounceInitSpeed"));
            mBounceAccelationExp = Expression.build(element.getAttribute("bounceAcceleration"));
            if(mHasName)
                mBounceProgress = new IndexedNumberVariable(mName, "bounce_progress", mContext.mVariables);
        }

        public void startCancelMoving(EndPoint endpoint) {
            if(mBounceInitSpeedExp == null)
                cancelMoving();
            else
                startBounceAnimation(endpoint);
        }

        public void tick(long l) {
            if(mBounceStartTime >= 0L) goto _L2; else goto _L1
_L1:
            return;
_L2:
            if(mBounceStartTime != 0L) goto _L4; else goto _L3
_L3:
            mBounceStartTime = l;
            mPreDistance = 0L;
_L7:
            requestUpdate();
            if(mTraveledDistance > 0.0D) {
                double d = (double)mPreDistance / mTraveledDistance;
                if(mBounceProgress != null) {
                    IndexedNumberVariable indexednumbervariable = mBounceProgress;
                    if(d > 1.0D)
                        d = 1.0D;
                    indexednumbervariable.set(d);
                }
            }
              goto _L1
_L4:
            long l2;
label0:
            {
                long l1 = l - mBounceStartTime;
                l2 = (l1 * (long)mBounceInitSpeed) / 1000L + (l1 * (l1 * (long)mBounceAccelation)) / 0x1e8480L;
                if((long)mBounceInitSpeed + (l1 * (long)mBounceAccelation) / 1000L > 0L && mTraveledDistance >= 3D)
                    break label0;
                cancelMoving();
                mBounceStartTime = -1L;
                if(mBounceProgress != null)
                    mBounceProgress.set(1.0D);
            }
              goto _L1
            if(mEndPoint != null && mEndPoint.mPath != null) goto _L6; else goto _L5
_L5:
            miui.app.screenelement.util.Utils.Point point = getPoint(mStartPoint.getX(), mStartPoint.getY(), mStartX, mStartY, l2);
            if(point == null) {
                cancelMoving();
                mBounceStartTime = -1L;
            } else {
                moveStartPoint((int)point.x, (int)point.y);
            }
_L8:
            mPreDistance = l2;
              goto _L7
_L6:
            float f;
            float f1;
            long l3;
            int i;
            f = mStartPoint.getCurrentX();
            f1 = mStartPoint.getCurrentY();
            l3 = l2 - mPreDistance;
            i = mBounceStartPointIndex;
_L9:
            Position position;
            miui.app.screenelement.util.Utils.Point point1;
            if(i >= 0) {
label1:
                {
                    position = (Position)mEndPoint.mPath.get(i);
                    point1 = getPoint(position.getX(), position.getY(), f, f1, l3);
                    if(point1 != null)
                        break MISSING_BLOCK_LABEL_475;
                    if(i != 0)
                        break label1;
                    cancelMoving();
                    mBounceStartTime = -1L;
                }
            }
              goto _L8
            miui.app.screenelement.util.Utils.Point point2 = new miui.app.screenelement.util.Utils.Point(position.getX(), position.getY());
            miui.app.screenelement.util.Utils.Point point3 = new miui.app.screenelement.util.Utils.Point(f, f1);
            l3 = (long)((double)l3 - Utils.Dist(point2, point3, true));
            f = position.getX();
            f1 = position.getY();
            i--;
              goto _L9
            mBounceStartPointIndex = i;
            moveStartPoint((int)point1.x, (int)point1.y);
              goto _L8
        }

        private static final int BOUNCE_THRESHOLD = 3;
        private int mBounceAccelation;
        private Expression mBounceAccelationExp;
        private int mBounceInitSpeed;
        private Expression mBounceInitSpeedExp;
        private IndexedNumberVariable mBounceProgress;
        private int mBounceStartPointIndex;
        private long mBounceStartTime;
        private EndPoint mEndPoint;
        private long mPreDistance;
        private float mStartX;
        private float mStartY;
        private double mTraveledDistance;
        final AdvancedSlider this$0;

        private BounceAnimationController() {
            this$0 = AdvancedSlider.this;
            super();
            mBounceStartTime = -1L;
        }

    }

    public static interface OnLaunchListener {

        public abstract void onLaunch(String s);
    }


    public AdvancedSlider(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mEndPoints = new ArrayList();
        mBounceAnimationController = new BounceAnimationController(null);
        if(super.mHasName) {
            mStateVar = new IndexedNumberVariable(super.mName, "state", super.mContext.mVariables);
            mMoveXVar = new IndexedNumberVariable(super.mName, "move_x", super.mContext.mVariables);
            mMoveYVar = new IndexedNumberVariable(super.mName, "move_y", super.mContext.mVariables);
            mMoveDistVar = new IndexedNumberVariable(super.mName, "move_dist", super.mContext.mVariables);
        }
        load(element);
    }

    private void cancelMoving() {
        mPressed = false;
        mStartPoint.moveTo(mStartPoint.getX(), mStartPoint.getY());
        mStartPoint.setState(State.Normal);
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).setState(State.Normal));
        if(super.mHasName) {
            mMoveXVar.set(0.0D);
            mMoveYVar.set(0.0D);
            mMoveDistVar.set(0.0D);
            mStateVar.set(0.0D);
        }
        mMoving = false;
        requestUpdate();
    }

    private boolean checkEndPoint(miui.app.screenelement.util.Utils.Point point, EndPoint endpoint) {
        boolean flag = false;
        if(endpoint.touched((float)point.x, (float)point.y)) {
            if(endpoint.getState() != State.Reached) {
                endpoint.setState(State.Reached);
                Iterator iterator = mEndPoints.iterator();
                do {
                    if(!iterator.hasNext())
                        break;
                    EndPoint endpoint1 = (EndPoint)iterator.next();
                    if(endpoint1 != endpoint)
                        endpoint1.setState(State.Pressed);
                } while(true);
                onReach(((SliderPoint) (endpoint)).mName);
            }
            flag = true;
        } else {
            endpoint.setState(State.Pressed);
        }
        return flag;
    }

    private CheckTouchResult checkTouch(float f, float f1) {
        float f2;
        miui.app.screenelement.util.Utils.Point point;
        CheckTouchResult checktouchresult;
        boolean flag;
        f2 = 3.402823E+38F;
        point = null;
        checktouchresult = new CheckTouchResult(null);
        Iterator iterator = mEndPoints.iterator();
        do {
            if(!iterator.hasNext())
                break;
            EndPoint endpoint1 = (EndPoint)iterator.next();
            miui.app.screenelement.util.Utils.Point point1 = endpoint1.getNearestPoint(f, f1);
            float f3 = endpoint1.getTransformedDist(point1, f, f1);
            if(f3 < f2) {
                f2 = f3;
                point = point1;
                checktouchresult.endPoint = endpoint1;
            }
        } while(true);
        flag = false;
        if(f2 >= 3.402823E+38F)
            break MISSING_BLOCK_LABEL_265;
        moveStartPoint((float)point.x, (float)point.y);
        if(f2 >= 1.701412E+38F) goto _L2; else goto _L1
_L1:
        flag = checkEndPoint(point, checktouchresult.endPoint);
_L4:
        StartPoint startpoint = mStartPoint;
        State state;
        if(flag)
            state = State.Reached;
        else
            state = State.Pressed;
        startpoint.setState(state);
        if(super.mHasName) {
            IndexedNumberVariable indexednumbervariable = mStateVar;
            Iterator iterator1;
            EndPoint endpoint;
            double d;
            if(flag)
                d = 2D;
            else
                d = 1.0D;
            indexednumbervariable.set(d);
        }
        checktouchresult.reached = flag;
_L8:
        return checktouchresult;
_L2:
        iterator1 = mEndPoints.iterator();
_L6:
        if(!iterator1.hasNext()) goto _L4; else goto _L3
_L3:
        endpoint = (EndPoint)iterator1.next();
        if(endpoint.mPath != null) goto _L6; else goto _L5
_L5:
        flag = checkEndPoint(point, endpoint);
        if(!flag) goto _L6; else goto _L7
_L7:
        checktouchresult.endPoint = endpoint;
          goto _L4
        Log.i("LockScreen_AdvancedSlider", "unlock touch canceled due to exceeding tollerance");
        checktouchresult = null;
          goto _L8
    }

    private boolean doLaunch(EndPoint endpoint) {
        Intent intent = null;
        if(endpoint.mAction != null)
            intent = endpoint.mAction.perform();
        return onLaunch(((SliderPoint) (endpoint)).mName, intent);
    }

    private void loadEndPoint(Element element) throws ScreenElementLoadException {
        mEndPoints.clear();
        NodeList nodelist = element.getElementsByTagName("EndPoint");
        for(int i = 0; i < nodelist.getLength(); i++) {
            Element element1 = (Element)nodelist.item(i);
            mEndPoints.add(new EndPoint(element1));
        }

        boolean flag;
        if(!mEndPoints.isEmpty())
            flag = true;
        else
            flag = false;
        Utils.asserts(flag, "no end point for unlocker!");
    }

    private void loadStartPoint(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "StartPoint");
        boolean flag;
        if(element1 != null)
            flag = true;
        else
            flag = false;
        Utils.asserts(flag, "no StartPoint node");
        mStartPoint = new StartPoint(element1);
    }

    private void moveStartPoint(float f, float f1) {
        mStartPoint.moveTo(f, f1);
        if(super.mHasName) {
            double d = (double)descale(((SliderPoint) (mStartPoint)).mCurrentX) - ((SliderPoint) (mStartPoint)).mX.evaluate(super.mContext.mVariables);
            double d1 = (double)descale(((SliderPoint) (mStartPoint)).mCurrentY) - ((SliderPoint) (mStartPoint)).mY.evaluate(super.mContext.mVariables);
            double d2 = Math.sqrt(d * d + d1 * d1);
            mMoveXVar.set(d);
            mMoveYVar.set(d1);
            mMoveDistVar.set(d2);
        }
    }

    public void doRender(Canvas canvas) {
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).render(canvas));
        mStartPoint.render(canvas);
    }

    public ScreenElement findElement(String s) {
        ScreenElement screenelement = super.findElement(s);
        if(screenelement == null) goto _L2; else goto _L1
_L1:
        ScreenElement screenelement2 = screenelement;
_L4:
        return screenelement2;
_L2:
        ScreenElement screenelement1 = mStartPoint.findElement(s);
        if(screenelement1 != null) {
            screenelement2 = screenelement1;
            continue; /* Loop/switch isn't completed */
        }
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext();) {
            ScreenElement screenelement3 = ((EndPoint)iterator.next()).findElement(s);
            if(screenelement3 != null) {
                screenelement2 = screenelement3;
                continue; /* Loop/switch isn't completed */
            }
        }

        screenelement2 = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void finish() {
        super.finish();
        mStartPoint.finish();
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).finish());
    }

    public void init() {
        super.init();
        mBounceAnimationController.init();
        mStartPoint.init();
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).init());
    }

    public void load(Element element) throws ScreenElementLoadException {
        if(!$assertionsDisabled && !element.getNodeName().equalsIgnoreCase("Slider")) {
            throw new AssertionError();
        } else {
            mBounceAnimationController.load(element);
            loadStartPoint(element);
            loadEndPoint(element);
            return;
        }
    }

    protected void onCancel() {
        super.mRoot.haptic(1);
    }

    protected boolean onLaunch(String s, Intent intent) {
        if(mOnLaunchListener != null)
            mOnLaunchListener.onLaunch(s);
        return false;
    }

    protected void onReach(String s) {
        super.mRoot.haptic(0);
    }

    protected void onStart() {
        super.mRoot.haptic(1);
    }

    public boolean onTouch(MotionEvent motionevent) {
        if(isVisible()) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        flag = false;
        switch(motionevent.getActionMasked()) {
        case 0: // '\0'
            if(mStartPoint.touched(f, f1)) {
                mMoving = true;
                mTouchOffsetX = f - mStartPoint.getX();
                mTouchOffsetY = f1 - mStartPoint.getY();
                mStartPoint.setState(State.Pressed);
                for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).setState(State.Pressed));
                mPressed = true;
                if(super.mHasName)
                    mStateVar.set(1.0D);
                mBounceAnimationController.init();
                onStart();
                flag = true;
            }
            break;

        case 2: // '\002'
            if(mMoving) {
                CheckTouchResult checktouchresult1 = checkTouch(f, f1);
                if(checktouchresult1 != null) {
                    mCurrentEndPoint = checktouchresult1.endPoint;
                } else {
                    mBounceAnimationController.startCancelMoving(mCurrentEndPoint);
                    mMoving = false;
                    onCancel();
                }
                flag = true;
            }
            break;

        case 1: // '\001'
        case 3: // '\003'
            boolean flag1 = false;
            if(mMoving) {
                Log.i("LockScreen_AdvancedSlider", "unlock touch up");
                CheckTouchResult checktouchresult = checkTouch(f, f1);
                if(checktouchresult != null) {
                    if(checktouchresult.reached)
                        flag1 = doLaunch(checktouchresult.endPoint);
                    mCurrentEndPoint = checktouchresult.endPoint;
                }
                mMoving = false;
                if(!flag1) {
                    mBounceAnimationController.startCancelMoving(mCurrentEndPoint);
                    onCancel();
                }
                flag = true;
            }
            break;

        case 4: // '\004'
            if(mMoving) {
                mBounceAnimationController.startCancelMoving(null);
                mCurrentEndPoint = null;
                mMoving = false;
                onCancel();
                flag = true;
            }
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void pause() {
        super.pause();
        cancelMoving();
        mStartPoint.pause();
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).pause());
    }

    public void reset(long l) {
        super.reset(l);
        mStartPoint.reset(l);
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).reset(l));
    }

    public void resume() {
        super.resume();
        mStartPoint.resume();
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).resume());
    }

    public void setOnLaunchListener(OnLaunchListener onlaunchlistener) {
        mOnLaunchListener = onlaunchlistener;
    }

    public void showCategory(String s, boolean flag) {
        mStartPoint.showCategory(s, flag);
        for(Iterator iterator = mEndPoints.iterator(); iterator.hasNext(); ((EndPoint)iterator.next()).showCategory(s, flag));
    }

    public void tick(long l) {
        super.tick(l);
        if(isVisible()) {
            mBounceAnimationController.tick(l);
            mStartPoint.tick(l);
            Iterator iterator = mEndPoints.iterator();
            while(iterator.hasNext()) 
                ((EndPoint)iterator.next()).tick(l);
        }
    }

    static final boolean $assertionsDisabled = false;
    private static final boolean DEBUG = false;
    private static final int DEFAULT_DRAG_TOLERANCE = 150;
    private static final float FREE_ENDPOINT_DIST = 1.701412E+38F;
    private static final String LOG_TAG = "LockScreen_AdvancedSlider";
    public static final String MOVE_DIST = "move_dist";
    public static final String MOVE_X = "move_x";
    public static final String MOVE_Y = "move_y";
    private static final float NONE_ENDPOINT_DIST = 3.402823E+38F;
    public static final int SLIDER_STATE_NORMAL = 0;
    public static final int SLIDER_STATE_PRESSED = 1;
    public static final int SLIDER_STATE_REACHED = 2;
    public static final String STATE = "state";
    public static final String TAG_NAME = "Slider";
    private BounceAnimationController mBounceAnimationController;
    private EndPoint mCurrentEndPoint;
    private ArrayList mEndPoints;
    private IndexedNumberVariable mMoveDistVar;
    private IndexedNumberVariable mMoveXVar;
    private IndexedNumberVariable mMoveYVar;
    private boolean mMoving;
    private OnLaunchListener mOnLaunchListener;
    private boolean mPressed;
    private StartPoint mStartPoint;
    private IndexedNumberVariable mStateVar;
    private float mTouchOffsetX;
    private float mTouchOffsetY;

    static  {
        boolean flag;
        if(!miui/app/screenelement/elements/AdvancedSlider.desiredAssertionStatus())
            flag = true;
        else
            flag = false;
        $assertionsDisabled = flag;
    }






}
