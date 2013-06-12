//
//  Chat.h
//  TestChat
//
//  Created by sato shun on 2013/06/11.
//  Copyright (c) 2013年 sato shun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chat : NSObject

+ (void)connectSocketTarget:(id)target ipAddress:(NSString *)ipAddress portNo:(uint)portNo iStream:(NSInputStream **)iStream oStream:(NSOutputStream **)oStream readStream:(CFReadStreamRef *)readStream writeStream:(CFWriteStreamRef *)writeStream;


+ (void)test;


@end
