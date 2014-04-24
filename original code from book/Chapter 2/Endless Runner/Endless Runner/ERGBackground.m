//
//  ERGBackground.m
//  Endless Runner
//
//  Created by DmitryVolevodz on 26.10.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import "ERGBackground.h"

@implementation ERGBackground

+ (ERGBackground *)generateNewBackground
{
    ERGBackground *background = [[ERGBackground alloc] initWithImageNamed:@"background.png"];
    background.anchorPoint = CGPointMake(0, 0);
    background.name = backgroundName;
    background.position = CGPointMake(0, 0);
    background.zPosition = 1;
    return background;
}

//
//    
//    background.zPosition = 100;
//    
//    
//    background.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 65) toPoint:CGPointMake(background.size.width, 65)];
//    
//    background.physicsBody.collisionBitMask = 1;
//    
//    SKNode *topCollider = [SKNode node];
//    topCollider.position = CGPointMake(0, 0);
//    topCollider.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, background.size.height - 60) toPoint:CGPointMake(background.size.width, background.size.height - 60)];
//    topCollider.physicsBody.collisionBitMask = 1;
//    [background addChild:topCollider];
//    
//    background.zPosition = 100;
//    
//    
//}


@end
