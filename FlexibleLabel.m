#import "FlexibleLabel.h"

@implementation FlexibleLabel
- (id)init{
    if (self = [super init]) {
        self.radius = 0;
        self.clipsToBounds = YES;
    }
    return self;
}
-(void)setValue:(NSString *)text{
    //情報の優先度はpadding > padding_
    if([self.trigger isEqualToString:text]){
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    
    CGPoint center = self.center;
    
    
    CGSize   maxSize = CGSizeMake(10000,10000);
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.firstLineHeadIndent = 0;
    paragraphStyle.headIndent = 0;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attr = @{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:self.font,NSKernAttributeName:@0.5};
    CGSize modifiedSize = [text boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attr
                                             context:nil
                           ].size;
    self.text = text;
    self.minWidth = self.minWidth == 0 ? modifiedSize.height : self.minWidth;
    CGFloat width = modifiedSize.width > self.minWidth ? modifiedSize.width : self.minWidth;
    self.frame = CGRectMake(0,0,width + (self.padding * 2),modifiedSize.height + (self.padding * 2));
    self.layer.cornerRadius = self.frame.size.height * self.radius;
    self.center = center;
    dispatch_async(dispatch_get_main_queue(),^{
        [self setNeedsDisplay];
    });
}
@end
