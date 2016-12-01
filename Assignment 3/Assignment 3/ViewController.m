//
//  ViewController.m
//  Assignment 3
//
//  Created by Abdul kareem Khaja mohammed on 10/29/15.
//  Copyright © 2015 Hello World Corporation. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)convertCurrency:(id)sender {
    self.updateButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc]init];
    self.req.delegate = self;
    [self.req start];
    //NSLog(@"%.2f",inputValue);
   
}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    self.updateButton.enabled = YES;
    double inputValue = [self.inputField.text doubleValue];
    if (self.segmentController.selectedSegmentIndex ==0) {
        double inr = inputValue *currencies.INR;
        NSString * temp = [NSString stringWithFormat:@"%.2f",inr];
        self.outputLabel.text = temp;
        //self.cur1.text = temp;
        //NSLog(@"Selected 1");
        //self.outputLabel.text = @"INR";
    }
    else if (self.segmentController.selectedSegmentIndex == 1) {
        //
        double chf = inputValue *currencies.CHF;
        NSString * temp = [NSString stringWithFormat:@"%.2f",chf];
        //NSLog(@"%.2f",chf);
        self.outputLabel.text = temp;
    }
    else {
        //NSLog(@"Selected 3");
        double mxn = inputValue *currencies.MXN;
        NSString * temp = [NSString stringWithFormat:@"%.2f",mxn];
        self.outputLabel.text = temp;
    }
}


@end
