//
//  ERGGameOverScene.m
//  Endless Runner
//
//  Created by Dmitry Volevodz on 03.11.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import "ERGGameOverScene.h"
#import "ERGMyScene.h"

@implementation ERGGameOverScene
- (instancetype) initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        SKLabelNode *node = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
        node.text = @"Game over";
        node.position = CGPointMake(self.size.width / 2, self.size.height / 2);
        node.fontSize = 35;
        node.color = [UIColor whiteColor];
        [self addChild:node];
    }
    return self;
}

- (void) didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newGame)];
    [view addGestureRecognizer:tapper];
}

- (void) newGame
{
    ERGMyScene *newScene = [[ERGMyScene alloc] initWithSize:self.size];
    SKTransition *transition = [SKTransition flipHorizontalWithDuration:0.5];
    [self.view presentScene:newScene transition:transition];
}


@end
