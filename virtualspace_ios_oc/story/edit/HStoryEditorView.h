//
//  HStoryEditorView.h
//  virtualspace_ios_oc
//
//  Created by koujp on 15/7/29.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HStoryEditorView : UIView<UIWebViewDelegate>
-(void)initView;
-(void)hideKeyboard:(BOOL) hidden;
@end
