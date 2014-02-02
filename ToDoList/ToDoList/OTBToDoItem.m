//
//  OTBToDoItem.m
//  ToDoList
//
//  Created by David on 01/02/2014.
//  Copyright (c) 2014 David. All rights reserved.
//

#import "OTBToDoItem.h"

@implementation OTBToDoItem

@synthesize itemName;
@synthesize itemDetails;
@synthesize completed;
@synthesize creationDate; 


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeBool:completed forKey:@"completed"];
    [coder encodeObject:itemName    forKey:@"itemName"];
    [coder encodeObject:itemDetails    forKey:@"itemDetails"];
    [coder encodeObject:creationDate forKey:@"creationDate"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.completed = [coder decodeBoolForKey:@"completed"];
    self.itemName    = [coder decodeObjectForKey:@"itemName"];
    self.itemDetails    = [coder decodeObjectForKey:@"itemDetails"];
    self.creationDate = [coder decodeObjectForKey:@"creationDate"];
    return self;
}



@end


