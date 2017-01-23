//
//  Chess.h
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"

@interface Chess : UIButton

/**
 *  棋子上的Label
 */
@property (nonatomic,strong)UILabel * categoryLabel;

/**
 *  棋子的类别 (红，黑)默认为红
 */
@property (nonatomic,assign)BOOL isRed;

/**
 *  棋子的状态 (拿起，放下)默认为放下
 */
@property (nonatomic,assign)BOOL isInAir;

/**
 *  每格的宽度
 */
@property (nonatomic,assign)CGFloat rowWidth;

/**
 *  目前的行列
 */
@property (nonatomic,copy)NSIndexPath * index;

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index;
@end
