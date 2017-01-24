//
//  Chessboard.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Chessboard.h"

#import "House.h"
#import "Rook.h"
#import "Pawn.h"
#import "Bishop.h"
#import "King.h"
#import "Cannon.h"

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
            NSLog(@"有:%@", chess);
            return YES;
            break;
        }
    }
    return NO;
}

//- (void)setSelectedChess:(Chess *)selectedChess {
//
//    selectedChess.isInAir = YES;
//    _selectedChess = selectedChess;
//}

- (void)initChessboard {
    House * house2 = [[House alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:3 inSection:2]];
    [self addSubview:house2];
    [self.chessArr addObject:house2];
    
    House * house3 = [[House alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:3 inSection:5]];
    [self addSubview:house3];
    [self.chessArr addObject:house3];
    
    House * house = [[House alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:5 inSection:3]];
    [self addSubview:house];
    [self.chessArr addObject:house];
    
    Rook * rook = [[Rook alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:5 inSection:2]];
    [self addSubview:rook];
    [self.chessArr addObject:rook];
    
    Pawn * pawn = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:5 inSection:0]];
    [self addSubview:pawn];
    [self.chessArr addObject:pawn];
    
    Bishop *bishop = [[Bishop alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:2]];
    [self addSubview:bishop];
    [self.chessArr addObject:bishop];
    
    King *king = [[King alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:4]];
    [self addSubview:king];
    [self.chessArr addObject:king];
    
    Cannon *cannon = [[Cannon alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:7 inSection:2]];
    [self addSubview:cannon];
    [self.chessArr addObject:cannon];
}

//- (void)layoutSubviews {
//
//    NSMutableArray *tempArr = [NSMutableArray array];
//    for (UIView *view in self.subviews) {
//        if ([view isKindOfClass:[Chess class]]) {
//            [tempArr addObject:view];
//        }
//    }
//    self.chessArr = [NSArray arrayWithArray:tempArr];
//    tempArr = nil;
//}

@end
