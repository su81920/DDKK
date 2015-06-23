//
//  MyView.m
//  LianXi
//
//  Created by lanou3g on 15/6/17.
//  Copyright (c) 2015年 苏红召. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)addMySubViews{
    UILabel *localizationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 60)];
    //英文状态下  localization
    //中文状态下   国际化
    //1、第一个参数（键），第二个参数（提示性语句） NSLocalizedString  （需要固定使用Localizable.strings文件名）
    //        localizationLabel.text = NSLocalizedString(@"local", @"国际化label");
    //2、不需要使用固定名称的.strings文件  第二个参数--表名
    //    localizationLabel.text = NSLocalizedStringFromTable(@"local", @"InfoPlist", @"国际化label");
    //3、InfoPlist.Strings
    //将工程命名国际化
    
    //4、应用内国际化
    localizationLabel.text = [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[[NSUserDefaults standardUserDefaults] valueForKey:@"ChangeLanguage"] ofType:@"lproj"]]localizedStringForKey:@"local" value:@"" table:@"SuiBian"];
    
    
    [self addSubview:localizationLabel];
    
    
    UIButton *changeLan = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeLan.frame = CGRectMake(143, 100, 100, 30);
    changeLan.backgroundColor = [UIColor cyanColor];
    [changeLan setTitle:@"localizable" forState:UIControlStateNormal];
    [self addSubview:changeLan];
    [changeLan addTarget:self action:@selector(changeLanguage) forControlEvents:UIControlEventTouchDown];
}

-(void)changeLanguage{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"ChangeLanguage"] isEqual:@"en"]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"zh-Hans" forKey:@"ChangeLanguage"];
    }else{
        [[NSUserDefaults standardUserDefaults] setValue:@"en" forKey:@"ChangeLanguage"];
    }
    //同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    //    [self viewDidLoad];
    //5、重新布局
    [self setNeedsLayout];
}

//需要使用多态的方式去实现layoutSubviews
-(void)layoutSubviews{
    NSLog(@"layoutSubviews");
    for (UIView *aView in [self subviews]) {
        [aView removeFromSuperview];
    }
    [self addMySubViews];
}

@end
