//
//  ViewController.m
//  تعطیلی مدارس
//
//  Created by Amir Farsad on 1/27/15.
//  Copyright (c) 2015 Amyr Farsad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(IBAction)refresh:(id)sender{
    [self load];
}
-(void)load{
    //فایل جی سان رو در تابه ی NSData لود میکنیم
    //دقت کنید این فایل JSON  داخل سورس کد همین پروژه قرار گرفته است!

    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:
                        [NSURL URLWithString:@"http://khodkaar.ir/Server.json"]];
    NSError *error;
    NSMutableDictionary *jsonDatas = [NSJSONSerialization
                                      JSONObjectWithData:jsonData
                                      options:NSJSONReadingMutableContainers
                                      error:&error];
    //اگر اروری وجود داشت ارور رو به ما میگه و ما بررسی میکنیم! و در غیر این صورت فایل JSON رو مورد پردازش و نمایش در لیبل قرار میدیم!
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        NSArray *status = jsonDatas[@"status"];
        for ( NSDictionary *jsonData in status )
        {
            lbl1.text = (@"%@", jsonData[@"yesorno"]);
            lbl2.text = (@"%@", jsonData[@"payehaa"]);
            lbl3.text = (@"%@", jsonData[@"manategh"]);
        }
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self load];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
