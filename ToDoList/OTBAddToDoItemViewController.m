//
//  OTBAddToDoItemViewController.m
//  ToDoList
//
//  Created by David on 01/02/2014.
//  Copyright (c) 2014 David. All rights reserved.
//

#import "OTBAddToDoItemViewController.h"
#import "OTBToDoItem.h"
#import "OTBAppDelegate.h"

@interface OTBAddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textDetails;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation OTBAddToDoItemViewController


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
        self.toDoItem = [[OTBToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.itemDetails = self.textDetails.text;
        self.toDoItem.completed = NO;
        self.toDoItem.creationDate = [[NSDate alloc] init];
        
        OTBAppDelegate *appDelegate = (OTBAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate saveData];
        
    }

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
