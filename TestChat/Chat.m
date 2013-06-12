//
//  Chat.m
//  TestChat
//
//  Created by sato shun on 2013/06/11.
//  Copyright (c) 2013年 sato shun. All rights reserved.
//

#import "Chat.h"
#import <CFNetwork/CFNetwork.h>

@implementation Chat

+ (void)connectSocketTarget:(id)target ipAddress:(NSString *)ipAddress portNo:(uint)portNo iStream:(NSInputStream **)iStream oStream:(NSOutputStream **)oStream readStream:(CFReadStreamRef *)readStream writeStream:(CFWriteStreamRef *)writeStream
{
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, (CFStringRef)ipAddress, portNo, readStream, writeStream);
    
    if (*readStream && *writeStream) {
        CFReadStreamSetProperty(*readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
        CFWriteStreamSetProperty(*writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
        
        *iStream = (NSInputStream *)*readStream;
        [*iStream retain];
        [*iStream setDelegate:target];
        [*iStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [*iStream open];
        
        *oStream = (NSOutputStream *)*writeStream;
        [*oStream retain];
        [*oStream setDelegate:target];
        [*oStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [*oStream open];
    }
}

+ (void)test
{
    
}


@end
