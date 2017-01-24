//
//  Rook+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Rook+rule.h"
#import "Chessboard.h"

@implementation Rook (rule)
- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    Chessboard *board = [Chessboard sharedChessboard];

    if (ABS(toLine - fromLine) == 0 && toRow < fromRow) { // 向上
        NSLog(@"-- 上");
        for (int i = toRow+1; i < fromRow; i++) {
            if ([board chessOnRow:i section:fromLine]) {
                return NO;
            }
        }
        return YES;
    }else if (ABS(toLine - fromLine) == 0 && toRow > fromRow) { // 向下
        NSLog(@"-- 下");
        for (int i = fromRow+1; i < toRow; i++) {
            if ([board chessOnRow:i section:fromLine]) {
                return NO;
            }
        }
        return YES;
    }else if (toLine > fromLine && ABS(toRow - fromRow) == 0) { // 向右
        NSLog(@"-- 右");
        for (int i = fromLine+1; i < toLine; i++) {
            if ([board chessOnRow:fromRow section:i]) {
                return NO;
            }
        }
        return YES;
    }else if (toLine < fromLine && ABS(toRow - fromRow) == 0) { // 向左
        NSLog(@"-- 左");
        for (int i = toLine+1; i < fromLine; i++) {
            if ([board chessOnRow:fromRow section:i]) {
                return NO;
            }
        }
        return YES;
    }
    
    return NO;
}
@end
