
#import <Foundation/Foundation.h>
#import "JSONReader.h"

@interface ImageRepository : NSObject

- (id)initWithReader:(JSONReader*)reader;
- (NSArray*)getAllByTag:(NSString*)tag;

@end
