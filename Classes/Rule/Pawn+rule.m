//
//  Pawn+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Pawn+rule.h"

@implementation Pawn (rule)


- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    if (toLine == fromLine && toRow - fromRow == 1) { // 上
        return YES;
    }else if (toRow == fromRow && toLine - fromLine == -1) {  // 左
        return YES;
    }else if (toRow == fromRow && toLine - fromLine == 1) {  // 右
        return YES;
    }
    
    return NO;
}
@end
