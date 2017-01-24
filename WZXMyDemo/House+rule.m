//
//  House+rule.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "House+rule.h"
#import "Chessboard.h"

@implementation House (rule)


- (BOOL)canMoveToIndex:(NSIndexPath *)index {

    NSInteger  toRow = index.row;
    NSInteger  toLine = index.section;
    NSInteger  fromRow = self.index.row;
    NSInteger  fromLine = self.index.section;
    
    Chessboard *board = [Chessboard sharedChessboard];
    
    if ( (toRow - fromRow) == -2 && ABS(toLine - fromLine) == 1) { // 上
        if ([board isHaveChessRow:fromRow-1 section:fromLine]) {
            return NO;
        }
    }else if ((toRow - fromRow) == 2 && ABS(toLine - fromLine) == 1) { // 下
        if ([board isHaveChessRow:fromRow+1 section:fromLine]) {
            return NO;
        }
    }else if (ABS(toRow - fromRow) == 1 && (toLine - fromLine) == -2) { // 左
        if ([board isHaveChessRow:fromRow section:fromLine-1]) {
            return NO;
        }
    }else if (ABS(toRow - fromRow) == 1 && (toLine - fromLine) == 2) { // 右
        if ([board isHaveChessRow:fromRow section:fromLine+1]) {
            return NO;
        }
    }
    return YES;;
}

@end
