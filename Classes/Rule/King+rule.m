//
//  King+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "King+rule.h"

@implementation King (rule)

- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    if (ABS(toRow - fromRow) == 1 && ABS(toLine - fromLine) == 0) { // 上下
        if (toRow >= 7 && toLine>=3 && toLine <=5) {
            return YES;
        }else {
            NSLog(@"%d %d", toRow, toLine);
        }
    }else if ((ABS(toRow - fromRow) == 0 && ABS(toLine - fromLine) == 1)) { // 左右
        if (toRow >= 7 && toLine>=3 && toLine <=5) {
            return YES;
        }else {
            NSLog(@"%d %d", toRow, toLine);
        }
    }
    return NO;
}
@end
