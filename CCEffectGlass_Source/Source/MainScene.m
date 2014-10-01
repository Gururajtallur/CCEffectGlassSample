//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "GTGlassEffects.h"

@implementation MainScene

+(CCScene *) scene
{
    MainScene *layer = [[self alloc] init];
    
    return (CCScene *)layer;
}

-(void)onEnter
{
    [super onEnter];
    
    self.userInteractionEnabled = YES;
    
    [self setupBackground];
}

-(void)setupBackground
{
    CCSprite *bg = [CCSprite spriteWithImageNamed:@"gtBG.png"];
    bg.position  = ccp(SW*0.5f, SH*0.5f);
    [self addChild:bg z:0];
    
    CCSprite *logo = [CCSprite spriteWithImageNamed:@"gtLogo.png"];
    logo.position  = ccp(SW*0.5f, SH*0.85f);
    [self addChild:logo z:1];

    
    [GTGlassEffects showGlassEffectForSprite:logo parent:self];
    
    CCSprite *logo2 = [CCSprite spriteWithImageNamed:@"gtLogo.png"];
    logo2.position  = ccp(SW*0.5f, SH*0.35f);
    [self addChild:logo2 z:1];
    logo2.visible = false;
    
    [GTGlassEffects showGlassEffectForSprite:logo2 parent:self];
    
}




@end
