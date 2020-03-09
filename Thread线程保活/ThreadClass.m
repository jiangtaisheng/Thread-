//
//  ThreadClass.m
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/10.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import "ThreadClass.h"

@interface AliveThread : NSThread

@end

@implementation AliveThread

-(void)dealloc{
    
    NSLog(@"----%s---",__func__);
}


@end



@interface ThreadClass ()

@property (strong, nonatomic) AliveThread * innerThread;
@property(nonatomic,assign,getter=isStopped)BOOL  stopped;

@end

@implementation ThreadClass


-(instancetype)init{
    
    if (self=[super init]) {
        self.stopped=NO;
        __weak typeof(self) weakself=self;
        self.innerThread =[[AliveThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            while(!weakself.isStopped &&weakself) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        [self.innerThread start];
    }
    return self;
}


-(void)executeTask:(PermenantThreadTask)task{
    if ((!task)||(!self.innerThread)) return ;
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

-(void)__executeTask:(PermenantThreadTask)task{
    task();
}

-(void)__stop{
    self.stopped=YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread=nil;
    
    
}
-(void)stop{
    if (!self.innerThread) return ;
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc
{
    NSLog(@"++++++%s", __func__);
    
    [self stop];
}
@end
