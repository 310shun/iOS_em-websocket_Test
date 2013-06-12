//
//  ViewController.h
//  TestChat
//
//  Created by sato shun on 2013/06/11.
//  Copyright (c) 2013年 sato shun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRWebSocket.h"

@interface ViewController : UIViewController <SRWebSocketDelegate>
- (IBAction)buttonTouched:(id)sender;
- (IBAction)sendButtonTouched:(id)sender;

@end
