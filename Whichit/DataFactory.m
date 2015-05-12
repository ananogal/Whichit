

#import "DataFactory.h"
#import "Image.h"

@interface DataFactory()
@property (nonatomic, strong) NSArray* data;
@end

@implementation DataFactory

-(id)initWithJson:(NSArray*)json
{
    if([super init])
    {
        self.data = json;
    }
    return self;
}

- (NSArray*)createImages
{
    NSMutableArray* images = [NSMutableArray array];
    
    for (int i=0; i< self.data.count; i++)
    {
        NSDictionary* dict = self.data[i];
        NSString* type = dict[@"type"];
        if([type isEqualToString:@"Image"])
        {
            Image* img = [[Image alloc] initWithDictionary:dict];
            [images addObject:img];
        }
    }
    
    return images;
}

@end
