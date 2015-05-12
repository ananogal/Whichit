//
//  User.m
//  Whichit
//
//  Created by Ana Nogal on 11/05/2015.
//  Copyright (c) 2015 Ana Nogal. All rights reserved.
//

#import "User.h"

@interface User()

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* fullname;
@property (nonatomic, copy) NSString* profile_picture;

@end

@implementation User

- (id)initWithDictionary:(NSDictionary*)dict
{
    if([super init])
    {
        
    }
    
    return  self;
}
@end
