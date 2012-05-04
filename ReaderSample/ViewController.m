//
//  ViewController.m
//  ReaderSample
//
//  Created by Will Chilcutt on 5/4/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize resultImage;
@synthesize resultText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setResultImage:nil];
    [self setResultText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)scanButtonTapped 
{
    // ADD: present a barcode reader that scans from the camera feed
    reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    //TODO: (optional) addional reader configuration here
    
    //EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    
    [self presentModalViewController:reader animated:YES];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    
    for(symbol in results)
        //EXAMPLE: just grab the first barcode
        break;
    
    //EXAMPLE: do something useful with the barcode data
    
    resultText.text = symbol.data;
    
    //EXAMPLE: do something useful with the barcode image
    resultImage.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    //ADD: dismiss the controller (NB dismiss from the *reader*!)
    
    [reader dismissModalViewControllerAnimated:YES];
}



@end
