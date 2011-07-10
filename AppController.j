/*
 * AppController.j
 * NewApplication
 *
 * Created by You on February 22, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPWindowController.j>
@import <AppKit/CPPanel.j>
@import <AppKit/CPProgressIndicator.j>
@import <AppKit/CPView.j>
@import <AppKit/CPButtonBar.j>
@import <AppKit/CPButton.j>
@import "PageView.j"

@implementation AppController : CPObject
{
    var pageView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    [contentView setBackgroundColor: [CPColor grayColor]];

    [theWindow orderFront:self];

    // Create a panel

    screenCenterX = CGRectGetWidth([contentView bounds]) / 2.0;
    screenCenterY = CGRectGetHeight([contentView bounds]) / 2.0;

    var HUDPanel = [[CPPanel alloc] 
        initWithContentRect:CGRectMake(screenCenterX-300, screenCenterY-200, 600, 400)
        styleMask:CPHUDBackgroundWindowMask];

    [HUDPanel setTitle:"Form"];
    [HUDPanel orderFront:self];

    // Create a progress bar

    var panelContentView = [HUDPanel contentView];
    panelWidth = CGRectGetWidth([panelContentView bounds]);
    panelHeight = CGRectGetHeight([panelContentView bounds]);

    progressBar = [[CPProgressIndicator alloc] initWithFrame:CGRectMake(0,panelHeight-16, panelWidth,16)];

    [progressBar setMinValue:0];
    [progressBar setMaxValue:100];
    [progressBar incrementBy:0];
    [panelContentView addSubview:progressBar];

    // Create a button
    
    button = [[CPButton alloc] initWithFrame:CGRectMake(0,panelHeight-40, panelWidth,24)];
    [button setTitle:"Continue"];
    
    [button setTarget:self];
    [button setAction:@selector(processClick:)];
    [panelContentView addSubview:button];

    // Create a PageView
        
    pageView = [[PageView alloc] initWithFrame:CGRectMake(0,0, panelWidth,panelHeight-40)];
    [panelContentView addSubview:pageView];
  
}

- (void)processClick:(id)aSender
{
    [progressBar incrementBy: 33.333];
    [pageView nextLayer];

    if ( [progressBar maxValue] - [progressBar doubleValue] < .1 ) 
        [button setTitle:"Done"];
}


@end
