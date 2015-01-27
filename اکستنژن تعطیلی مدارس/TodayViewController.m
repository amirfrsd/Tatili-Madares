//
//  TodayViewController.m
//  اکستنژن تعطیلی مدارس
//
//  Created by Amir Farsad on 1/27/15.
//  Copyright (c) 2015 Amyr Farsad. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

-(IBAction)refresh:(id)sender{
    [self viewDidLoad];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    //یه فیکس کوچیک برای نمایش دادن کل اجزای Storyboard مون توی اکستنژن :دی
    self.preferredContentSize = CGSizeMake(0, 190);
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

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
