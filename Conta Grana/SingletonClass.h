//
//  SingletonClass.h
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 22/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject{
    NSString *someProperty;
    float total;
    float totalMoedas;
    float totalNotas;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic) float total;
@property (nonatomic) float totalMoedas;
@property (nonatomic) float totalNotas;


+ (id)sharedManager;


@end
