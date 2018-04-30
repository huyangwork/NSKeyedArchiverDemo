//
//  Person.m
//  NSKeyedArchiverDemo
//
//  Created by 任鹏 on 2018/4/30.
//  Copyright © 2018年 huyang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
//当我们归档这个对象的时候就会来到这里!!
- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        //kvc 获取属性的值
        id value = [self valueForKey:key];
        
        //归档!!
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:key];
            //设置到属性上面  kvc
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end
