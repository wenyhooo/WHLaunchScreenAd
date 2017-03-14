//
//  GXSplashModel.h
//  XHLaunchAdExample
//
//  Created by liwenhao on 16/7/20.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXSplashModel :NSObject 

@property (nonatomic, strong) NSString *splashid;
@property (nonatomic, assign) double startTime;
@property (nonatomic, assign) double endTime;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) NSInteger showTime;
@property (nonatomic, strong) NSString *openUrl;
@property (nonatomic, assign) NSInteger openType;

+ (NSArray *)modelsOfJSONArray:(NSArray *)jsonArray;

@end
