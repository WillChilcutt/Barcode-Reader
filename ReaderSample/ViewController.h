//
//  ViewController.h
//  ReaderSample
//
//  Created by Will Chilcutt on 5/4/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <ZBarReaderDelegate>
{
    UIImageView *resultImage;
    UITextView *resultText;
    ZBarReaderViewController *reader;
}

@property (retain, nonatomic) IBOutlet UIImageView *resultImage;
@property (retain, nonatomic) IBOutlet UITextView *resultText;


- (IBAction)scanButtonTapped;

@end
