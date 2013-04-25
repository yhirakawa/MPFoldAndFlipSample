//
//  UIFoldAndFlipViewController.h
//  MPFoldAndFlipSample
//
//  Created by hirakawa on 2013/04/22.
//  Copyright (c) 2013年 yhirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPFoldEnumerations.h"
#import "MPFlipEnumerations.h"

@interface UIFoldAndFlipViewController : UIViewController
{
    // 現在の画像番号
    int _current_image_number;
}

// アニメーションを行うView
@property (weak, nonatomic) IBOutlet UIView *contentView;

// Foldボタンタッチイベント
- (IBAction)touchFold:(id)sender;
// Flipボタンタッチイベント
- (IBAction)touchFlip:(id)sender;

@end
