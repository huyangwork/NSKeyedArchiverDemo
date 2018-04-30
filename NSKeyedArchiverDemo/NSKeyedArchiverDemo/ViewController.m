//
//  ViewController.m
//  NSKeyedArchiverDemo
//
//  Created by 任鹏 on 2018/4/30.
//  Copyright © 2018年 huyang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)save:(id)sender {
    Person *p = [[Person alloc] init];
    p.name = @"胡杨";
    p.sex = @"男";
    p.age = 18;
    NSString * temp  = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"tmp.txt"];
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

- (IBAction)get:(id)sender {
    NSString * temp  = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"tmp.txt"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"姓名:%@---性别:%@---年龄:%ld",p.name,p.sex,p.age);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
