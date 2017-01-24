//
//  Chess+Move.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "Chess+Move.h"
#import "Chessboard.h"

#import "MessageManager.h"
@implementation Chess (Move)

- (void)moveToIndex:(NSIndexPath *)index completion:(void (^)())completion {
    
    // 发送消息
    MessageManager *msgManager = [MessageManager sharedMessageManager];
    [msgManager sendMessageMoveIndex:self.index toIndex:index];
    
    [UIView animateWithDuration:0.5 animations:^{
    
        NSInteger  row = index.row;
        
        NSInteger  line = index.section;
        
        if (row > 5)
        {
            self.frame = CGRectMake(line * self.rowWidth - self.rowWidth/2.0 , row * self.rowWidth - self.rowWidth/2.0 , self.rowWidth, self.rowWidth);
        }
        else
        {
            self.frame = CGRectMake(line * self.rowWidth - self.rowWidth/2.0, row * self.rowWidth - self.rowWidth/2.0,self.rowWidth, self.rowWidth);
        }
        
        }
        completion:^(BOOL finished)
       {
                         
            self.isInAir = NO;
            self.categoryLabel.backgroundColor = [UIColor whiteColor];
            self.index = index;
           
           Chessboard *board = [Chessboard sharedChessboard];
           board.selectedChess = nil;
           
           if (completion) {
               completion();
           }
           
       }];
}

@end
