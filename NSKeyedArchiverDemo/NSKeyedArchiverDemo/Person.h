//
//  Person.h
//  NSKeyedArchiverDemo
//
//  Created by 任鹏 on 2018/4/30.
//  Copyright © 2018年 huyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, copy)NSString *sex;
@end
