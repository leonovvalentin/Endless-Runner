//
//  ERGBackground.m
//  Endless Runner
//
//  Created by Valentin Leonov on 25/04/14.
//  Copyright (c) 2014 Valentin Leonov. All rights reserved.
//



#import "ERGBackground.h"



@implementation ERGBackground

+ (ERGBackground *)generateNewBackground
{
    ERGBackground *background = [[ERGBackground alloc] initWithImageNamed:@"background.png"];
    background.anchorPoint = CGPointMake(0, 0);
    background.name = backgroundName;
    background.position = CGPointMake(0, 0);
    return background;
}

@end
