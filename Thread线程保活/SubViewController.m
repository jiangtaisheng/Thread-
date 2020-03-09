//
//  SubViewController.m
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/11.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import "SubViewController.h"
#import "ThreadClass.h"
#import "ThreadOtherClass.h"
@interface SubViewController ()
//@property (strong, nonatomic) ThreadClass *threadClass;
@property (strong, nonatomic) ThreadOtherClass *threadClass;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.threadClass=[[ThreadOtherClass alloc]init];
    
    UIButton * btn=[[UIButton alloc]init];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"stop" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    [btn setTintColor:[UIColor redColor]];
    [self.view addSubview:btn];
}

-(void)stop{
    NSLog(@"----stop----");
    [self.threadClass stop];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self.threadClass executeTask:^{
        
        NSLog(@"00000000000===%@==\n",[NSThread currentThread]);
        sleep(5);
    }];
}

@end
