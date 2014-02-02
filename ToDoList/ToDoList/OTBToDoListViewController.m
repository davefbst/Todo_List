//
//  OTBToDoListViewController.m
//  ToDoList
//
//  Created by David on 01/02/2014.
//  Copyright (c) 2014 David. All rights reserved.
//


#import "OTBAppDelegate.h"
#import "OTBToDoListViewController.h"
#import "OTBToDoItem.h"
#import "OTBAddToDoItemViewController.h"


@interface OTBToDoListViewController ()
@property NSMutableArray *toDoItems;
@end

@implementation OTBToDoListViewController



// todo read from persist data ( which we can later synch)
-(void)loadInitialData{
// so... i'veload an immutable, can't change, i need to copy then don't i...

    OTBAppDelegate *appDelegate = (OTBAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.toDoItems = [appDelegate gamez];
    
//    OTBToDoItem *item1 = [[OTBToDoItem alloc]init];
//    item1.itemName =@"buymilk";
//    [self.toDoItems addObject:item1];
//    OTBToDoItem *item2 = [[OTBToDoItem alloc]init];
//    item2.itemName =@"buymilk";
//    [self.toDoItems addObject:item2];
//    OTBToDoItem *item3 = [[OTBToDoItem alloc]init];
//    item3.itemName =@"buymilk";
//    [self.toDoItems addObject:item3];
//    OTBToDoItem *item4 = [[OTBToDoItem alloc]init];
//    item4.itemName =@"buymilk";
//    [self.toDoItems addObject:item4];

}

// todo update persist data. hmm will need to init extra info as well as name
- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    OTBAddToDoItemViewController *source = [segue sourceViewController];
    OTBToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.toDoItems = [[NSMutableArray alloc] init];
    
    [self loadInitialData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    OTBToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark; //UITableViewCellAccessoryDetailDisclosureButton;//
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];

    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    OTBToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


@end
