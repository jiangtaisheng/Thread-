//
//  ThreadOtherClass.m
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/11.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import "ThreadOtherClass.h"

@interface AliveThread : NSThread

@end

@implementation AliveThread

-(void)dealloc{
    
    NSLog(@"----%s---",__func__);
}


@end








@interface ThreadOtherClass ()

@property (strong, nonatomic) AliveThread * innerThread;

@end

@implementation ThreadOtherClass


-(instancetype)init{
    
    if (self=[super init]) {
        self.innerThread =[[AliveThread alloc] initWithBlock:^{
            NSLog(@"begin----");

            CFRunLoopSourceContext context={0};
            CFRunLoopSourceRef source =CFRunLoopSourceCreate(kCFAllocatorDefault, 0,  &context);
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source,kCFRunLoopDefaultMode);
            
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            NSLog(@"end----");

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
