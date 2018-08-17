# CoreAnimation
动画（Core Animation）

1、CABaseAnimation


 <pre><code>
/**
 移动动画
 */
- (void)testPositionAnimation
{
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
    //position 移动
    
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, tempViewY)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth-tempViewWidth/2, tempViewY)];
    anima.duration = 1.0f;
    ///*如果实现下面属性，在动画执行完毕后，图层会保持显示动画执行后的状态
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    //*/
    anima.repeatCount = 20;
    [tempView.layer addAnimation:anima forKey:@"positionAnimation"];
}
</code></pre>

 <pre><code>
/**
 旋转动画
 */
- (void)testTransRotationformAnimation
{
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake((JnScreenWidth-tempViewWidth)/2, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
    //transform.rotation.x  /  y  / z  旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2;
    animation.repeatCount = 20;
    animation.beginTime = CACurrentMediaTime() + 1; // 1秒后执行
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:M_PI]; // 终止角度
    [tempView.layer addAnimation:animation forKey:@"transformRotationAnimation"];
}
</code></pre>

 <pre><code>
/**
 缩放动画
 */
- (void)testTransScaleformAnimation
{
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake((JnScreenWidth-tempViewWidth)/2, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
    //transform.scale  缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1.0; // 动画持续时间
    animation.repeatCount = 20; // 重复次数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.0]; // 结束时的倍率
    
    [tempView.layer addAnimation:animation forKey:@"transformScaleAnimation"];
}
</code></pre>

 <pre><code>
/**
 渐隐动画
 */
- (void)testOpacityAnimation
{
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake((JnScreenWidth-tempViewWidth)/2, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
    //opacity 指layer的透明度
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation.fromValue = @(1.0);
    basicAnimation.toValue  = @(0.0); //[NSNumber numberWithFloat:0.0]
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = 20;
    [tempView.layer addAnimation:basicAnimation forKey:@"opacityAnimation"];
}
</code></pre>


2、CAKeyframeAnimation

 <pre><code>
- (void)testPathAnimation
{
    
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake((JnScreenWidth-tempViewWidth)/2, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
   
    /*
     //矩形
     + (instancetype)bezierPathWithRect:(CGRect)rect;
     
     //以矩形框为切线画圆
     + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
     
     //带圆角的矩形框
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
     
     //画圆弧
     + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
     */
     CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(JnScreenWidth/2-100, JnScreenWidth/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 2.0f;
    anima.repeatCount = 20;
    [tempView.layer addAnimation:anima forKey:@"pathAnimation"];
}
</code></pre>

3、CAAnimationGroup

<pre><code>
- (void)testGroupAnimation
{
    
    CGFloat tempViewWidth = 50;
    CGFloat tempViewY = 300;
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake((JnScreenWidth-tempViewWidth)/2, tempViewY, tempViewWidth, tempViewWidth)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
    
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, JnScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth/3, JnScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth/3, JnScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth*2/3, JnScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth*2/3, JnScreenHeight/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(JnScreenWidth, JnScreenHeight/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
    groupAnimation.duration = 4.0f;
    [tempView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
}
</code></pre>

4、CATransition
//------------- type：动画过渡类型 -------------
    /* Apple官方的SDK其实只提供了四种过渡效果。
    kCATransitionFade 渐变效果
    kCATransitionMoveIn 进入覆盖效果
    kCATransitionPush 推出效果
    kCATransitionReveal 揭露离开效果
     */
    /* 这类是API引入的，在苹果官网是不会承认的，所以不建议使用
     cube 立方体效果
     suckEffect 犹如一块布被抽走
     oglFlip上 下翻转效果
     rippleEffect 滴水效果
     pageCurl 向左翻页
     pageUnCurl 向下翻页
     */
    
    //------------- subtype：动画过渡方向 -------------
    /*
     kCATransitionFromRight 从右侧进入
     kCATransitionFromLeft 从左侧进入
     kCATransitionFromTop 从顶部进入
     kCATransitionFromBottom 从底部进入
     */
    
    /*
     startProgress：动画起点(在整体动画的百分比)
     endProgress：动画终点(在整体动画的百分比)
     */
