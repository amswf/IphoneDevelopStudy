//
//  AdServer.h
//  NetRequest
//
//  Created by Amy on 14-1-7.
//  Copyright (c) 2014年 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdServer : NSObject
@property(readwrite) NSMutableData* receiveData;
-(void)tongBuGet;
-(void)tongBuPost;
-(void)yiBuGet;
-(void)yibuPost;
@end