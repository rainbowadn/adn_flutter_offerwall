//
//  BuzzvilCore.h
//  buzzofferwall-sample
//
//  Created by jeseo on 2017. 6. 22..
//  Copyright © 2017년 Buzzvil. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BUZZVIL_GENDER_MALE @"M"
#define BUZZVIL_GENDER_FEMALE @"F"

@interface BuzzvilCore : NSObject

@property (nonatomic, strong) NSString *SDKBuild;
@property (nonatomic, strong) NSString *SDKVersion;
@property (nonatomic, strong) NSString *PlainSDKVersion;

@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, assign) NSInteger birthYear;
@property (nonatomic, strong) NSString *userId;

+ (BuzzvilCore *)sharedCore;
+ (void)initWithAppKey:(NSString *)appKey;
+ (void)setUserId:(NSString *)userId;
+ (void)setGender:(NSString *)gender;
+ (void)setBirthYear:(NSInteger)birthYear;

@end
