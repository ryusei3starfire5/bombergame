//
//  ViewController.m
//  escape
//
//  Created by 関口流星 on 2015/12/02.
//  Copyright © 2015年 関口流星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController{
    
    int newrecord;
    NSString *scorelabel;
    IBOutlet UILabel *scorelabelText;
    
    IBOutlet UIButton *resetbtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    newrecord =0;
    scorelabel = [NSString stringWithFormat:@"%d",newrecord];
    [scorelabelText setText:scorelabel];
    [self RecordPoint];
    
}

-(void)RecordPoint{
    if (newrecord < _record){
        newrecord = _record;
        scorelabel = [NSString stringWithFormat:@"%d",newrecord];
        [scorelabelText setText:scorelabel];
    }else if (newrecord >= _record ){
        return;
    }
}

-(void)PushedReset{
    newrecord = 0;
    scorelabel = [NSString stringWithFormat:@"%d",newrecord];
    [scorelabelText setText:scorelabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
