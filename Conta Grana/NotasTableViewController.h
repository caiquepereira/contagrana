//
//  NotasTableViewController.h
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 13/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotasTableViewController : UITableViewController <UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *qtd2Reais;
@property (weak, nonatomic) IBOutlet UITextField *qtd5Reais;
@property (weak, nonatomic) IBOutlet UITextField *qtd10Reais;
@property (weak, nonatomic) IBOutlet UITextField *qtd20Reais;
@property (weak, nonatomic) IBOutlet UITextField *qtd50Reais;
@property (weak, nonatomic) IBOutlet UITextField *qtd100Reais;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalNotas;

@property (nonatomic) unsigned long long totalNotas;
@property (nonatomic) unsigned long long totalMoedas;
@property (nonatomic) unsigned long long total;


@property (weak, nonatomic) IBOutlet UIImageView *nota2ReaisFrente;
@property (weak, nonatomic) IBOutlet UIImageView *nota5ReaisFrente;
@property (weak, nonatomic) IBOutlet UIImageView *nota10ReaisFrente;
@property (weak, nonatomic) IBOutlet UIImageView *nota20ReaisFrente;
@property (weak, nonatomic) IBOutlet UIImageView *nota50ReaisFrente;
@property (weak, nonatomic) IBOutlet UIImageView *nota100ReaisFrente;

@end
