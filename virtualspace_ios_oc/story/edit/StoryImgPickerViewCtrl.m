//
//  StoryImgPickerViewCtrl.m
//  virtualspace_ios_oc
//
//  Created by koujp on 15/8/16.
//  Copyright (c) 2015年 com.here.virtualspace. All rights reserved.
//

#import "StoryImgPickerViewCtrl.h"
#import "StoryDao.h"
#import "ImageTransController.h"
@interface StoryImgPickerViewCtrl ()

@end

@implementation StoryImgPickerViewCtrl{
}

+ (StoryImgPickerViewCtrl *) initWithDefault{
    StoryImgPickerViewCtrl *viewCtrl = [[super alloc] init];
    viewCtrl.delegate=viewCtrl;
    
    if ([StoryImgPickerViewCtrl isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        viewCtrl.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        viewCtrl.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:viewCtrl.sourceType];
    }
    
    return viewCtrl;
}
- (void)show :(UIViewController *) parent{
    [self showImageTransformView];
    //[parent presentViewController:self animated:YES completion:^{}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
}
- (void)showImageTransformView {
    ImageTransController *viewController=[[ImageTransController alloc] initWithNibName:@"ImageTransController" bundle:nil];
    
    UIViewController *rootViewCtrl=[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    [rootViewCtrl presentViewController:viewController animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:^{
       
    }];
//    UIImage *uiImage=[info objectForKey:UIImagePickerControllerOriginalImage];
//    NSData *imgData=UIImagePNGRepresentation(uiImage);
//    
//    StoryDao *dao=[StoryDao sharedStoryDao];
//    NSString *imageId=[dao saveStoryImageData:imgData];
//    NSString *script=[NSString stringWithFormat:@"HJsApp.callListener('insertImage','%@')",imageId];
//    [self.webview executeScript:script];
    
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
