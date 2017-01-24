//
//  Chess.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "Chess.h"
#import "Chessboard.h"

#import "Chess+Move.h"

@implementation Chess

- (instancetype)initWithRowWidth:(CGFloat)rowWidth andRowLine:(NSIndexPath *)index
{
    if (self = [super init])
    {
        
        _isInAir = NO;
        
        _index = index;
        
        _rowWidth = rowWidth;
        
        self.backgroundColor = [UIColor clearColor];
        
        //行
        NSInteger row = index.row;
        
        //列
        NSInteger line = index.section;
        
        if (row > 4)
        {
            self.frame = CGRectMake(line * rowWidth - rowWidth/2.0, row * rowWidth - rowWidth/2.0, rowWidth, rowWidth);
             _color = ChessColorRed;
        }
        else
        {
            self.frame = CGRectMake(line * rowWidth - rowWidth/2.0, row * rowWidth - rowWidth/2.0, rowWidth, rowWidth);
            _color = ChessColorBlack;
        }
        
        self.categoryLabel = ({
        
            UILabel * categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, rowWidth, rowWidth)];

            categoryLabel.textColor = _color == ChessColorRed ? [UIColor redColor] : [UIColor blackColor];
            
            categoryLabel.textAlignment = NSTextAlignmentCenter;
            
            categoryLabel.adjustsFontSizeToFitWidth = YES;
            
            categoryLabel.backgroundColor = [UIColor whiteColor];
            
            categoryLabel.layer.cornerRadius = rowWidth/2.0;
            
            categoryLabel.clipsToBounds = YES;
            
            categoryLabel.layer.borderColor = [UIColor grayColor].CGColor;
            categoryLabel.layer.borderWidth = 2;
            
            categoryLabel;
        });
        [self addSubview:_categoryLabel];
        
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)btnClick:(UIButton *)sender
{
    Chessboard *board = [Chessboard sharedChessboard];
    
    if (board.selectedChess) {
        
        if ([board.selectedChess isEqual:self]) { // 点的是自己
            
            self.isInAir = !self.isInAir;
        }else if (board.selectedChess.color == self.color) { // 己方
            

            board.selectedChess.isInAir = NO;
            self.isInAir = YES;
            board.selectedChess = self;
        }else if (board.selectedChess.color != self.color) { // 敌方
            
            // 吃子
            if ([board.selectedChess canEatIndex:self.index]) {
                [board.selectedChess moveToIndex:self.index completion:^{
                    [self removeFromSuperview];
                }];
            }
            
        }
    }else {
        self.isInAir = YES;
        board.selectedChess = self;
    }
}

- (void)setIsInAir:(BOOL)isInAir {

    _isInAir = isInAir;
    
    if (isInAir)
    {
        self.categoryLabel.backgroundColor = [UIColor blackColor];
    }
    else
    {
        self.categoryLabel.backgroundColor = [UIColor whiteColor];
    }
}


- (void)setColor:(ChessColor)color {

    _color = color;
    if (color == ChessColorRed) {
        _categoryLabel.textColor = [UIColor redColor];
    }else if (color == ChessColorBlack) {
        _categoryLabel.textColor = [UIColor blackColor];
    }
}

// 由子类实现 而且子类必须实现(怎么提示?)
- (BOOL)canMoveToIndex:(NSIndexPath *)index
{
    return NO;
}

// 默认是能移动就能吃
- (BOOL)canEatIndex:(NSIndexPath *)index {
    if ([self canMoveToIndex:index]) {
        return YES;
    }
    return NO;
}


- (NSString *)description {

    return [NSString stringWithFormat:@"%@", self.categoryLabel.text];
}
@end
