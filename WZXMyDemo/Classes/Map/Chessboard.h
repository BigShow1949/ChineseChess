//
//  Chessboard.h
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "Map.h"

@class Chess;
@interface Chessboard : Map

singleton_interface(Chessboard)


@property (nonatomic, strong) Chess *selectedChess;

@property (nonatomic, strong) NSMutableArray<Chess *> *chessArr;

- (Chess *)chessOnRow:(NSInteger)row section:(NSInteger)section;

- (void)initChessboard;

- (void)moveIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath *)toIndex;

@end
