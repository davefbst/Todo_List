//
//  OTBToDoItem.h
//  ToDoList
//
//  Created by David on 01/02/2014.
//  Copyright (c) 2014 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTBToDoItem : NSObject <NSCoding>
{
    NSString *itemName;
    BOOL completed;
    NSDate *creationDate;  // changed from read only , we will edit so update when edited.?
}
@property NSString *itemName;
@property (nonatomic) BOOL completed;
@property NSDate *creationDate;  // changed from read only , we will edit so update when edited.?
//@property NSDate *creationDate;

@end
