//
//  ABLabel.m
//  ABLabel
//
//  Created by 王朝阳 on 16/4/21.
//  Copyright © 2016年 Risun. All rights reserved.
//

#import "ABLabel.h"

@interface ABLabel()
@property (nonatomic)CATextLayer *textLayer;
@property (nonatomic)NSMutableAttributedString *attributeString;
@end

@implementation ABLabel
-(void)setUp
{
    self.wantsLayer = YES;
    _textLayer = [CATextLayer layer];
    self.alignmentStyle = ABAlignmentStyleLeft;
    self.truncationStyle = ABTruncationStyleEnd;
    self.textColor = [NSColor blackColor];
    self.fontName = [NSFont systemFontOfSize:10.0f].fontName;
    self.fontSize = 8.0f;
    self.definitionValue = 2.0;
    _textLayer.wrapped = YES;
    [self.layer addSublayer:_textLayer];
}
-(instancetype)init
{
    self = [super init];if(!self)return nil;
    [self setUp];
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];if(!self)return nil;
    [self setUp];
    return self;
}
-(instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];if(!self)return nil;
    [self setUp];
    _textLayer.frame = self.bounds;
    if (frameRect.size.height>2)self.fontSize = frameRect.size.height-2;
    else self.fontSize = frameRect.size.height;
    return self;
}
#pragma mark - sets
-(void)setText:(NSString *)text
{
    if (!text) return;
    if (_text && [_text isEqualToString:text]) return;
    _text = text;
    _textLayer.string = text;
}
-(void)setTextColor:(NSColor *)textColor
{
    if (!textColor)return;
    if (_textColor == textColor)return;
    _textColor = textColor;
    _textLayer.foregroundColor = textColor.CGColor;
}
-(void)setFontName:(NSString *)fontName
{
    if (!fontName)return;
    if ([_fontName isEqualToString:fontName])return;
    if (![NSFont fontWithName:fontName size:10.0f]){NSLog(@"字体不存在%@",fontName);return;}
    _fontName = fontName;
    _textLayer.font = (__bridge CFTypeRef)(fontName);
}
-(void)setFontSize:(CGFloat)fontSize
{
    if (!fontSize) return;
    if (_fontSize && _fontSize == fontSize) return;
    _fontSize = fontSize;
    _textLayer.fontSize = fontSize;
}
-(void)setDefinitionValue:(CGFloat)definitionValue
{
    if (_definitionValue == definitionValue) return;
    _definitionValue = definitionValue;
    _textLayer.contentsScale = definitionValue;
}
-(void)setTruncationStyle:(ABTruncationStyle)truncationStyle
{
    if (_truncationStyle && _truncationStyle == truncationStyle)return;
    switch (truncationStyle)
    {
        case ABTruncationStyleNone:
        {
            _truncationStyle = truncationStyle;
            _textLayer.truncationMode = kCATruncationNone;
        }
            break;
        case ABTruncationStyleStart:
        {
            _truncationStyle = truncationStyle;
            _textLayer.truncationMode = kCATruncationStart;
        }
            break;
        case ABTruncationStyleMiddle:
        {
            _truncationStyle = truncationStyle;
            _textLayer.truncationMode = kCATruncationMiddle;
        }
            break;
        case ABTruncationStyleEnd:
        {
            _truncationStyle = truncationStyle;
            _textLayer.truncationMode = kCATruncationEnd;
        }
            break;
        default:
            break;
    }
}
-(void)setAlignmentStyle:(ABAlignmentStyle)alignmentStyle
{
    if (_alignmentStyle && _alignmentStyle == alignmentStyle)return;
    switch (alignmentStyle)
    {
        case ABAlignmentStyleLeft:
        {
            _alignmentStyle = ABAlignmentStyleLeft;
            _textLayer.alignmentMode = kCAAlignmentLeft;
        }
            break;
        case ABAlignmentStyleRight:
        {
            _alignmentStyle = ABAlignmentStyleRight;
            _textLayer.alignmentMode = kCAAlignmentRight;
        }
            break;
        case ABAlignmentStyleCenter:
        {
            _alignmentStyle = ABAlignmentStyleCenter;
            _textLayer.alignmentMode = kCAAlignmentCenter;
        }
            break;
        default:
            break;
    }
}
-(void)setFrame:(NSRect)frame
{
    [super setFrame:frame];
    _textLayer.frame = self.bounds;
}
#pragma mark - public methord
-(NSMutableAttributedString *)attributeString
{
    if (_attributeString)return _attributeString;
    _attributeString = [[NSMutableAttributedString alloc] initWithString:_text];
    //文字颜色
    [_attributeString addAttribute:(NSString *)kCTForegroundColorAttributeName
                             value:(id)_textColor.CGColor
                             range:NSMakeRange(0, _text.length-1)];
    //字体－字体大小
    [_attributeString addAttribute:(NSString *)kCTFontAttributeName
                        value:[NSFont fontWithName:_fontName size:_fontSize]
                        range:NSMakeRange(0, _text.length-1)];
    return _attributeString;
}
-(void)setTextColor:(NSColor *)textColor withRange:(NSRange)range
{
    if (!_text) {NSLog(@"请先设置文字内容！");return;}
    if (range.location+range.length > _text.length) {NSLog(@"设置的区间超出文字区间！");return;}
    [self.attributeString addAttribute:(NSString *)kCTForegroundColorAttributeName
                             value:(id)textColor.CGColor
                             range:range];
    _textLayer.string = _attributeString;
}
@end
