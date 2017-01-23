//
//  Map.h
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Map : UIView

/**
 *  每格的宽度
 */
@property (nonatomic,assign)CGFloat rowWidth;


- (instancetype)initWithStartPt:(CGPoint)pt andRowWidth:(CGFloat)rowWidth;
@end
