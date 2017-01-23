//
//  Rook+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Rook+rule.h"

@implementation Rook (rule)
- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    
    NSInteger  toLine = index.section;
    
    NSInteger  fromRow = self.index.row;
    
    NSInteger  fromLine = self.index.section;
    
    if(ABS(toLine - fromLine) == 0 || ABS(toRow - fromRow) == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
