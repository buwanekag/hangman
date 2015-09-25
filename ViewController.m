//
//  ViewController.m
//  Hangman
//
//  Created by Cameron Westbury on 9/24/15.
//  Copyright © 2015 Cameron Westbury. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)      NSArray                   *wordList;
@property (nonatomic,strong)      NSString                  *currentWord;
@property (nonatomic,strong)      NSMutableArray            *correctGuesses;
@property (nonatomic,weak)        IBOutlet UIView           *wordDisplayView;
@property  (nonatomic,weak)       IBOutlet UIImageView      *imageView;



@property (nonatomic,weak)        IBOutlet UIButton         *aButton;
@property (nonatomic,weak)        IBOutlet UIButton         *bButton;
@property (nonatomic,weak)        IBOutlet UIButton         *cButton;
@property (nonatomic,weak)        IBOutlet UIButton         *dButton;
@property (nonatomic,weak)        IBOutlet UIButton         *eButton;
@property (nonatomic,weak)        IBOutlet UIButton         *fButton;
@property (nonatomic,weak)        IBOutlet UIButton         *gButton;
@property (nonatomic,weak)        IBOutlet UIButton         *hButton;
@property (nonatomic,weak)        IBOutlet UIButton         *iButton;
@property (nonatomic,weak)        IBOutlet UIButton         *jButton;
@property (nonatomic,weak)        IBOutlet UIButton         *kButton;
@property (nonatomic,weak)        IBOutlet UIButton         *lButton;
@property (nonatomic,weak)        IBOutlet UIButton         *mButton;
@property (nonatomic,weak)        IBOutlet UIButton         *nButton;
@property (nonatomic,weak)        IBOutlet UIButton         *oButton;
@property (nonatomic,weak)        IBOutlet UIButton         *pButton;
@property (nonatomic,weak)        IBOutlet UIButton         *qButton;
@property (nonatomic,weak)        IBOutlet UIButton         *rButton;
@property (nonatomic,weak)        IBOutlet UIButton         *sButton;
@property (nonatomic,weak)        IBOutlet UIButton         *tButton;
@property (nonatomic,weak)        IBOutlet UIButton         *uButton;
@property (nonatomic,weak)        IBOutlet UIButton         *vButton;
@property (nonatomic,weak)        IBOutlet UIButton         *wButton;
@property (nonatomic,weak)        IBOutlet UIButton         *xButton;
@property (nonatomic,weak)        IBOutlet UIButton         *yButton;
@property (nonatomic,weak)        IBOutlet UIButton         *zButton;
@end

int wrongGuesses = 0;

@implementation ViewController

-(NSString *)readBundleFiletoString:(NSString*)filename ofType:(NSString *)type {
    NSString *path =[[NSBundle mainBundle] pathForResource:filename ofType:type];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}

- (NSArray *)convertCSVStringToArray:(NSString *)csvString {
    NSString *cleanString = [[csvString
                              componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]
                             componentsJoinedByString:@""];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@","];
    return [cleanString componentsSeparatedByCharactersInSet:set];
}

- (IBAction)startGamePressed:(id)sender {
    NSLog(@"Reset");
    int randomIndex = arc4random_uniform((u_int32_t)_wordList.count);
    _currentWord = _wordList[randomIndex];
    NSLog(@"Current Word:%@",_currentWord);
    [self resetButtons];
    [_correctGuesses removeAllObjects];
    for (int i=0; i < _currentWord.length; i++) {
        [_correctGuesses addObject:@""];
        
        [_imageView setImage:nil];
        

        UIColor *blueColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0  blue:255.0/255.0 alpha:1];
        _aButton.tintColor = blueColor;
        _bButton.tintColor = blueColor;
        _cButton.tintColor = blueColor;
        _dButton.tintColor = blueColor;
        _eButton.tintColor = blueColor;
        _fButton.tintColor = blueColor;
        _gButton.tintColor = blueColor;
        _hButton.tintColor = blueColor;
        _iButton.tintColor = blueColor;
        _jButton.tintColor = blueColor;
        _kButton.tintColor = blueColor;
        _lButton.tintColor = blueColor;
        _mButton.tintColor = blueColor;
        _nButton.tintColor = blueColor;
        _oButton.tintColor = blueColor;
        _pButton.tintColor = blueColor;
        _qButton.tintColor = blueColor;
        _rButton.tintColor = blueColor;
        _sButton.tintColor = blueColor;
        _tButton.tintColor = blueColor;
        _uButton.tintColor = blueColor;
        _vButton.tintColor = blueColor;
        _wButton.tintColor = blueColor;
        _xButton.tintColor = blueColor;
        _yButton.tintColor = blueColor;
        _zButton.tintColor = blueColor;
    }
    
    for (id currentObject in [_wordDisplayView subviews]) {
        [currentObject removeFromSuperview];
    }
    
    for (int i=0; i<_currentWord.length; i++) {
        UILabel *blank = [[UILabel alloc]initWithFrame:CGRectMake(15+(20*i), 10, 20, 20)];
        blank.textColor = [UIColor blackColor];
        blank.font = [UIFont fontWithName:@"Futura" size:15.0];
        blank.text = @"_";
        blank.tag = i;
        [_wordDisplayView.self addSubview:blank];
    }
    
  //  UILabel *word = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 20)];
   // word.textColor = [UIColor blackColor];
   // word.font = [UIFont fontWithName:@"Futura" size:15.0];
   // word.text = _currentWord;
   // [_wordDisplayView.self addSubview:word];
    wrongGuesses = 0;
    
}

-(void) resetButtons {
    _aButton.userInteractionEnabled = true;
    _bButton.userInteractionEnabled = true;
    _cButton.userInteractionEnabled = true;
    _dButton.userInteractionEnabled = true;
    _eButton.userInteractionEnabled = true;
    _fButton.userInteractionEnabled = true;
    _gButton.userInteractionEnabled = true;
    _hButton.userInteractionEnabled = true;
    _iButton.userInteractionEnabled = true;
    _jButton.userInteractionEnabled = true;
    _kButton.userInteractionEnabled = true;
    _lButton.userInteractionEnabled = true;
    _mButton.userInteractionEnabled = true;
    _nButton.userInteractionEnabled = true;
    _oButton.userInteractionEnabled = true;
    _pButton.userInteractionEnabled = true;
    _qButton.userInteractionEnabled = true;
    _rButton.userInteractionEnabled = true;
    _sButton.userInteractionEnabled = true;
    _tButton.userInteractionEnabled = true;
    _uButton.userInteractionEnabled = true;
    _vButton.userInteractionEnabled = true;
    _wButton.userInteractionEnabled = true;
    _xButton.userInteractionEnabled = true;
    _yButton.userInteractionEnabled = true;
    _zButton.userInteractionEnabled = true;
}

-(IBAction)letterPressed:(UIButton *)button {
    NSLog(@"%@",[button currentTitle]);
    NSString *searchString = [button currentTitle];
    if ([[_currentWord uppercaseString] containsString:searchString]) {
        NSLog(@"Contains");
        
        button.tintColor = [UIColor colorWithRed:0.0/255.0 green:255.0/255.0  blue:0.0/255.0 alpha:1];
        
        
        for (int i=0; i<_currentWord.length; i++) {
            NSString *letter = [[_currentWord uppercaseString] substringWithRange:NSMakeRange(i, 1)];
            if ([letter isEqualToString:[button currentTitle]]) {
                _correctGuesses[i]=[button currentTitle];
                for (UILabel *currentLabel in [_wordDisplayView subviews]) {
                    if (currentLabel.tag == i) {
                        currentLabel.text = [button currentTitle];
                    }
                }
            }
            
        }
        
       
        
        
        
       
        bool blanksExist = false;
        for (NSString *letter in _correctGuesses) {
            if ([letter isEqualToString:@""]) {
                blanksExist=true;
            }
        }
        if (!blanksExist) {
            NSLog(@"winner");
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Winner"
                                                                           message:@"Congrats!"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"reset" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                      NSLog(@"reset");
                                                                      [self startGamePressed:self];
                                                                  }];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    } else  {
        NSLog(@"WRONG!!!");
        button.tintColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0  blue:0.0/255.0 alpha:1];
        wrongGuesses=wrongGuesses+1;
        [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"frame%i.png",wrongGuesses]]];
       

        
        
        NSLog(@"%i",wrongGuesses);
        if (wrongGuesses == 10) {NSLog(@"Game Over!");
            wrongGuesses = 0;
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Loss"
                                                                    message:[NSString stringWithFormat:@"So Close! The word was:\n%@",_currentWord.capitalizedString]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                      NSLog(@"reset");
                                                                      [self startGamePressed:self];
                                                                  }];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        
        
    }
    button.userInteractionEnabled = false;
}









- (void)viewDidLoad {
    [super viewDidLoad];
    _wordList = [self convertCSVStringToArray:[self readBundleFiletoString:@"WordSetApple" ofType:@"csv"]];
    _correctGuesses = [[NSMutableArray alloc] init];
    [self startGamePressed:self];

    
 
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
