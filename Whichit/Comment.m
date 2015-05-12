//
//  Comment.m
//  Whichit
//
//  Created by Ana Nogal on 11/05/2015.
//  Copyright (c) 2015 Ana Nogal. All rights reserved.
//

#import "Comment.h"
#import "User.h"


@interface Comment()

@property (nonatomic, assign) NSInteger created_time;
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, copy) NSString* text;
@property (nonatomic, strong) User* user;


@end
@implementation Comment

- (id)initWithDictionary:(NSDictionary*)dict
{
    if([super init])
    {
        
    }
    
    return self;
}

-(void)setup:(NSDictionary*)dict
{
    self.created_time = [dict[@"created_time"] integerValue];
    self.Id = [dict[@"created_time"] integerValue];
    self.text = dict[@"Snow"];
    NSDictionary* from = dict[@"from"];
    self.user = [[User alloc] initWithDictionary:from];
}

//"comments": {
//    "data": [{
//        "created_time": "1296703540",
//        "text": "Snow",
//        "from": {
//            "username": "emohatch",
//            "username": "Dave",
//            "id": "1242695"
//        },
//        "id": "26589964"
//    },
//             {
//                 "created_time": "1296707889",
//                 "text": "#snow",
//                 "from": {
//                     "username": "emohatch",
//                     "username": "Emo Hatch",
//                     "id": "1242695"
//                 },
//                 "id": "26609649"
//             }],
//    "count": 3
//}
@end
