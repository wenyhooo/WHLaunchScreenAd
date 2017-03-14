//
//  GXSplashModel.m
//  XHLaunchAdExample
//
//  Created by liwenhao on 16/7/20.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "GXSplashModel.h"

@implementation GXSplashModel


+ (NSArray *)modelsOfJSONArray:(NSArray *)jsonArray
{
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < jsonArray.count ; index ++) {
        NSDictionary *dic = jsonArray[index];
        GXSplashModel *model = [[GXSplashModel alloc] init];
        model.splashid = dic[@"splashid"];
        model.startTime = [dic[@"startTime"] integerValue];
        model.endTime = [dic[@"endTime"] integerValue];
        model.imageUrl = dic[@"imageUrl"];
        model.showTime = [dic[@"showTime"]integerValue];
        model.openUrl = dic[@"openUrl"];
        model.openType = [dic[@"openType"]integerValue];
        [modelArray addObject:model];
    }
    return modelArray;
}

@end
