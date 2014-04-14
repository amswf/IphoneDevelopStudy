//
//  Calculator.m
//  Study
//
//  Created by Amy on 13-8-1.
//  Copyright (c) 2013年 Amy. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize numerator,denominator;

-(void)print{
    NSLog(@"numerator=%i,denominator=%i",numerator,denominator);
}

-(void)setNumerator:(int)n{
    numerator = n;
}

-(void)setDenominator:(int)d{
    denominator = d;
}

-(void)setDenominator:(int)d setNumerator:(int)n{
    numerator = n;
    denominator = d;
}
-(void)set:(int)d:(int)n{
    numerator = n;
    denominator = d;
}
@end
