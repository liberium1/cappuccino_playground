@import <Foundation/CPObject.j>
@import <AppKit/CPWindowController.j>
@import <AppKit/CPView.j>
@import <AppKit/CALayer.j>

@implementation PageView : CPView
{
    CALayer _rootLayer;
    CALayer layer1;
    CALayer layer2;
    CALayer layer3;    
    CPArray layers;
    int i=0;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    
    if (self)
    {

        layer1 = [CALayer layer];
        [layer1 setBackgroundColor:[CPColor blackColor]];

        layer2 = [CALayer layer];
        [layer2 setBackgroundColor:[CPColor grayColor]];

        layer3 = [CALayer layer];
        [layer3 setBackgroundColor:[CPColor whiteColor]];

        layers = [CPArray  arrayWithObjects:layer1,layer2,layer3];
        
        _rootLayer = [layers objectAtIndex:0];
        [self setWantsLayer:YES];
        [self setLayer:_rootLayer];
        [_rootLayer setNeedsDisplay];

    }

    return self;
}

- (id)nextLayer
{
    var index = [layers indexOfObject:_rootLayer];
    if ( index < [layers count]-1 ) {
        _rootLayer = [layers objectAtIndex:index+1];
        [self setLayer:_rootLayer];
    }
}
@end
