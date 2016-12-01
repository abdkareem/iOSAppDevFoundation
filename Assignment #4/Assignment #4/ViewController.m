//
//  ViewController.m
//  Assignment #4
//
//  Created by Abdul kareem Khaja mohammed on 11/5/15.
//  Copyright © 2015 Hello World Corporation. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest * req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UISegmentedControl *converter;

@property (weak, nonatomic) IBOutlet UITextField *firstLocation;
@property (weak, nonatomic) IBOutlet UILabel *firstDistance;

@property (weak, nonatomic) IBOutlet UITextField *secondLocation;
@property (weak, nonatomic) IBOutlet UILabel *secondDistance;

@property (weak, nonatomic) IBOutlet UITextField *thirdLocation;
@property (weak, nonatomic) IBOutlet UILabel *thirdDistance;

@property (weak, nonatomic) IBOutlet UITextField *fourthLocation;
@property (weak, nonatomic) IBOutlet UILabel *fourthDistance;


@property (weak, nonatomic) IBOutlet UIButton *updateDistance;


//@property (weak, nonatomic) IBOutlet UILabel *testLabel;

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
- (IBAction)updateButtonClicked:(id)sender {
    self.updateDistance.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    
    NSString * start = self.startLocation.text;
    NSString * locationFirst = self.firstLocation.text;
    NSString * locationSecond = self.secondLocation.text;
    NSString * locationThird = self.thirdLocation.text;
    NSString * locationFourth = self.fourthLocation.text;
    
    NSArray * locations = [NSArray arrayWithObjects:locationFirst,locationSecond,locationThird,locationFourth, nil];
   NSInteger * selection = self.converter.selectedSegmentIndex;
    
    self.req = [self.req initWithLocationDescriptions:locations sourceDescription:start];
    
    __weak ViewController * weakSelf = self;
    
    self.req.callback = ^void(NSArray * responses) {
        ViewController * strongSelf = weakSelf;
        if (!strongSelf) return;
        NSNull * badresult= [NSNull null];
        
        if(responses[0] != badresult) {
            if (selection == 0) {
                double num = ([responses[0] floatValue]/1.0);
                NSString * x = [NSString stringWithFormat:@"%.2f mts",num];
                strongSelf.firstDistance.text = x;
            }
            else if (selection == 1) {
                double num = ([responses[0] floatValue]/1000.0);
                NSString * x = [NSString stringWithFormat:@"%.2f kms",num];
                strongSelf.firstDistance.text = x;
            }
            else  {
                double num = ([responses[0] floatValue]*0.00062137);
                NSString * x = [NSString stringWithFormat:@"%.2f mi",num];
                strongSelf.firstDistance.text = x;
            }
        }
        else {
            strongSelf.firstDistance.text = @"Error";
        }
        
        if(responses[1] != badresult){
            if (selection == 0) {
                double numb = ([responses[1] floatValue]/1.0);
                NSString * y = [NSString stringWithFormat:@"%.2f mts",numb];
                strongSelf.secondDistance.text = y;
            }
            else if (selection == 1) {
                double numb = ([responses[1] floatValue]/1000.0);
                NSString * y = [NSString stringWithFormat:@"%.2f kms",numb];
                strongSelf.secondDistance.text = y;
            }
            else  {
                double numb = ([responses[1] floatValue]*0.00062137);
                NSString * y = [NSString stringWithFormat:@"%.2f mi",numb];
                strongSelf.secondDistance.text = y;
            }
        }
        else {
            strongSelf.secondDistance.text = @"Error";
        }
        
        if(responses[2] != badresult){
            if (selection == 0) {
                double numbe = ([responses[2] floatValue]/1.0);
                NSString * z = [NSString stringWithFormat:@"%.2f mts",numbe];
                strongSelf.thirdDistance.text = z;
            }
            else if (selection == 1) {
                double numbe = ([responses[2] floatValue]/1000.0);
                NSString * z = [NSString stringWithFormat:@"%.2f kms",numbe];
                strongSelf.thirdDistance.text = z;
            }
            else  {
                double numbe = ([responses[2] floatValue]*0.00062137);
                NSString * z = [NSString stringWithFormat:@"%.2f mi",numbe];
                strongSelf.thirdDistance.text = z;
            }
        }
        else {
            strongSelf.thirdDistance.text = @"Error";
        }
        
        if(responses[3] != badresult){
            if (selection == 0) {
                double number = ([responses[3] floatValue]/1.0);
                NSString * h = [NSString stringWithFormat:@"%.2f mts",number];
                strongSelf.fourthDistance.text = h;
            }
            else if (selection == 1) {
                double number = ([responses[3] floatValue]/1000.0);
                NSString * h = [NSString stringWithFormat:@"%.2f kms",number];
                strongSelf.fourthDistance.text = h;
            }
            else  {
                double number = ([responses[3] floatValue]*0.00062137);
                NSString * h = [NSString stringWithFormat:@"%.2f mi",number];
                strongSelf.fourthDistance.text = h;
            }
        }
        else {
            strongSelf.fourthDistance.text = @"Error";
        }

            strongSelf.req = nil;
        strongSelf.updateDistance.enabled = YES;
    };
    [self.req start];
    
   
    
    /*self.updateDistance.enabled = FALSE;
    NSString * text1 = @"button clicked";
    self.testLabel.text = text1;
    NSArray * destinationLabels = [NSArray arrayWithObjects:@"FIRST",@"SECOND",@"THIRD", nil];
    for (id object in destinationLabels) {
        self.firstLocation.text = [destinationLabels objectAtIndex:0];
        self.secondLocation.text = [destinationLabels objectAtIndex:1];
        self.thirdLocation.text = [destinationLabels objectAtIndex:2];
    }
    self.updateDistance.enabled = TRUE; */
    
}

@end
