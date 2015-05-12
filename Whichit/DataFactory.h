//
//  DataFactory.h
//  Whichit
//
//  Created by Ana Nogal on 11/05/2015.
//  Copyright (c) 2015 Ana Nogal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFactory : NSObject

-(id)initWithJson:(NSArray*)json;
- (NSArray*)createImages;

@end
