//
//  BDTextView.h
//  suishenbaodian
//
//  Created by fengqingsong on 2018/5/28.
//  Copyright © 2018年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) UIFont *placeholderFont;
@end
