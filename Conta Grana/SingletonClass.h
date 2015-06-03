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
    unsigned long long total;
    unsigned long long totalMoedas;
    unsigned long long totalNotas;
    int vezesCalculadas;
    BOOL primeiraVezRodado;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic) unsigned long long total;
@property (nonatomic) unsigned long long totalMoedas;
@property (nonatomic) unsigned long long totalNotas;
@property (nonatomic) int vezesCalculadas;
@property (nonatomic) BOOL primeiraVezRodado;


+ (id)sharedManager;


@end
