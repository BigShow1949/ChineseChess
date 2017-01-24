//
//  King.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "King.h"

@implementation King

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index
{
    if (self = [super initWithRowWidth:rowWidth andRowLine:index])
    {
        self.categoryLabel.text = @"帅";
    }
    return self;
}

@end
