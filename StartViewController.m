//
//  StartViewController.m
//  escape
//
//  Created by 関口流星 on 2015/12/23.
//  Copyright © 2015年 関口流星. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController{
    int bestrecord;
    NSString *scorelabel;
    IBOutlet UIButton *startbtn;
    IBOutlet UILabel *scorelabelText;
    IBOutlet UIButton *resetbtn;
    
    IBOutlet UILabel *resetLabel;
    IBOutlet UIButton *resetYESbtn;
    IBOutlet UIButton *resetNobtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    bestrecord = [ud integerForKey:@"KYE_I"];
    
    [self RecordPoint];
}

-(void)RecordPoint{
    if (bestrecord < _record){
        bestrecord = _record;
        scorelabel = [NSString stringWithFormat:@"%d",bestrecord];
        [scorelabelText setText:scorelabel];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setInteger:bestrecord forKey:@"KYE_I"];
      
        
    }else if (bestrecord >= _record ){
        scorelabel = [NSString stringWithFormat:@"%d",bestrecord];
        [scorelabelText setText:scorelabel];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setInteger:bestrecord forKey:@"KYE_I"];
    }
}




-(IBAction)PushedReset:(id)sender{
    [resetLabel setHidden:NO];
    [resetNobtn setHidden:NO];
    [resetYESbtn setHidden:NO];
    [startbtn setHidden:YES];
}


-(IBAction)PushedYESbtn:(id)sender{
    bestrecord = 0;
    scorelabel = [NSString stringWithFormat:@"%d",bestrecord];
    [scorelabelText setText:scorelabel];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:@"KYE_I"];
    
    
    [resetLabel setHidden:YES];
    [resetNobtn setHidden:YES];
    [resetYESbtn setHidden:YES];
    [startbtn setHidden:NO];
    
}

-(IBAction)PushedNObtn:(id)sender{
    [resetLabel setHidden:YES];
    [resetNobtn setHidden:YES];
    [resetYESbtn setHidden:YES];
    [startbtn setHidden:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
