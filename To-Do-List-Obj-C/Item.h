#ifndef Item_h
#define Item_h

@interface Item : NSObject

// properties
@property NSString * name;
@property NSString * topic;

// initializer
    // Example:
    // Item * item = [[Item alloc]init];
    // item.name = @"...";
    // item.topci = @"...";
    // Item * item = [[Item alloc] initWithName = @"" topic: @""];

- (instancetype) iniWithName: (NSString *)name andTopic:(NSString *)topic;

// methods
    // class methods
+ (NSArray *) fetchItems;   // [Item fetchItems];   // returns an array of items



@end
#endif /* Item_h */
