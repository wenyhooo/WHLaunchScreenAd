//
//  GXSplashStore.m
//  XHLaunchAdExample
//
//  Created by liwenhao on 16/7/20.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "GXSplashAdStore.h"
#import "GXSplashModel.h"
#import "UIImageView+XHWebCache.h"
#import "GXLaunchAdView.h"
@implementation GXSplashAdStore


+ (void)appLaunchLoadShowSplash
{
    GXSplashModel *splashModel  = [self.class loadSplashCacheData];
    UIImage *splashImage = [XHWebImageDownloader xh_getCacheImageWithURL:[NSURL URLWithString:splashModel.imageUrl]];
    if (splashModel && splashImage) {
        //1.初始化启动页广告(初始化后,自动添加至视图,不用手动添加)
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        GXLaunchAdView *launchAdView = [[GXLaunchAdView alloc] initWithFrame:CGRectMake(0, 0,keyWindow.bounds.size.width, keyWindow.bounds.size.height) andDuration:splashModel.showTime];
        
        //2.设置启动页广告图片的url(必须)
        NSString *imgUrlString = splashModel.imageUrl;
        
        [launchAdView imgUrlString:imgUrlString options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
            //异步加载图片完成回调(若需根据图片实际尺寸,刷新广告frame,可在这里操作)
            //launchAd.adFrame = ...;
        }];
        
        //是否影藏'倒计时/跳过'按钮[默认显示](可选)
        launchAdView.hideSkip = NO;
        
        //广告点击事件(可选)
        launchAdView.clickBlock = ^()
        {
            NSString *url = @"https://www.baidu.com";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        };
    }
    
    [[self class] requestDataAndWriteCache];
}



+ (void)requestDataAndWriteCache
{
    NSDictionary *dic = [NSDictionary dictionary];
    NSMutableArray *splashArray = [dic objectForKey:@"result"];
    splashArray = [NSMutableArray array];
    
    GXSplashModel *model = [[GXSplashModel alloc] init];
    model.splashid = @"11";
    model.startTime = [[NSDate date] timeIntervalSince1970]-100000;
    model.endTime = [[NSDate date] timeIntervalSince1970]+100000;
    //    model.startTime = 0;
    //    model.endTime = 0;
    model.showTime = 5;
    model.imageUrl =  @"http://img.taopic.com/uploads/allimg/120906/219077-120Z616330677.jpg";
    model.openUrl = model.imageUrl;
    model.openType = 1;
    
    [splashArray addObject:model];
    [splashArray addObject:model];
    
//    return;
//    NSArray *jsonArray = [GXSplashModel modelsOfJSONArray:splashArray];
//    
//    
//    [[NSUserDefaults standardUserDefaults]setObject:jsonArray forKey:@"splashArray"];
//    
//    for (GXSplashModel *splashModel in splashArray) {
//        [XHWebImageDownloader xh_downLoadImage_asyncWithURL:[NSURL URLWithString:splashModel.imageUrl] options:XHWebImageDefault completed:nil];
//    }
    
}

+ (GXSplashModel *)loadSplashCacheData
{
    NSArray *splashArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"splashArray"];
    
    if (splashArray) {
        splashArray = [GXSplashModel modelsOfJSONArray:splashArray];
    }
    
    NSTimeInterval nowInterval = [[NSDate date] timeIntervalSince1970];
    
    for (GXSplashModel *splashModel in splashArray) {
        if (splashModel.startTime <=nowInterval && nowInterval <= splashModel.endTime) {
            return splashModel;
        }
    }
    return nil;
}

@end
