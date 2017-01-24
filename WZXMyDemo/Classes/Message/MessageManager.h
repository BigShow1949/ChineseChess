//
//  MessageManager.h
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageManager : NSObject
singleton_interface(MessageManager)
// 发送消息
- (void)sendMessageMoveIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath *)toIndex;


@end
