//
//  Chessboard.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Chessboard.h"
#import "Chess.h"

@implementation Chessboard
singleton_implementation(Chessboard)


- (instancetype)initWithStartPt:(CGPoint)pt andRowWidth:(CGFloat)rowWidth
{
    if (self = [super initWithStartPt:pt andRowWidth:rowWidth])
    {
       _chessArr = [NSMutableArray array];
    }
 
    return self;
}


- (BOOL)isHaveChessRow:(NSInteger)row section:(NSInteger)section {
    
    for (Chess *chess in self.chessArr) {
        
        if (chess.index.row == row && chess.index.section == section) {
            return YES;
            break;
        }
    }
    return NO;
}

- (void)initChessboard {

}

@end
