//
//  ResultViewContoller.m
//  escape
//
//  Created by 関口流星 on 2015/12/09.
//  Copyright © 2015年 関口流星. All rights reserved.
//

#import "ResultViewContoller.h"


@implementation ResultViewContoller{
    NSString *scorelabeltext1;
    NSString *scorelabeltext2;
    NSString *totlelabeltext;
    IBOutlet UILabel *totallabel;
    IBOutlet UILabel *scorelabel1;
    IBOutlet UILabel *scorelabel2;
    
    int totlescore;
 
}


- (void)viewDidLoad {
    scorelabeltext1 = [NSString stringWithFormat:@"%d",_score1];
    [scorelabel1 setText:scorelabeltext1];
    
    scorelabeltext2 = [NSString stringWithFormat:@"%d",_score2];
    [scorelabel2 setText:scorelabeltext2];

    totlescore = _score1 *10 + _score2*50;
    totlelabeltext = [NSString stringWithFormat:@"%d",totlescore];
    [totallabel setText:totlelabeltext];
    
}


@end



