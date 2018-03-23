//
//  ViewController.m
//  Calculator
//
//  Created by Edward Hubbard on 11/3/16.
//  Copyright © 2016 Edward Hubbard. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end


@implementation ViewController

@synthesize outDisplay;
@synthesize placeCounter;
@synthesize isInDecimalMode;
@synthesize decimalPlaceCounter;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.placeCounter=0;
    self.isInDecimalMode=false;
    self.decimalPlaceCounter=-1;
    outDisplay.textColor = [UIColor colorWithDisplayP3Red:1 green:1 blue:1 alpha:1];
    
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//number buttons set values to be calculated

- (IBAction)oneButton:(id)sender
{
    self.myoperand = 1;
    [self setValueWithInteger:self.myoperand];
    
}

- (IBAction)twoButton:(id)sender
{
    self.myoperand = 2;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)threeButton:(id)sender
{
    self.myoperand = 3;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)fourButton:(id)sender
{
    self.myoperand = 4 ;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)fiveButton:(id)sender
{
    self.myoperand =5 ;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)sixButton:(id)sender
{
    self.myoperand = 6;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)sevenButton:(id)sender
{
   self.myoperand = 7;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)eightButton:(id)sender
{
    self.myoperand = 8;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)nineButton:(id)sender
{
    self.myoperand = 9;
    [self setValueWithInteger:self.myoperand];
}

- (IBAction)zeroButton:(id)sender
{
    self.myoperand = 0;
    [self setValueWithInteger:self.myoperand];
}
- (IBAction)negativeNumber:(id)sender
{
    _completeValue*=-1;
    NSLog(@"%Lf",_completeValue);
}

//decimal button whch puts entered numbers after decimal place


- (IBAction)decimalButton:(id)sender
{
    self.isInDecimalMode=true;
}

//getter and setter methods for number butons, does place conversions and displays

-(void)setValueWithInteger:(long double)value
{
    if(self.placeCounter<8&&self.isInDecimalMode==false)
    {
        [self operandPlaceConverter];
    }
    else if(self.isInDecimalMode==true&&self.decimalPlaceCounter > -7)
    {
        [self decimalPlaceConverter];
    }
        NSLog(@"%Lf",_completeValue);
        outDisplay.placeholder = [NSString stringWithFormat:@"%Lf",self.completeValue];
}

-(void)decimalPlaceConverter
{
    self.completeValue+=self.myoperand*pow(10,self.decimalPlaceCounter);
    self.decimalPlaceCounter--;
}

-(void)operandPlaceConverter
{
    self.completeValue*=10;
    self.completeValue+=self.myoperand;
    self.placeCounter++;
    
}

//operator buttons stores previous value in storedValue and sets integer operator switch
//equal button calls completeOperation method

- (IBAction)plusButton:(id)sender
{
    self.isInDecimalMode=false;
    self.storedValue=self.completeValue;
    self.completeValue=0;
    self.operation =1;
    NSLog(@"%Lf",_completeValue);
    outDisplay.placeholder =[NSString stringWithFormat:@"%Lf",_storedValue];
}
- (IBAction)multiplyButton:(id)sender
{
    self.isInDecimalMode=false;
    self.storedValue=self.completeValue;
    self.completeValue=0;
    self.operation =3;
    NSLog(@"%Lf",_completeValue);
    outDisplay.placeholder =[NSString stringWithFormat:@"%Lf",_storedValue];

}
- (IBAction)minusButton:(id)sender
{
    self.isInDecimalMode=false;
    self.storedValue=self.completeValue;
    self.completeValue=0;
    self.operation =2;
    NSLog(@"%Lf",_completeValue);
    outDisplay.placeholder =[NSString stringWithFormat:@"%Lf",_storedValue];

}

- (IBAction)divideButton:(id)sender
{
    self.isInDecimalMode=false;
    self.storedValue=self.completeValue;
    self.completeValue=0;
    self.operation =4;
    NSLog(@"%Lf",_completeValue);
    outDisplay.placeholder =[NSString stringWithFormat:@"%Lf",_storedValue];

}
- (IBAction)equalButton:(id)sender
{
    self.isInDecimalMode=false;
    [self completeOpereation];
    _completeValue=0;
    _storedValue = 0;
}

- (IBAction)ansSquared:(id)sender
{
    _completeValue=pow(_completeValue,2);
    outDisplay.placeholder=[NSString stringWithFormat:@"%Lf",_completeValue];
}

- (IBAction)ansPercent:(id)sender
{
    _completeValue=_completeValue*.01;
    outDisplay.placeholder=[NSString stringWithFormat:@"%Lf",_completeValue];
}

-(void)completeOpereation
{
    switch (self.operation)
    {
        case 1: self.completeValue+=_storedValue;
            
            break;
        case 2: _completeValue=_storedValue-_completeValue;
            break;
        case 3: _completeValue*=_storedValue;
            break;
        case 4:_completeValue=_storedValue/_completeValue;
            break;
    }
    outDisplay.placeholder =[NSString stringWithFormat:@"%Lf",_completeValue];
}

// resets all values to zero and clears the display

- (IBAction)clearButton:(id)sender
{
    [self resetAllParameters];
    outDisplay.placeholder= [NSString stringWithFormat:@"%Lf",_completeValue];
}

-(void)resetAllParameters
{
    _completeValue=0;
    _storedValue = 0;
    self.isInDecimalMode=false;
    self.decimalPlaceCounter =-1;
    self.placeCounter=0;
}

@end
