//
//  StartViewController.m
//  escape
//
//  Created by 関口流星 on 2015/12/23.
//  Copyright © 2015年 関口流星. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController{
    BOOL firstcommit;
    int newrecord;
    NSString *scorelabel;
    IBOutlet UILabel *scorelabelText;
    IBOutlet UIButton *resetbtn;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    newrecord = [ud integerForKey:@"KYE_I"];

    [self RecordPoint];
    
}

-(void)RecordPoint{
    if (newrecord < _record){
        newrecord = _record;
        scorelabel = [NSString stringWithFormat:@"%d",newrecord];
        [scorelabelText setText:scorelabel];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setInteger:100 forKey:@"KEY_I"];
        
    }else if (newrecord >= _record ){
        return;
    }
}




-(IBAction)PushedReset:(id)sender{
    newrecord = 0;
    scorelabel = [NSString stringWithFormat:@"%d",newrecord];
    [scorelabelText setText:scorelabel];

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
