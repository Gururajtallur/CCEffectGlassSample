//
//  GTGlassEffects.mm
//  Test
//
//  Created by Gururaj T on 01/10/14.
 

#import "GTGlassEffects.h"

@implementation GTGlassEffects

+(void)showGlassEffectForSprite:(CCSprite*)effectBG parent:(CCNode*)inParent
{
    CCSpriteFrame *normalMap = [CCSpriteFrame frameWithImageNamed:@"gtEffectsImage.png"];
    CCSprite *reflectEnvironment = [CCSprite spriteWithImageNamed:@"gtEffectsGlass.jpg"];
    reflectEnvironment.positionType = CCPositionTypeNormalized;
    reflectEnvironment.position = ccp(0.5f, 0.5f);
    reflectEnvironment.visible = NO;
    
    [inParent addChild:reflectEnvironment];
    
    CCEffectGlass *glass = [[CCEffectGlass alloc] initWithShininess:1.0f refraction:1.0f refractionEnvironment:effectBG reflectionEnvironment:reflectEnvironment];
    glass.fresnelBias = 0.1f;
    glass.fresnelPower = 2.0f;
    glass.refraction = 0.75f;
    
    
    CCSprite *sprite1 = [[CCSprite alloc] init];
    sprite1.position = ccp(SW*0.1f, effectBG.position.y);
    sprite1.normalMapSpriteFrame = normalMap;
    sprite1.effect = glass;
    sprite1.scale = 0.8f;
    sprite1.colorRGBA = [CCColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
    
    float duration =  4.0f ;
    
    [sprite1 runAction:[CCActionRepeatForever actionWithAction:[CCActionSequence actions:
                                                                [CCActionMoveTo actionWithDuration:duration position:ccp(SW*1.4f, effectBG.position.y)],
                                                                [CCActionDelay actionWithDuration:1.0f],
                                                                [CCActionMoveTo actionWithDuration:duration position:ccp(-SW*0.4f, effectBG.position.y)],
                                                                [CCActionDelay actionWithDuration:1.0f],
                                                                nil
                                                                ]]];
    [inParent addChild:sprite1 z:5];
}


@end
