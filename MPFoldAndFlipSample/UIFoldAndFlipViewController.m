//
//  UIFoldAndFlipViewController.m
//  MPFoldAndFlipSample
//
//  Created by hirakawa on 2013/04/22.
//  Copyright (c) 2013年 yhirakawa. All rights reserved.
//

#import "UIFoldAndFlipViewController.h"
#import "MPFoldTransition.h"
#import "MPFlipTransition.h"

@implementation UIFoldAndFlipViewController
@synthesize contentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _current_image_number = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self touchFold:nil];
}

// 次に表示するViewを返します。
- (UIView *) getNextView
{
    UIImage *image = [UIImage imageNamed:
                      [NSString stringWithFormat:@"sample%d.png", _current_image_number]];
    _current_image_number  = _current_image_number == 1 ? 2 : 1;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return (UIView*)imageView;
}

// Foldボタンタッチイベント
- (IBAction)touchFold:(id)sender
{
    // アニメーション前のViewとアニメーション後のViewを指定し、アニメーションを行う
    UIView *previousView = [[[self contentView] subviews] objectAtIndex:0];
    UIView *nextView     = [self getNextView];
    [MPFoldTransition transitionFromView : previousView
                      toView             : nextView
                      duration           : [MPFoldTransition defaultDuration]
                      style              : MPFoldStyleDefault
                      transitionAction   : MPTransitionActionAddRemove
                      completion         : ^(BOOL finished) {
                          // アニメーションが終了した際の処理を記述
                      }
     ];
}

// Flipボタンタッチイベント
- (IBAction)touchFlip:(id)sender
{
    // アニメーション前のViewとアニメーション後のViewを指定し、アニメーションを行う
    UIView *previousView = [[self.contentView subviews] objectAtIndex:0];
    UIView *nextView     = [self getNextView];
    [MPFlipTransition transitionFromView : previousView
                      toView             : nextView
                      duration           : [MPFlipTransition defaultDuration]
                      style              : MPFlipStyleDefault
                      transitionAction   : MPTransitionActionAddRemove
                      completion         : ^(BOOL finished) {
                          // アニメーションが終了した際の処理を記述
                      }
     ];
}

@end
