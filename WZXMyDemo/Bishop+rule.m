//
//  Bishop+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Bishop+rule.h"

@implementation Bishop (rule)

- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    if (ABS(toRow - fromRow) == 2 && ABS(toLine - fromLine) == 2) { // 上

        // 这里少个判断
        return YES;
    }
    
    return NO;
}
@end
