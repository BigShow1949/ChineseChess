//
//  ViewController.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "ViewController.h"
#import "Chessboard.h"
#import "House.h"
#import "Rook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Chessboard * board = [[Chessboard alloc]initWithStartPt:CGPointMake(20, 60) andRowWidth:(self.view.frame.size.width - 20 * 2)/8.0];
    [self.view addSubview:board];
    
    House * house2 = [[House alloc]initWithRowWidth:board.rowWidth andRowLine:[NSIndexPath indexPathForRow:3 inSection:4]];
    [board addSubview:house2];
    [board.chessArr addObject:house2];
    
    House * house = [[House alloc]initWithRowWidth:board.rowWidth andRowLine:[NSIndexPath indexPathForRow:5 inSection:3]];
    [board addSubview:house];
    [board.chessArr addObject:house];
    
    Rook * rook = [[Rook alloc]initWithRowWidth:board.rowWidth andRowLine:[NSIndexPath indexPathForRow:4 inSection:3]];
    [board addSubview:rook];
    [board.chessArr addObject:rook];
    
    NSLog(@"count = %d", board.chessArr.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
