//
//  ViewController.m
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/10.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn=[[UIButton alloc]init];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"next" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn setTintColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)next{
    SubViewController * sub=[[SubViewController alloc]init];

    [self.navigationController pushViewController:sub animated:YES];
}
@end
