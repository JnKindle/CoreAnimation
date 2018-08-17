//
//  ViewController.m
//  CoreAnimation
//
//  Created by Jn_Kindle on 2018/8/16.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#define tempViewWidth 50
#define tempViewY 300

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *tempView;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

-(UIView *)tempView
{
    if (!_tempView) {
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, tempViewY, tempViewWidth, tempViewWidth)];
        tempView.backgroundColor = [UIColor redColor];
        [self.view addSubview:tempView];
        _tempView = tempView;
    }
    return _tempView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *mv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
        mv.frame = CGRectMake(30, 60, JnScreenWidth - 60, JnScreenHeight-120);
        mv.userInteractionEnabled = YES;
        [self.view addSubview:mv];
        _imageView = mv;
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //----------------CABaseAnimation
    //[self testPositionAnimation];  //移动动画
    //[self testTransRotationformAnimation];  //旋转动画
    //[self testTransScaleformAnimation]; //缩放动画
    //[self testOpacityAnimation]; //渐隐动画
    
    //----------------CAKeyframeAnimation
    //[self testPathAnimation];
    
    //----------------CAAnimationGroup
    //[self testGroupAnimation];
    
    //----------------CATransition
    self.index = 1;
    [self addTransitionGesture];
    
    
}

#pragma mark - CABaseAnimation
/**
 移动动画
 */
- (void)testPositionAnimation
{
    
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
    [self.tempView.layer addAnimation:anima forKey:@"positionAnimation"];
}


/**
 旋转动画
 */
- (void)testTransRotationformAnimation
{
    //transform.rotation.x  /  y  / z  旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2;
    animation.repeatCount = 20;
    animation.beginTime = CACurrentMediaTime() + 1; // 1秒后执行
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:M_PI]; // 终止角度
    [self.tempView.layer addAnimation:animation forKey:@"transformRotationAnimation"];
}


/**
 缩放动画
 */
- (void)testTransScaleformAnimation
{
    
    //transform.scale  缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1.0; // 动画持续时间
    animation.repeatCount = 20; // 重复次数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.0]; // 结束时的倍率
    
    [self.tempView.layer addAnimation:animation forKey:@"transformScaleAnimation"];
}


/**
 渐隐动画
 */
- (void)testOpacityAnimation
{
    
    //opacity 指layer的透明度
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation.fromValue = @(1.0);
    basicAnimation.toValue  = @(0.0); //[NSNumber numberWithFloat:0.0]
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = 20;
    [self.tempView.layer addAnimation:basicAnimation forKey:@"opacityAnimation"];
}


#pragma mark - CAKeyframeAnimation

- (void)testPathAnimation
{
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
    [self.tempView.layer addAnimation:anima forKey:@"pathAnimation"];
}


#pragma mark - CAAnimationGroup

- (void)testGroupAnimation
{
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
    [self.tempView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
}

#pragma mark - CATransition

- (void)testTransitionWithSubType:(NSString *)subtype
{
    //CATransition
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
    CATransition *transition = [CATransition animation];
    //动画类型
    transition.type = @"cube";//立体翻转
    //动画时间
    transition.duration = 1;
    //子类型
    transition.subtype = subtype;
    //添加动画
    [self.imageView.layer addAnimation:transition forKey:nil];
    //切换图片
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)index]];
}

/**
 *  添加手势
 */
- (void)addTransitionGesture
{
    //每个轻扫手势对象只支持一个方向
    //向右
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    //设置从左向右滑
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:rightSwipeGesture];
    
    //向左
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    //设置从右向左滑
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:leftSwipeGesture];
}

/**
 *  轻扫切换图片
 *
 *  @param swipeGesture swipeGesture description
 */
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipeGesture
{
    NSString *subType;
    //判断方向
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右滑");
        //上张图片
        self.index--;
        subType = kCATransitionFromLeft;
    }else{
        NSLog(@"向左滑");
        //下张图片
        self.index++;
        subType = kCATransitionFromRight;
    }
    [self testTransitionWithSubType:subType];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
