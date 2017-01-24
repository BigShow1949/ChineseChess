//
//  Cannon+rule.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Cannon+rule.h"
#import "Chessboard.h"

#import "Rook+rule.h"

@implementation Cannon (rule)

- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    
    Rook *rook = [[Rook alloc] init];
    rook.index = self.index;
    // 如果车能移动到这里, 那么炮也行
    return [rook canMoveToIndex:index] ? YES : NO;
}

// 默认是能移动就能吃 这里重写
- (BOOL)canEatIndex:(NSIndexPath *)index {
    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    Chessboard *board = [Chessboard sharedChessboard];
    
    if (ABS(toLine - fromLine) == 0 && toRow < fromRow) { // 向上
        NSLog(@"-- 上");
        int count = 0;
        for (int i = toRow+1; i < fromRow; i++) {
            if ([board chessOnRow:i section:fromLine]) {
                count++;
            }
        }
        if (count == 1) {
            return YES;
        }
        
    }else if (ABS(toLine - fromLine) == 0 && toRow > fromRow) { // 向下
        NSLog(@"-- 下");
        int count = 0;
        for (int i = fromRow+1; i < toRow; i++) {
            if ([board chessOnRow:i section:fromLine]) {
                count++;
            }
        }
        if (count == 1) {
            return YES;
        }
    }else if (toLine > fromLine && ABS(toRow - fromRow) == 0) { // 向右
        NSLog(@"-- 右");
        int count = 0;
        for (int i = fromLine+1; i < toLine; i++) {
            if ([board chessOnRow:fromRow section:i]) {
                count++;
            }
        }
        if (count == 1) {
            return YES;
        }
    }else if (toLine < fromLine && ABS(toRow - fromRow) == 0) { // 向左
        NSLog(@"-- 左");
        int count = 0;
        for (int i = toLine+1; i < fromLine; i++) {
            if ([board chessOnRow:fromRow section:i]) {
                count++;
            }
        }
        if (count == 1) {
            return YES;
        }
    }
    
    return NO;
}


@end
