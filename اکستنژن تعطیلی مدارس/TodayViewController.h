//
//  TodayViewController.h
//  اکستنژن تعطیلی مدارس
//
//  Created by Amir Farsad on 1/27/15.
//  Copyright (c) 2015 Amyr Farsad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController{
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UILabel *lbl3;
}
-(IBAction)refresh:(id)sender;
@end
