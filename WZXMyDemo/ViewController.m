//
//  ViewController.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "ViewController.h"
#import "Map.h"
#import "House.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Map * map = [[Map alloc]initWithStartPt:CGPointMake(20, 60) andRowWidth:(self.view.frame.size.width - 20 * 2)/8.0];
    [self.view addSubview:map];
    
    House * house = [[House alloc]initWithRowWidth:map.rowWidth andRowLine:[NSIndexPath indexPathForRow:5 inSection:5]];
    [house newChess];
    [map addSubview:house];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
