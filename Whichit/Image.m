//
//  Images.m
//  Whichit
//
//  Created by Ana Nogal on 11/05/2015.
//  Copyright (c) 2015 Ana Nogal. All rights reserved.
//

#import "Image.h"
#import "Caption.h"
#import "Comment.h"
#import "User.h"

@interface Image()
@property (nonatomic, copy) NSString* filter;
@property (nonatomic, strong) NSArray* users_in_photo;
@property (nonatomic, strong)NSMutableArray* tags;
@property (nonatomic, strong)NSMutableArray* comments;
@property (nonatomic, strong)Caption* caption;
@property (nonatomic, strong)NSMutableArray* likes;
@property (nonatomic, copy) NSString* link;
@property (nonatomic, copy) User* user;

@end

@implementation Image
-(id)initWithDictionary:(NSDictionary*)data
{
    if([super init])
    {
        self.users_in_photo = [NSArray array];
        self.tags = [NSMutableArray array];
        self.comments = [NSMutableArray array];
        [self createImageStructure: data];
    }
    return self;
}

- (void)createImageStructure:(NSDictionary*)data
{
    NSDictionary* commentsDict = data[@"comments"];
    NSArray* comments = commentsDict[@"data"];
    for(int i = 0; i < [comments count]; i++)
    {
        Comment* comment = [[Comment alloc]initWithDictionary:comments[i]];
        [self.comments addObject:comment];
    }
}

@end



//{
//    "type": "image",
//    "users_in_photo": [],
//    "filter": "Earlybird",
//    "tags": ["snow"],
//    
//    
//    "likes": {
//        "count": 1,
//        "data": [{
//            "username": "mikeyk",
//            "full_name": "Mike Krieger",
//            "id": "4",
//            "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg"
//        }]
//    },
//    "link": "http://instagr.am/p/BWl6P/",
//    "user": {
//        "username": "emohatch",
//        "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg",
//        "id": "1242695",
//        "full_name": "Dave"
//    },
//    "created_time": "1296703536",
//    "images": {
//        "low_resolution": {
//            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_6.jpg",
//            "width": 306,
//            "height": 306
//        },
//        "thumbnail": {
//            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_5.jpg",
//            "width": 150,
//            "height": 150
//        },
//        "standard_resolution": {
//            "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/f9443f3443484c40b4792fa7c76214d5_7.jpg",
//            "width": 612,
//            "height": 612
//        }
//    },
//    "id": "22699663",
//    "location": null
//},