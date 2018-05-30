//
//  BDTextView.m
//  suishenbaodian
//
//  Created by fengqingsong on 2018/5/28.
//  Copyright © 2018年 MY. All rights reserved.
//

#import "BDTextView.h"

@interface BDTextView()
@property (nonatomic, strong) UILabel *placeHolderLb;
@end

@implementation BDTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UILabel *)placeHolderLb {
    if (_placeHolderLb == nil) {
        _placeHolderLb = [[UILabel alloc] init];
        if (!self.placeholderColor) {
            self.placeholderColor = [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1];
        }
        if (!self.placeholderFont) {
            self.placeholderFont = [UIFont systemFontOfSize:16];
        }
        _placeHolderLb.textColor = self.placeholderColor;
        _placeHolderLb.font = self.placeholderFont;
        [self addSubview:_placeHolderLb];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChangeFunction) name:UITextViewTextDidChangeNotification object:self];
    }
    return _placeHolderLb;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeHolderLb.text = placeholder;
    [self updatePlaceholder];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeHolderLb.textColor = placeholderColor;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    self.placeHolderLb.font = placeholderFont;
}

- (void)textChangeFunction {
    [self updatePlaceholder];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self updatePlaceholder];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self updatePlaceholder];
}

- (void)updatePlaceholder {
    if (self.text.length > 0) {
        self.placeHolderLb.hidden = YES;
    } else {
        self.placeHolderLb.hidden = NO;
        
        CGFloat maxW = CGRectGetWidth(self.frame) - self.textContainer.lineFragmentPadding * 2;
        CGFloat maxH = CGRectGetHeight(self.frame) - self.textContainerInset.top - self.textContainerInset.bottom;
        CGSize placeS = [self.placeholder boundingRectWithSize:CGSizeMake(maxW, maxH) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
        self.placeHolderLb.frame = CGRectMake(self.textContainer.lineFragmentPadding, self.textContainerInset.top, placeS.width, placeS.height);
    }
}

@end
