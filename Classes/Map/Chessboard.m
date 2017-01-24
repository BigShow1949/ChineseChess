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
#import "Mandarin.h"

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
    
    [self initRed];
    
    [self initBlack];
    
}

- (void)initRed {

    Pawn * pawn1 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:3 inSection:0]];
    [self addSubview:pawn1];
    [self.chessArr addObject:pawn1];
}

- (void)initBlack {
    
    Pawn * pawn1 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:6 inSection:0]];
    [self addSubview:pawn1];
    [self.chessArr addObject:pawn1];
    
    Pawn * pawn2 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:6 inSection:2]];
    [self addSubview:pawn2];
    [self.chessArr addObject:pawn2];
    
    Pawn * pawn3 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:6 inSection:4]];
    [self addSubview:pawn3];
    [self.chessArr addObject:pawn3];
    
    Pawn * pawn4 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:6 inSection:6]];
    [self addSubview:pawn4];
    [self.chessArr addObject:pawn4];
    
    Pawn * pawn5 = [[Pawn alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:6 inSection:8]];
    [self addSubview:pawn5];
    [self.chessArr addObject:pawn5];
    
    Cannon *cannon = [[Cannon alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:7 inSection:1]];
    [self addSubview:cannon];
    [self.chessArr addObject:cannon];
    
    
    Cannon *cannon2 = [[Cannon alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:7 inSection:7]];
    [self addSubview:cannon2];
    [self.chessArr addObject:cannon2];
    
    Rook * rook = [[Rook alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:0]];
    [self addSubview:rook];
    [self.chessArr addObject:rook];
    
    House * house = [[House alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:1]];
    [self addSubview:house];
    [self.chessArr addObject:house];
    
    Bishop *bishop = [[Bishop alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:2]];
    [self addSubview:bishop];
    [self.chessArr addObject:bishop];
    
    Mandarin *mandarin = [[Mandarin alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:3]];
    [self addSubview:mandarin];
    [self.chessArr addObject:mandarin];
    
    King *king = [[King alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:4]];
    [self addSubview:king];
    [self.chessArr addObject:king];
    
    Mandarin *mandarin2 = [[Mandarin alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:5]];
    [self addSubview:mandarin2];
    [self.chessArr addObject:mandarin2];
    
    
    Bishop *bishop2 = [[Bishop alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:6]];
    [self addSubview:bishop2];
    [self.chessArr addObject:bishop2];
    
    
    House * house2 = [[House alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:7]];
    [self addSubview:house2];
    [self.chessArr addObject:house2];
    
    Rook * rook2 = [[Rook alloc]initWithRowWidth:self.rowWidth andRowLine:[NSIndexPath indexPathForRow:9 inSection:8]];
    [self addSubview:rook2];
    [self.chessArr addObject:rook2];
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
