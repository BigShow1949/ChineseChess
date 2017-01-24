//
//  Player.h
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PlayerColor) {
    PlayerColorRed   = 1,
    PlayerColorBlack = 2,
};

@interface Player : NSObject

@property (nonatomic, assign) PlayerColor color;

// 默认是红色 下  黑色 上
/*
 坐标转换
 012   876
 345   543
 678   210
 */
@end
