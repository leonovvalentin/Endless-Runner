//
//  ERGBackground.h
//  Endless Runner
//
//  Created by DmitryVolevodz on 26.10.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ERGBackground : SKSpriteNode

+ (ERGBackground *)generateNewBackground;
+ (ERGBackground *)generateNewParallax;

@end
