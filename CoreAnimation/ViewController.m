//
//  ViewController.m
//  CoreAnimation
//
//  Created by Jn_Kindle on 2018/8/16.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    [self testGroupAnimation];
    
    //----------------CATransition
}

#pragma mark - CABaseAnimation
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


#pragma mark - CAKeyframeAnimation

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


#pragma mark - CAAnimationGroup

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

#pragma mark - CATransition


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
