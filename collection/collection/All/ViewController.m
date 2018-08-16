//
//  ViewController.m
//  collection
//
//  Created by admin on 2018/6/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "LLSystemViewController.h"
#import "LLCustomViewController.h"
#import "LLFlowViewController.h"
#import "LLCircleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)systemLayout:(UIButton *)sender {
    LLSystemViewController *systemVC = [[LLSystemViewController alloc] init];
    [self.navigationController pushViewController:systemVC animated:YES];
}

- (IBAction)customLayout:(UIButton *)sender {
    LLCustomViewController *customVC = [[LLCustomViewController alloc] init];
    [self.navigationController pushViewController:customVC animated:YES];
}

- (IBAction)flowLayout:(UIButton *)sender {
    LLFlowViewController *flowVC = [[LLFlowViewController alloc] init];
    [self.navigationController pushViewController:flowVC animated:YES];
}

- (IBAction)circleLayout:(UIButton *)sender {
    LLCircleViewController *circleVC = [[LLCircleViewController alloc] init];
    [self.navigationController pushViewController:circleVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
