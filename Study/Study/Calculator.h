//
//  Calculator.h
//  Study
//
//  Created by Amy on 13-8-1.
//  Copyright (c) 2013年 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
{
    int numerator;//分子
    int denominator;//分母
}
//存取方法
@property int numerator,denominator;

-(void)print;
-(void)setNumerator:(int)n ;
-(void)setDenominator:(int)d;
-(void)setDenominator:(int)d setNumerator:(int)n;
-(void)set:(int)d :(int)n;
@end
