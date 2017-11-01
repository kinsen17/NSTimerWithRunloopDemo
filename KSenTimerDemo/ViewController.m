//
//  ViewController.m
//  KSenTimerDemo
//
//  Created by ehsy-pc on 2017/10/31.
//  Copyright © 2017年 ehsy-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
     NSLog(@"线程的runloop：%@",[NSRunLoop currentRunLoop]);
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self scheduledTimerWithTimeInterval];//主线程里设置定时器
//    [self scheduledTimerWithTimeInterval2];//在子线程里设置定时器
    
//    [self timerWithTimeInterval];
    
}

/**
 scheduledTimerWithTimeInterval 方式设置定时器
 */
-(void)scheduledTimerWithTimeInterval
{
    NSTimer  *timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myLog:) userInfo:nil repeats:YES];
}

/**
 scheduledTimerWithTimeInterval 方式  在子线程里设置定时器,
 */
-(void)scheduledTimerWithTimeInterval2
{
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{

           NSTimer  *timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myLog:) userInfo:nil repeats:YES];
//          [[NSRunLoop currentRunLoop] run];
    });
}

/**
 scheduledTimerWithTimeInterval 方式设置定时器
 */
-(void)timerWithTimeInterval
{
    NSTimer  *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(myLog:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)myLog:(NSTimer *)timer
{
    NSLog(@"--111111--");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
