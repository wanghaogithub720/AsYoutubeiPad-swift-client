//
// Created by djzhang on 5/1/15.
// Copyright (c) 2015 Nimbus. All rights reserved.
//

#import "MABYT3_Activity_NewestVideoId.h"


@implementation MABYT3_Activity_NewestVideoId {

}


- (id)init {

    self = [super init];
    if (self) {
        _kind = @"youtube#activity";
        _etag = @"";
        _identifier = @"";

        _publishedAt = @"";
        _title = @"";
        _videoId = @"";
        _containUpload = YES;
    }
    return self;
}

- (id)initFromDictionary:(NSDictionary *)dict {

    self = [super init];
    if (self) {
        _kind = @"youtube#activity";
        _etag = @"";
        _identifier = @"";

        _publishedAt = @"";
        _title = @"";
        _videoId = @"";

        _containUpload = YES;

        if ([dict objectForKey:@"kind"]) {
            _kind = [dict objectForKey:@"kind"];
        }
        if ([dict objectForKey:@"etag"]) {
            _etag = [dict objectForKey:@"etag"];
        }
        if ([dict objectForKey:@"id"]) {
            _identifier = [dict objectForKey:@"id"];
        }
        NSDictionary *snippetDict = [dict objectForKey:@"snippet"];
        if (snippetDict) {
            if ([snippetDict objectForKey:@"publishedAt"]) {
                _publishedAt = [snippetDict objectForKey:@"publishedAt"];
            }
            if ([snippetDict objectForKey:@"title"]) {
                _title = [snippetDict objectForKey:@"title"];
            }
        }
        NSDictionary *contentDetailsDict = [dict objectForKey:@"contentDetails"];
        if (contentDetailsDict) {

            NSDictionary *uploadDict = [contentDetailsDict objectForKey:@"upload"];
            if (uploadDict) {
                if ([uploadDict objectForKey:@"videoId"]) {
                    _videoId = [uploadDict objectForKey:@"videoId"];
                }
            }
        }
    }

    if ([_videoId isEqualToString:@""]) {
        _containUpload = NO;
    }
    return self;
}

@end