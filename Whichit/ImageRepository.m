
#import "ImageRepository.h"

#import "DataFactory.h"

@interface ImageRepository()
@property (nonatomic, strong)JSONReader* reader;
@end

@implementation ImageRepository


- (id)initWithReader:(JSONReader*)reader
{
    self = [super init];
    if(self)
    {
        self.reader = reader;
    }
    
    return self;
}

-(NSArray*)getAllByTag:(NSString*)tag
{
    NSArray* data = [self.reader read];
    
    DataFactory* factory = [[DataFactory alloc] initWithJson:data];
    NSArray* images = [factory createImages];
    
    return  images;
}

@end
