//
//  ViewController.m
//  jietu
//
//  Created by mac on 2021/6/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击");
    UIImage * image =     [self creatShareImageWithScrollView];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);

}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
        if (error != NULL){
            NSLog(@"没权限");
        } else {
            NSLog(@"成功");
        }

}
-(UIImage *)creatShareImageWithScrollView{
    UIView * homeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 500, 60)];
    UIImageView * bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 500, 30)];
    bgImage.backgroundColor = [UIColor redColor];
    [homeView addSubview:bgImage];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 , 30, 500, 30)];
    titleLabel.text = @"123456";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor blueColor];
    [homeView addSubview:titleLabel];
    
    
    UIGraphicsBeginImageContextWithOptions(homeView.bounds.size, NO, 0);
    CGRect savedFrame = homeView.frame;
    homeView.frame= CGRectMake(0, 0, homeView.bounds.size.width,homeView.bounds.size.height);
    [homeView.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    homeView.frame= savedFrame;
    UIGraphicsEndImageContext();
    
    if (resultImage != nil)
    {
        
        return resultImage;
    }
    return nil;

}
@end
