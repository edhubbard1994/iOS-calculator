//
//  ViewController.h
//  Calculator
//
//  Created by Edward Hubbard on 11/3/16.
//  Copyright © 2016 Edward Hubbard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property long double myoperand;
@property long double completeValue;
@property double placeCounter;
@property long double storedValue;

@property int decimalPlaceCounter;
@property int operation;

@property BOOL isInDecimalMode;

@property (weak, nonatomic) IBOutlet UITextField *outDisplay;


-(void)setValueWithInteger:(long double)value;
-(void)operandPlaceConverter;
-(void)decimalPlaceConverter;
-(void)completeOpereation;
-(void)resetAllParameters;

@end

