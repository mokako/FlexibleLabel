#import <UIKit/UIKit.h>

@interface FlexibleLabel : UILabel

@property (nonatomic)NSString *trigger;
@property (nonatomic)CGFloat radius;
@property (nonatomic)CGFloat minWidth;
@property (nonatomic)CGFloat padding;
-(void)setValue:(NSString *)text;

@end
