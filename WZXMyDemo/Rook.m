//
//  Rook.m
//  WZXMyDemo
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Rook.h"

@implementation Rook

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index
{
    if (self = [super initWithRowWidth:rowWidth andRowLine:index])
    {
        self.categoryLabel.text = @"车";
    }
    return self;
}

@end
