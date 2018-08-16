//
//  ViewController.m
//  LGPipPlayerDemo
//
//  Created by hzx on 2018/8/16.
//  Copyright © 2018年 hzx. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVPlayerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 100, 50)];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    

}

- (void)click:(UIButton *)sender{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"282" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    playerVC.player = [[AVPlayer alloc] initWithURL:url];
    playerVC.delegate = self;
    playerVC.allowsPictureInPicturePlayback = YES;
    
    [self presentViewController:playerVC animated:YES completion:nil];
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(nonnull void (^)(BOOL))completionHandler{
    [self presentViewController:playerViewController animated:YES completion:^{
        completionHandler(YES);
    }];
    
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController
{
    //默认返回YES，表示进入PIP模式后，dismiss掉‘原视图’的layer
    return YES;
}


@end
