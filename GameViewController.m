//
//  GameViewController.m
//  escape
//
//  Created by 関口流星 on 2015/12/09.
//  Copyright © 2015年 関口流星. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController{
    
    int count;
    NSString *countLabel;
    //nowcount用メソッド
    
    int score;   //スコア
    int atomicscore;
    int mode;    //爆弾を選ぶ変数
    int atomic;  //爆弾２を選ぶ変数
    int miss;    //合計ミス数を数える
    int random;  //障害物を出すか爆弾を出すかの変数
    int dog;     //犬を選ぶ変数
    
    
    BOOL hidden;
    
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    IBOutlet UIButton *btn3;
    IBOutlet UIButton *btn4;
    IBOutlet UIButton *btn5;
    IBOutlet UIButton *btn6;
    IBOutlet UIButton *btn7;
    IBOutlet UIButton *btn8;
    IBOutlet UIButton *btn9;
    //草原
    
    IBOutlet UIImageView *bomb1;
    IBOutlet UIImageView *bomb2;
    IBOutlet UIImageView *bomb3;
    IBOutlet UIImageView *bomb4;
    IBOutlet UIImageView *bomb5;
    IBOutlet UIImageView *bomb6;
    IBOutlet UIImageView *bomb7;
    IBOutlet UIImageView *bomb8;
    IBOutlet UIImageView *bomb9;
    //爆弾
    
    IBOutlet UIImageView *atomicbomb1;
    IBOutlet UIImageView *atomicbomb2;
    IBOutlet UIImageView *atomicbomb3;
    IBOutlet UIImageView *atomicbomb4;
    IBOutlet UIImageView *atomicbomb5;
    IBOutlet UIImageView *atomicbomb6;
    IBOutlet UIImageView *atomicbomb7;
    IBOutlet UIImageView *atomicbomb8;
    IBOutlet UIImageView *atomicbomb9;
    //爆弾２
    
    IBOutlet UIImageView *inu1;
    IBOutlet UIImageView *inu2;
    IBOutlet UIImageView *inu3;
    IBOutlet UIImageView *inu4;
    IBOutlet UIImageView *inu5;
    IBOutlet UIImageView *inu6;
    IBOutlet UIImageView *inu7;
    IBOutlet UIImageView *inu8;
    IBOutlet UIImageView *inu9;
    //犬
    
    IBOutlet UIButton *startbtn;
    IBOutlet UILabel *direction;
    //readyの画面時のもの
    
    IBOutlet UIButton *gameoverbtn;
    IBOutlet UIImageView *exploding;
    IBOutlet UILabel *touch;
    IBOutlet UIButton *timeupbtn;
    //gameover時のもの
    
    IBOutlet UILabel *nowscore;
    //スコアラベル
    
    NSTimer *timer;
    int CountDown;
    IBOutlet UILabel *countTimeLabelText;
    IBOutlet UIImageView *timeupbomb;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    score = 0;
    miss  = 0;
    count = 0;
    

}

-(IBAction)PushStart:(id)sender{
    [startbtn setHidden:YES];
    [direction setHidden:YES];
    [btn1 setHidden:NO];
    [btn2 setHidden:NO];
    [btn3 setHidden:NO];
    [btn4 setHidden:NO];
    [btn5 setHidden:NO];
    [btn6 setHidden:NO];
    [btn7 setHidden:NO];
    [btn8 setHidden:NO];
    [btn9 setHidden:NO];
    [nowscore setHidden:NO];
    [countTimeLabelText setHidden:NO];
        //ゲーム画面を表示させる
    [self Select];
        //Selectへ飛ぶ
    [self timerStart];
    
}

-(void)timerStart{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 //タイマー機能を実装する
                                             target:self
                                           selector:@selector(TimerAction)
                                           userInfo:nil
                                            repeats:YES];
    CountDown = 60.0; //時間は60秒間に設定
    
}

-(void)TimerAction{
    if (CountDown >0) {
        CountDown--;
        [countTimeLabelText setText:[NSString stringWithFormat:@"%d",CountDown]];
        
        if(CountDown > 10){
            return;
        }else if(CountDown <= 10){
            countTimeLabelText.textColor = [UIColor redColor];
        }
    }else{
        [timer invalidate];
        [self TimeUp];
    }
}



-(void)nowscoring{   //現在のスコアを表示させる
    count = count +1;
    countLabel = [NSString stringWithFormat:@"%d",count];
    [nowscore setText:countLabel];
    [self reset];
}


-(void)reset{  //爆弾と犬を表示させない
    [bomb1 setHidden:YES];
    [bomb2 setHidden:YES];
    [bomb3 setHidden:YES];
    [bomb4 setHidden:YES];
    [bomb5 setHidden:YES];
    [bomb6 setHidden:YES];
    [bomb7 setHidden:YES];
    [bomb8 setHidden:YES];
    [bomb9 setHidden:YES];
    
    [inu1 setHidden:YES];
    [inu2 setHidden:YES];
    [inu3 setHidden:YES];
    [inu4 setHidden:YES];
    [inu5 setHidden:YES];
    [inu6 setHidden:YES];
    [inu7 setHidden:YES];
    [inu8 setHidden:YES];
    [inu9 setHidden:YES];
    
    [atomicbomb1 setHidden:YES];
    [atomicbomb2 setHidden:YES];
    [atomicbomb3 setHidden:YES];
    [atomicbomb4 setHidden:YES];
    [atomicbomb5 setHidden:YES];
    [atomicbomb6 setHidden:YES];
    [atomicbomb7 setHidden:YES];
    [atomicbomb8 setHidden:YES];
    [atomicbomb9 setHidden:YES];
    
    mode =50;
    dog =50;
    atomic =50;
    //どのモードにも対応しない数値を代入する（犬などの時の変数が延長されることを防ぐ）
    
    [self Select];
}


-(void)Select{
    random = arc4random_uniform(11);  //randomh変数を０から９まで選ぶ
    if (random <=8){  //randomが0〜8であったら
    
    mode = arc4random_uniform(9);  //modeを0〜8の中から選ぶ
        if (mode == 0){        //mode=0の場合bomb1を表示させる。以下同様。
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (random == 9 ){        //random9 障害物を出す
        [self appearingdog];
    }else if(random >= 10){
        [self apperingAtomicbombs];
    }
    

}









-(void)appearingdog{
    dog = arc4random_uniform(9);
    if (dog == 0){
        [inu1 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            mode=1;
            [bomb2 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 1){
        [inu2 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            mode=2;
            [bomb3 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 2){
        [inu3 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            mode=3;
            [bomb4 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 3){
        [inu4 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            mode=4;
            [bomb5 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 4){
        [inu5 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            mode=5;
            [bomb6 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 5){
        [inu6 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            mode=6;
            [bomb7 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 6){
        [inu7 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            mode=7;
            [bomb8 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 7){
        [inu8 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            mode=8;
            [bomb9 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (dog == 8){
        [inu9 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            mode=0;
            [bomb1 setHidden:NO];
        }
    }

}









-(void)apperingAtomicbombs{
    atomic = arc4random_uniform(9);
    if (atomic ==0){
        [atomicbomb1 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            mode =1;
            [bomb2 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (atomic ==1){
        [atomicbomb2 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            mode = 2;
            [bomb3 setHidden:NO];
        }else if (mode ==2){
            [bomb3 setHidden:NO];
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (atomic ==2){
        [atomicbomb3 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
        if (mode == 0){
            [bomb1 setHidden:NO];
        }else if (mode ==1){
            [bomb2 setHidden:NO];
        }else if (mode ==2){
            [bomb4 setHidden:NO];
            mode=3;
        }else if (mode ==3){
            [bomb4 setHidden:NO];
        }else if (mode ==4){
            [bomb5 setHidden:NO];
        }else if (mode ==5){
            [bomb6 setHidden:NO];
        }else if (mode ==6){
            [bomb7 setHidden:NO];
        }else if (mode ==7){
            [bomb8 setHidden:NO];
        }else if (mode ==8){
            [bomb9 setHidden:NO];
        }
    }else if (atomic ==3){
        [atomicbomb4 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
    if (mode == 0){
        [bomb1 setHidden:NO];
         }else if (mode ==1){
        [bomb2 setHidden:NO];
         }else if (mode ==2){
        [bomb3 setHidden:NO];
         }else if (mode ==3){
        mode=4;
        [bomb5 setHidden:NO];
         }else if (mode ==4){
        [bomb5 setHidden:NO];
         }else if (mode ==5){
        [bomb6 setHidden:NO];
         }else if (mode ==6){
        [bomb7 setHidden:NO];
         }else if (mode ==7){
        [bomb8 setHidden:NO];
         }else if (mode ==8){
        [bomb9 setHidden:NO];
         }
    }else if (atomic ==4){
        [atomicbomb5 setHidden:NO];
         mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
      if (mode == 0){
        [bomb1 setHidden:NO];
      }else if (mode ==1){
        [bomb2 setHidden:NO];
      }else if (mode ==2){
        [bomb3 setHidden:NO];
      }else if (mode ==3){
        [bomb4 setHidden:NO];
      }else if (mode ==4){
        mode=5;
        [bomb6 setHidden:NO];
      }else if (mode ==5){
        [bomb6 setHidden:NO];
      }else if (mode ==6){
        [bomb7 setHidden:NO];
      }else if (mode ==7){
        [bomb8 setHidden:NO];
      }else if (mode ==8){
        [bomb9 setHidden:NO];
    }
    }else if (atomic ==5){
         [atomicbomb6 setHidden:NO];
         mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
    if (mode == 0){
        [bomb1 setHidden:NO];
      }else if (mode ==1){
        [bomb2 setHidden:NO];
      }else if (mode ==2){
        [bomb3 setHidden:NO];
      }else if (mode ==3){
        [bomb4 setHidden:NO];
      }else if (mode ==4){
        [bomb5 setHidden:NO];
      }else if (mode ==5){
        mode=6;
        [bomb7 setHidden:NO];
      }else if (mode ==6){
        [bomb7 setHidden:NO];
      }else if (mode ==7){
        [bomb8 setHidden:NO];
      }else if (mode ==8){
        [bomb9 setHidden:NO];
    }
    }else if (atomic ==6){
         [atomicbomb7 setHidden:NO];
         mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
      if (mode == 0){
        [bomb1 setHidden:NO];
      }else if (mode ==1){
        [bomb2 setHidden:NO];
      }else if (mode ==2){
        [bomb3 setHidden:NO];
      }else if (mode ==3){
        [bomb4 setHidden:NO];
      }else if (mode ==4){
        [bomb5 setHidden:NO];
      }else if (mode ==5){
        [bomb6 setHidden:NO];
      }else if (mode ==6){
        mode=7;
        [bomb8 setHidden:NO];
      }else if (mode ==7){
        [bomb8 setHidden:NO];
      }else if (mode ==8){
        [bomb9 setHidden:NO];
      }
    }else if (atomic ==7){
        [atomicbomb8 setHidden:NO];
        mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
      if (mode == 0){
        [bomb1 setHidden:NO];
      }else if (mode ==1){
        [bomb2 setHidden:NO];
      }else if (mode ==2){
        [bomb3 setHidden:NO];
      }else if (mode ==3){
        [bomb4 setHidden:NO];
      }else if (mode ==4){
        [bomb5 setHidden:NO];
      }else if (mode ==5){
        [bomb6 setHidden:NO];
      }else if (mode ==6){
        [bomb7 setHidden:NO];
      }else if (mode ==7){
        mode=8;
        [bomb9 setHidden:NO];
      }else if (mode ==8){
        [bomb9 setHidden:NO];
      }
    }else if (atomic ==8){
          [atomicbomb9 setHidden:NO];
          mode = arc4random_uniform(9);//障害物の他に爆弾も出現させる
    if (mode == 0){
        [bomb1 setHidden:NO];
      }else if (mode ==1){
        [bomb2 setHidden:NO];
      }else if (mode ==2){
        [bomb3 setHidden:NO];
      }else if (mode ==3){
        [bomb4 setHidden:NO];
      }else if (mode ==4){
        [bomb5 setHidden:NO];
      }else if (mode ==5){
        [bomb6 setHidden:NO];
      }else if (mode ==6){
        [bomb7 setHidden:NO];
      }else if (mode ==7){
        [bomb8 setHidden:NO];
      }else if (mode ==8){
        [bomb1 setHidden:NO];
        mode=0;
    }
    }
    
}


    
    
    





    
    
-(IBAction)pushed1{    //mode1のときはscore+1 その他の時はmissesへ飛ぶ
    if (mode==0){
    score = score+1;
        [self nowscoring];
    }else if(atomic ==0){
        atomicscore = atomicscore+1;
        [self nowscoring];
    }else {
        [self misses];
    }
}



-(IBAction)pushed2{
    if (mode==1){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==1){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}

-(IBAction)pushed3{
    if (mode==2){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==2){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}

-(IBAction)pushed4{
    if (mode==3){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==3){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}

-(IBAction)pushed5{
    if (mode==4){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==4){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}

-(IBAction)pushed6{
    if (mode==5){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==5){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}

-(IBAction)pushed7{
    if (mode==6){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==6){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}


-(IBAction)pushed8{
    if (mode==7){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==7){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}



-(IBAction)pushed9{
    if (mode==8){
        score = score+1;
        [self nowscoring];
        
    }else if(atomic ==8){
        atomicscore = atomicscore+1;
        [self nowscoring];
    } else {
        [self misses];
    }
}




-(void)misses{     //missが＋１される
    miss = miss +1;
    CountDown = CountDown-5;
    [countTimeLabelText setText:[NSString stringWithFormat:@"%d",CountDown]];
    if(miss==3){  //missが３になったらgameoverへ飛ぶ
        [self gameover];
    }else{
        [self reset];
    }

}

-(void)TimeUp{
    [timeupbtn setHidden:NO];
    [exploding setHidden:NO];
    [touch setHidden:NO];
    [timeupbomb setHidden:NO];
    
    [btn1 setHidden:YES];
    [btn2 setHidden:YES];
    [btn3 setHidden:YES];
    [btn4 setHidden:YES];
    [btn5 setHidden:YES];
    [btn6 setHidden:YES];
    [btn7 setHidden:YES];
    [btn8 setHidden:YES];
    [btn9 setHidden:YES];
    
    [bomb1 setHidden:YES];
    [bomb2 setHidden:YES];
    [bomb3 setHidden:YES];
    [bomb4 setHidden:YES];
    [bomb5 setHidden:YES];
    [bomb6 setHidden:YES];
    [bomb7 setHidden:YES];
    [bomb8 setHidden:YES];
    [bomb9 setHidden:YES];
    
    [inu1 setHidden:YES];
    [inu2 setHidden:YES];
    [inu3 setHidden:YES];
    [inu4 setHidden:YES];
    [inu5 setHidden:YES];
    [inu6 setHidden:YES];
    [inu7 setHidden:YES];
    [inu8 setHidden:YES];
    [inu9 setHidden:YES];

    
    
}


-(void)gameover{ //gameover画面を表示させる
    [gameoverbtn setHidden:NO];
    [exploding setHidden:NO];
    [touch setHidden:NO];
    
    [timer invalidate];
    
    [btn1 setHidden:YES];
    [btn2 setHidden:YES];
    [btn3 setHidden:YES];
    [btn4 setHidden:YES];
    [btn5 setHidden:YES];
    [btn6 setHidden:YES];
    [btn7 setHidden:YES];
    [btn8 setHidden:YES];
    [btn9 setHidden:YES];
    
    [bomb1 setHidden:YES];
    [bomb2 setHidden:YES];
    [bomb3 setHidden:YES];
    [bomb4 setHidden:YES];
    [bomb5 setHidden:YES];
    [bomb6 setHidden:YES];
    [bomb7 setHidden:YES];
    [bomb8 setHidden:YES];
    [bomb9 setHidden:YES];
    
    [inu1 setHidden:YES];
    [inu2 setHidden:YES];
    [inu3 setHidden:YES];
    [inu4 setHidden:YES];
    [inu5 setHidden:YES];
    [inu6 setHidden:YES];
    [inu7 setHidden:YES];
    [inu8 setHidden:YES];
    [inu9 setHidden:YES];
    
}

-(IBAction)Pushedgameover:(id)sender{
    [self performSegueWithIdentifier:@"ToResultView" sender:self];

}

-(IBAction)Pushedtimeupbtn:(id)sender{
    [self performSegueWithIdentifier:@"ToResultView" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    int score1 = score ;
    int score2 = atomicscore;
    if ([[segue identifier] isEqualToString:@"ToResultView"]) {
        ResultViewContoller *rvc = (ResultViewContoller*)[segue destinationViewController];
        rvc.score1= score1;
        rvc.score2= score2;
    }
}




@end
