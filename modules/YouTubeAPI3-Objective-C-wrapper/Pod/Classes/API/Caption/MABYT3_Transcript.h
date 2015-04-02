//
// Created by djzhang on 12/14/14.
// Copyright (c) 2014 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MABYT3_Transcript : NSObject

@property (strong, nonatomic) NSString *kind;

@property (strong, nonatomic) NSString *identifier;


@property (nonatomic, strong) NSMutableArray *textList;

- (id)initFromDictionary:(NSDictionary *)dict;
@end