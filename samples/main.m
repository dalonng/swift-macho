#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}


// implementation the class have three properties Int String and Bool
@interface Person : NSObject
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isMale;
@end

@implementation Person

- (void)printInfo {
    NSLog(@"age = %d, name = %@, isMale = %d", self.age, self.name, self.isMale);
}

@end
