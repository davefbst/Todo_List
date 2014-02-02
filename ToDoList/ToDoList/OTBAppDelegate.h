//
//  OTBAppDelegate.h
//  ToDoList
//
//  Created by David on 01/02/2014.
//  Copyright (c) 2014 David. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OTBAppDelegate : UIResponder <UIApplicationDelegate> {

    NSMutableArray *gamez;
   
}

-(void) saveData;
-(void) loadData;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *gamez;

@end
