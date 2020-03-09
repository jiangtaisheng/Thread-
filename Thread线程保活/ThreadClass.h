//
//  ThreadClass.h
//  Thread线程保活
//
//  Created by jiangtaisheng on 2019/6/10.
//  Copyright © 2019 jiangtaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PermenantThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ThreadClass : NSObject
-(void)executeTask:(PermenantThreadTask)task;
-(void)stop;
@end

NS_ASSUME_NONNULL_END
