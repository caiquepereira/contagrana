//
//  MoedasTableViewController.h
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 22/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoedasTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *qtd1Centavo;
@property (weak, nonatomic) IBOutlet UITextField *qtd5Centavos;
@property (weak, nonatomic) IBOutlet UITextField *qtd10Centavos;
@property (weak, nonatomic) IBOutlet UITextField *qtd25Centavos;
@property (weak, nonatomic) IBOutlet UITextField *qtd50Centavos;
@property (weak, nonatomic) IBOutlet UITextField *qtd1Real;


@property (nonatomic) float total;


@property (weak, nonatomic) IBOutlet UIImageView *moeda1CentavoFrente;
@property (weak, nonatomic) IBOutlet UIImageView *moeda5CentavosFrente;
@property (weak, nonatomic) IBOutlet UIImageView *moeda10CentavosFrente;
@property (weak, nonatomic) IBOutlet UIImageView *moeda25CentavosFrente;
@property (weak, nonatomic) IBOutlet UIImageView *moeda50CentavosFrente;
@property (weak, nonatomic) IBOutlet UIImageView *moeda1RealFrente;


@property (weak, nonatomic) IBOutlet UILabel *lblTotalMoedas;

@end
