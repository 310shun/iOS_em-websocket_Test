//
//  ViewController.m
//  TestChat
//
//  Created by sato shun on 2013/06/11.
//  Copyright (c) 2013年 sato shun. All rights reserved.
//

#import "ViewController.h"
#import "Chat.h"
#import <CFNetwork/CFNetwork.h>
#import "SRWebSocket.h"


@interface ViewController ()
{
    NSInputStream *iStream;
    NSOutputStream *oStream;
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    SRWebSocket *web_socket;
}



//@property (assign, nonatomic) CFReadStreamRef *readStream;
//@property (assign, nonatomic) CFWriteStreamRef *writeStream;
//@property (strong, nonatomic) NSInputStream *iStream;
//@property (strong, nonatomic) NSOutputStream *oStream;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouched:(id)sender
{
//    readStream = NULL;
//    writeStream = NULL;
//    iStream = [[NSInputStream alloc] init];
//    oStream = [[NSOutputStream alloc] init];
    //[Chat connectSocketTarget:self ipAddress:@"localhost" portNo:9292 iStream:iStream oStream:oStream readStream:readStream writeStream:writeStream];
    //[self connectToServerUsingCFStream:@"localhost" portNo:9292];
    
    //SRWebSocket *web_socket = [[SRWebSocket alloc] initWithURLRequest:
    //                           [NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://localhost:9292/"]]];
    web_socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://0.0.0.0:8080/"]]];
    [web_socket setDelegate:self];
    [web_socket open];
    
    //[web_socket send:@"送信しました"];
}

-(void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    [webSocket send:@"送信しました"];
    NSLog(@"Opened!!");
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"receive message!");
}







- (IBAction)sendButtonTouched:(id)sender
{
    [web_socket send:@"送信しました"];
}



//-(void) connectToServerUsingCFStream:(NSString *) urlStr portNo: (uint) portNo {
//    
//    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
//                                       (__bridge CFStringRef) urlStr,
//                                       portNo,
//                                       &readStream,
//                                       &writeStream);
//    
//    if (readStream && writeStream) {
//        CFReadStreamSetProperty(readStream,
//                                kCFStreamPropertyShouldCloseNativeSocket,
//                                kCFBooleanTrue);
//        CFWriteStreamSetProperty(writeStream,
//                                 kCFStreamPropertyShouldCloseNativeSocket,
//                                 kCFBooleanTrue);
//        
//        iStream = (__bridge NSInputStream *)readStream;
//        //[iStream retain];
//        [iStream setDelegate:self];
//        [iStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
//                           forMode:NSDefaultRunLoopMode];
//        [iStream open];
//        
//        oStream = (__bridge NSOutputStream *)writeStream;
//        //[oStream retain];
//        [oStream setDelegate:self];
//        [oStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
//                           forMode:NSDefaultRunLoopMode];
//        [oStream open];
//    }
//}
//
//
//
//- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
//{
//    NSLog(@"##");
//}
//


@end
