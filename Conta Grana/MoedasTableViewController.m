//
//  MoedasTableViewController.m
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 22/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import "MoedasTableViewController.h"
#import "NotasTableViewController.h"
#import "SingletonClass.h"
#import <Chartboost/Chartboost.h>


@interface MoedasTableViewController ()

@end

@implementation MoedasTableViewController{
    SingletonClass *singleton;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    singleton = [SingletonClass sharedManager];

    
    self.tabBarController.delegate=self;
    
    [_moeda1CentavoFrente setAccessibilityIdentifier:@"frente"];
    [_moeda5CentavosFrente setAccessibilityIdentifier:@"frente"];
    [_moeda10CentavosFrente setAccessibilityIdentifier:@"frente"];
    [_moeda25CentavosFrente setAccessibilityIdentifier:@"frente"];
    [_moeda50CentavosFrente setAccessibilityIdentifier:@"frente"];
    [_moeda1RealFrente setAccessibilityIdentifier:@"frente"];
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    
    
    [self.view addGestureRecognizer:tap];
    
    
    UITapGestureRecognizer *singleTap1Centavo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip1Centavo)];
    singleTap1Centavo.numberOfTapsRequired = 1;
    [_moeda1CentavoFrente setUserInteractionEnabled:YES];
    [_moeda1CentavoFrente addGestureRecognizer:singleTap1Centavo];
    
    UITapGestureRecognizer *singleTap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip5Centavos)];
    singleTap5.numberOfTapsRequired = 1;
    [_moeda5CentavosFrente setUserInteractionEnabled:YES];
    [_moeda5CentavosFrente addGestureRecognizer:singleTap5];
    
    UITapGestureRecognizer *singleTap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip10Centavos)];
    singleTap10.numberOfTapsRequired = 1;
    [_moeda10CentavosFrente setUserInteractionEnabled:YES];
    [_moeda10CentavosFrente addGestureRecognizer:singleTap10];
    
    UITapGestureRecognizer *singleTap25 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip25Centavos)];
    singleTap25.numberOfTapsRequired = 1;
    [_moeda25CentavosFrente setUserInteractionEnabled:YES];
    [_moeda25CentavosFrente addGestureRecognizer:singleTap25];
    
    UITapGestureRecognizer *singleTap50 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip50Centavos)];
    singleTap50.numberOfTapsRequired = 1;
    [_moeda50CentavosFrente setUserInteractionEnabled:YES];
    [_moeda50CentavosFrente addGestureRecognizer:singleTap50];
    
    UITapGestureRecognizer *singleTap1Real = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip1Real)];
    singleTap1Real.numberOfTapsRequired = 1;
    [_moeda1RealFrente setUserInteractionEnabled:YES];
    [_moeda1RealFrente addGestureRecognizer:singleTap1Real];

    
}

-(void)viewDidDisappear:(BOOL)animated{
    singleton.totalMoedas=0;
    
    singleton.totalMoedas=singleton.totalMoedas+0.01*[_qtd1Centavo.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.05*[_qtd5Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.10*[_qtd10Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.25*[_qtd25Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.50*[_qtd50Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+1*[_qtd1Real.text floatValue];
}


-(void)viewDidLayoutSubviews{
    _lblTotalMoedas.text= [NSString stringWithFormat:@"%.2llu", singleton.total];

}






-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)zerarButtonClicked:(id)sender {
    
    _qtd1Centavo.text = @"";
    _qtd5Centavos.text = @"";
    _qtd10Centavos.text = @"";
    _qtd25Centavos.text = @"";
    _qtd50Centavos.text = @"";
    _qtd1Real.text = @"";
    
    singleton.total=0;
    singleton.totalMoedas=0;
    _lblTotalMoedas.text=[NSString stringWithFormat:@"%.2llu", singleton.total];
    
    
    if ([_moeda1CentavoFrente.accessibilityIdentifier  isEqual: @"verso"]) {
        
        UIImage *frente1 = [UIImage imageNamed:@"moeda1centavo"];
        [UIView transitionWithView:_moeda1CentavoFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1CentavoFrente.image = frente1;
                           } completion:nil];
        
        [_moeda1CentavoFrente setAccessibilityIdentifier:@"frente"];

        
    }
    
    if ([_moeda5CentavosFrente.accessibilityIdentifier  isEqual: @"verso"]) {
        
        UIImage *frente5 = [UIImage imageNamed:@"moeda5centavos"];
        [UIView transitionWithView:_moeda5CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda5CentavosFrente.image = frente5;
                           } completion:nil];
        
        [_moeda5CentavosFrente setAccessibilityIdentifier:@"frente"];
        
    }
    
    if ([_moeda10CentavosFrente.accessibilityIdentifier  isEqual: @"verso"]) {
        
        UIImage *frente10 = [UIImage imageNamed:@"moeda10centavos"];
        [UIView transitionWithView:_moeda10CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda10CentavosFrente.image = frente10;
                           } completion:nil];
        
        [_moeda10CentavosFrente setAccessibilityIdentifier:@"frente"];
    }
    
    if ([_moeda25CentavosFrente.accessibilityIdentifier  isEqual: @"verso"]) {
        UIImage *frente25 = [UIImage imageNamed:@"moeda25centavos"];
        [UIView transitionWithView:_moeda25CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda25CentavosFrente.image = frente25;
                           } completion:nil];
        
        [_moeda25CentavosFrente setAccessibilityIdentifier:@"frente"];
    }
    
    if ([_moeda50CentavosFrente.accessibilityIdentifier  isEqual: @"verso"]) {

        UIImage *frente50 = [UIImage imageNamed:@"moeda50centavos"];
        [UIView transitionWithView:_moeda50CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda50CentavosFrente.image = frente50;
                           } completion:nil];
        
        [_moeda50CentavosFrente setAccessibilityIdentifier:@"frente"];

        
    }
    
    if ([_moeda1RealFrente.accessibilityIdentifier  isEqual: @"verso"]) {
        
        UIImage *frente1Real = [UIImage imageNamed:@"moeda1real"];
        [UIView transitionWithView:_moeda1RealFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1RealFrente.image = frente1Real;
                           } completion:nil];
        
        [_moeda1RealFrente setAccessibilityIdentifier:@"frente"];
        
    }
    
    
    
}


- (IBAction)calculaTotalMoedas:(id)sender {
    [self.view endEditing:YES];
    singleton.totalMoedas=0;
    
    singleton.totalMoedas=singleton.totalMoedas+0.01*[_qtd1Centavo.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.05*[_qtd5Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.10*[_qtd10Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.25*[_qtd25Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+0.50*[_qtd50Centavos.text floatValue];
    singleton.totalMoedas=singleton.totalMoedas+1*[_qtd1Real.text floatValue];
    
    
    singleton.total=singleton.totalMoedas+singleton.totalNotas;
    _lblTotalMoedas.text=[NSString stringWithFormat:@"%.2llu", singleton.total];
    
    singleton.vezesCalculadas++;
   
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]) { // app already launched
        if(singleton.primeiraVezRodado == YES && singleton.vezesCalculadas%5==0){
            [Chartboost showInterstitial:CBLocationHomeScreen];
            
        }else if (singleton.primeiraVezRodado == NO && singleton.vezesCalculadas%3==0) {
            [Chartboost showInterstitial:CBLocationHomeScreen];
        }
        
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize]; // This is the first launch ever
        
        singleton.primeiraVezRodado=YES;
        
    }

}

-(void)flip1Centavo{
    

    if ([_moeda1CentavoFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso1 = [UIImage imageNamed:@"moeda1centavoBack"];
        [UIView transitionWithView:_moeda1CentavoFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1CentavoFrente.image = verso1;
                           } completion:nil];
        
        [_moeda1CentavoFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente1 = [UIImage imageNamed:@"moeda1centavo"];
        [UIView transitionWithView:_moeda1CentavoFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1CentavoFrente.image = frente1;
                           } completion:nil];
        
        [_moeda1CentavoFrente setAccessibilityIdentifier:@"frente"];
        
        
    }




}

-(void)flip5Centavos{
    
    
    
    if ([_moeda5CentavosFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso5 = [UIImage imageNamed:@"moeda5centavosBack"];
        [UIView transitionWithView:_moeda5CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda5CentavosFrente.image = verso5;
                           } completion:nil];
        
        [_moeda5CentavosFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente5 = [UIImage imageNamed:@"moeda5centavos"];
        [UIView transitionWithView:_moeda5CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda5CentavosFrente.image = frente5;
                           } completion:nil];
        
        [_moeda5CentavosFrente setAccessibilityIdentifier:@"frente"];
        
        
    }

    
    
    
    
}

-(void)flip10Centavos{
    
    
    
    if ([_moeda10CentavosFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso10 = [UIImage imageNamed:@"moeda10centavosBack"];
        [UIView transitionWithView:_moeda10CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda10CentavosFrente.image = verso10;
                           } completion:nil];
        
        [_moeda10CentavosFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente10 = [UIImage imageNamed:@"moeda10centavos"];
        [UIView transitionWithView:_moeda10CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda10CentavosFrente.image = frente10;
                           } completion:nil];
        
        [_moeda10CentavosFrente setAccessibilityIdentifier:@"frente"];
        
        
    }

    
    
}

-(void)flip25Centavos{
    
    
    if ([_moeda25CentavosFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso25 = [UIImage imageNamed:@"moeda25centavosBack"];
        [UIView transitionWithView:_moeda25CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda25CentavosFrente.image = verso25;
                           } completion:nil];
        
        [_moeda25CentavosFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente25 = [UIImage imageNamed:@"moeda25centavos"];
        [UIView transitionWithView:_moeda25CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda25CentavosFrente.image = frente25;
                           } completion:nil];
        
        [_moeda25CentavosFrente setAccessibilityIdentifier:@"frente"];
        
    }
    
    
}

-(void)flip50Centavos{
    
    
    if ([_moeda50CentavosFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso50 = [UIImage imageNamed:@"moeda50centavosBack"];
        [UIView transitionWithView:_moeda50CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda50CentavosFrente.image = verso50;
                           } completion:nil];
        
        [_moeda50CentavosFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente50 = [UIImage imageNamed:@"moeda50centavos"];
        [UIView transitionWithView:_moeda50CentavosFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda50CentavosFrente.image = frente50;
                           } completion:nil];
        
        [_moeda50CentavosFrente setAccessibilityIdentifier:@"frente"];
        
    }

    
    
}

-(void)flip1Real{
 
    
    if ([_moeda1RealFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso1Real = [UIImage imageNamed:@"moeda1realBack"];
        [UIView transitionWithView:_moeda1RealFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1RealFrente.image = verso1Real;
                           } completion:nil];
        
        [_moeda1RealFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente1Real = [UIImage imageNamed:@"moeda1real"];
        [UIView transitionWithView:_moeda1RealFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _moeda1RealFrente.image = frente1Real;
                           } completion:nil];
        
        [_moeda1RealFrente setAccessibilityIdentifier:@"frente"];
        
    }

    
    
} 


- (IBAction)digitandoQtd1Centavo:(id)sender {
    [self flip1Centavo];
}

- (IBAction)digitandoQtd5Centavos:(id)sender {
    [self flip5Centavos];
}

- (IBAction)digitandoQtd10Centavos:(id)sender {
    [self flip10Centavos];
}
- (IBAction)digitandoQtd25Centavos:(id)sender {
    [self flip25Centavos];
}

- (IBAction)digitandoQtd50Centavos:(id)sender {
    [self flip50Centavos];
}

- (IBAction)digitandoQtd1Real:(id)sender {
    [self flip1Real];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 11;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
