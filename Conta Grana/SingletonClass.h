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
    long double total;
    long double totalMoedas;
    long double totalNotas;
    int vezesCalculadas;
    BOOL primeiraVezRodado;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic) long double total;
@property (nonatomic) long double totalMoedas;
@property (nonatomic) long double totalNotas;
@property (nonatomic) int vezesCalculadas;
@property (nonatomic) BOOL primeiraVezRodado;


+ (id)sharedManager;


@end
