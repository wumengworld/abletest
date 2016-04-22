//
//  AppDelegate.m
//  ABLabel
//
//  Created by 王朝阳 on 16/4/21.
//  Copyright © 2016年 Risun. All rights reserved.
//

#import "AppDelegate.h"
#import "ABLabel.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ABLabel *label = [[ABLabel alloc] initWithFrame:CGRectMake(100, 240, 180, 20)];
    label.text = @"自定义label";
    label.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    [self.window.contentView addSubview:label];
    
    ABLabel *label1 = [[ABLabel alloc] initWithFrame:CGRectMake(100, 200, 180, 20)];
    label1.text = @"自定义label";
    label1.fontSize = 13.0f;
    label1.alignmentStyle = ABAlignmentStyleCenter;
    [self.window.contentView addSubview:label1];
    
    ABLabel *label2 = [[ABLabel alloc] initWithFrame:CGRectMake(100, 160, 180, 20)];
    label2.text = @"自定义label";
    label2.fontSize = 13.0f;
    [label2 setTextColor:[NSColor redColor] withRange:NSMakeRange(0, 2)];
    [label2 setTextColor:[NSColor greenColor] withRange:NSMakeRange(2, 1)];
    label2.alignmentStyle = ABAlignmentStyleCenter;
    [self.window.contentView addSubview:label2];
    
    ABLabel *label3 = [[ABLabel alloc] initWithFrame:CGRectMake(100, 120, 180, 20)];
    label3.text = @"自定义label";
    label3.fontSize = 13.0f;
    [label3 setTextColor:[NSColor redColor] withRange:NSMakeRange(0, 2)];
    [label3 setTextColor:[NSColor greenColor] withRange:NSMakeRange(2, 1)];
    label3.alignmentStyle = ABAlignmentStyleCenter;
    label3.definitionValue = 1.0f;
    [self.window.contentView addSubview:label3];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
