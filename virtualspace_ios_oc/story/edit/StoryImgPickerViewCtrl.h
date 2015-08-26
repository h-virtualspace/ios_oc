//
//  StoryImgPickerViewCtrl.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/16.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebView.h"
@interface StoryImgPickerViewCtrl : UIImagePickerController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(weak) WebView *webview;
+ (StoryImgPickerViewCtrl *) initWithDefault;
- (void)show :(UIViewController *) parent;
@end
