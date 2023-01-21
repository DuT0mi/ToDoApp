#import <Foundation/Foundation.h>
#import "Item.h"

@implementation Item

- (instancetype) iniWithName: (NSString *)name andTopic:(NSString *)topic{
    if(self == [super init]){
        // initialiue all properties here
        self.name = name;
        self.topic = topic;
    }
    return self;
}
+ (NSArray *)fetchItems{
    return @[
        [[Item alloc]iniWithName:@"First" andTopic:@"FirstTopic"],
        [[Item alloc]iniWithName:@"Second" andTopic:@"SecondTopic"],
        [[Item alloc]iniWithName:@"Third" andTopic:@"ThirdTopic"],
        [[Item alloc]iniWithName:@"Fourth" andTopic:@"FourthTopic"],
        [[Item alloc]iniWithName:@"Fifth" andTopic:@"FifthTopic"]
            ];
}
@end
