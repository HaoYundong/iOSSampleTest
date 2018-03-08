//
//  LMJScrollTextView2.h
//  HelloIOS
//
//  Created by haoyundong on 2018/3/8.
//  Copyright © 2018年 芝麻连接科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LMJScrollTextView2;

@protocol LMJScrollTextView2Delegate <NSObject>

@optional
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index;
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content;

@end

@interface LMJScrollTextView2 : UIView

@property (nonatomic,assign) id <LMJScrollTextView2Delegate>delegate;

/* textDataArr 支持 NSString 和 NSAttributedString 类型 */
@property (nonatomic,copy)   NSArray * textDataArr;


@property (nonatomic,copy)   UIFont  * textFont;
@property (nonatomic,copy)   UIColor * textColor;
@property (nonatomic)        NSTextAlignment textAlignment;

@property (nonatomic,assign) BOOL touchEnable; // defualt is YES

- (void)startScrollBottomToTopWithSpace;
- (void)startScrollTopToBottomWithSpace;

- (void)startScrollBottomToTopWithNoSpace;
- (void)startScrollTopToBottomWithNoSpace;

- (void)stop;
- (void)stopToEmpty;

@end
