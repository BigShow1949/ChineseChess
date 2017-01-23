//
//  House+rule.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "House+rule.h"

@implementation House (rule)

- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    
    NSInteger  toLine = index.section;
    
    NSInteger  fromRow = self.index.row;
    
    NSInteger  fromLine = self.index.section;

    if(ABS(toLine - fromLine) == 1 && ABS(toRow - fromRow) == 2)
    {
        return YES;
    }
    else if(ABS(toLine - fromLine) == 2 && ABS(toRow - fromRow) == 1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
