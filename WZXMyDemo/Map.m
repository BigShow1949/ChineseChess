//
//  Map.m
//  WZXMyDemo
//
//  Created by wordoor－z on 16/2/16.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "Map.h"
#import "Chess.h"
#import "House.h"
#import "Move.h"
@implementation Map

- (instancetype)initWithStartPt:(CGPoint)pt andRowWidth:(CGFloat)rowWidth
{
    if (self = [super init])
    {
        _rowWidth = rowWidth;
        
        self.frame = CGRectMake(pt.x, pt.y, rowWidth * 8, rowWidth * 8 + rowWidth);
        
        self.backgroundColor = [UIColor grayColor];
        
        //画列线
        for (int j = 0 ; j < 2; j++)
        {
            for (int i = 0 ; i < 9; i++)
            {
                UIView * line = [[UIView alloc]init];
                line.backgroundColor = [UIColor whiteColor];
                
                if (j == 0)
                {
                  line.frame =CGRectMake(i * rowWidth - 1 , 0, 2 , (self.frame.size.height - rowWidth)/2.0);
                }
                else
                {
                  line.frame =CGRectMake(i * rowWidth - 1 , (self.frame.size.height - rowWidth)/2.0 + rowWidth, 2 , (self.frame.size.height - rowWidth)/2.0);
                }
                [self addSubview:line];
            }
        }
        
        //画行线
        for (int i = 0; i < 10; i++)
        {
            UIView * line = [[UIView alloc]init];

               line.frame = CGRectMake(0, i * rowWidth - 1 , self.frame.size.width , 2);

            line.backgroundColor = [UIColor whiteColor];
            [self addSubview:line];
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint  pt = [touch locationInView:self];
    
    //行
    NSInteger row = floor((pt.y - _rowWidth/2.0)  / _rowWidth) + 1 ;
    
    //列
    NSInteger line = floor((pt.x - _rowWidth/2.0)  / _rowWidth) + 1 ;
    
    for (UIView * view in self.subviews)
    {
        if ([view isKindOfClass:[Chess class]])
        {
            //马
            if ([view isKindOfClass:[House class]])
            {
                House * house = (House *)view;
                if (house.isInAir == YES)
                {
                    if ([house canMoveToIndex:[NSIndexPath indexPathForRow:row inSection:line]])
                    {
                        [house moveToIndex:[NSIndexPath indexPathForRow:row inSection:line]];
                    }
                }
            }
            else
            {
                
            }
        }
    }
    
    NSLog(@"row:%ld line:%ld",row,line);
}

@end
