//
//  ViewController.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "ViewController.h"
#import "Chessboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Chessboard * board = [[Chessboard alloc]initWithStartPt:CGPointMake(20, 60) andRowWidth:(self.view.frame.size.width - 20 * 2)/8.0];
    [self.view addSubview:board];
    
    [board initChessboard];
    
    
    NSLog(@"count = %d", board.chessArr.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
