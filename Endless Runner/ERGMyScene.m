//
//  ERGMyScene.m
//  Endless Runner
//
//  Created by Valentin Leonov on 24/04/14.
//  Copyright (c) 2014 Valentin Leonov. All rights reserved.
//



#import "ERGMyScene.h"



@implementation ERGMyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        self.currentBackground = [ERGBackground generateNewBackground];
        [self addChild:self.currentBackground];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
    [self enumerateChildNodesWithName:@"theLabel" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - 2, node.position.y);
        if (node.position.x < - node.frame.size.width) {
            node.position = CGPointMake(self.frame.size.width, node.position.y);
        }
    }];
}

@end
