//
//  MessageManager.m
//  WZXMyDemo
//
//  Created by apple on 17/1/24.
//  Copyright © 2017年 wzx. All rights reserved.
//

#import "MessageManager.h"
#import "GCDAsyncSocket.h"

#import "MBProgressHUD+YF.h"

@interface MessageManager()<GCDAsyncSocketDelegate>
@property(nonatomic,strong)GCDAsyncSocket *socket;
@property (nonatomic, strong)NSThread *thread;
@end

@implementation MessageManager
singleton_implementation(MessageManager)

- (void)sendMessageMoveIndex:(NSIndexPath *)fromIndex toIndex:(NSIndexPath *)toIndex {
    NSDictionary *dict = @{@"code" : @"1000",
                           @"data" : @{@"fromIndexRow"    : @"2",
                                       @"fromIndexSection": @"2",
                                       @"toIndexRow"      : @"2",
                                       @"toIndexSection"  : @"2"}};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    [self.socket writeData:data withTimeout:-1 tag:0];
}

#pragma GCDAsyncSocketDelegate
// 接受数据
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",dataStr);

    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showMessage:dataStr];
    });
    [sock readDataWithTimeout:-1 tag:0];
}

// 连接成功后，会回调的函数
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"连接成功");
    
    [self.socket readDataWithTimeout:-1 tag:0];
    //开启线程发送心跳
    [self.thread start];
}

-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    NSLog(@"断开连接 %@",err);
    //再次可以重连
    if (err) {
        [self.socket connectToHost:sock.connectedHost onPort:sock.connectedPort error:nil];
    }else{
        //        正常断开
    }
}

#pragma mark - 心跳
- (void)threadStart{
    @autoreleasepool {
        [NSTimer scheduledTimerWithTimeInterval:500 target:self selector:@selector(heartBeat) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
    }
}

- (void)heartBeat{
    [self.socket writeData:[@"heart" dataUsingEncoding:NSUTF8StringEncoding ] withTimeout:-1 tag:0];
}

- (NSThread*)thread{
    if (!_thread) {
        _thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadStart) object:nil];
    }
    return _thread;
}


- (GCDAsyncSocket *)socket {

    if (!_socket) {
        GCDAsyncSocket *socket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_global_queue(0, 0)];
        [socket connectToHost:@"10.100.70.93" onPort:8088 error:nil];
        _socket = socket;
    }
    return _socket;
}
@end
