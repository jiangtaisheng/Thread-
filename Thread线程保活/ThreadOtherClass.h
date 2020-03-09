//
//  ThreadOtherClass.h
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/11.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^PermenantThreadTask)(void);


@interface ThreadOtherClass : NSObject
-(void)executeTask:(PermenantThreadTask)task;
-(void)stop;
@end

NS_ASSUME_NONNULL_END
