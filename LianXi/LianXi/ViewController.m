//
//  ViewController.m
//  LianXi
//
//  Created by lanou3g on 15/6/16.
//  Copyright (c) 2015年 苏红召. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    MyView *myView = [[MyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myView.backgroundColor = [UIColor whiteColor];
    [myView addMySubViews];
    self.view = myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
