//
//  NotasTableViewController.m
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 13/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import "NotasTableViewController.h"
#import "MoedasTableViewController.h"
#import "SingletonClass.h"
#import <Chartboost/Chartboost.h>


@interface NotasTableViewController ()

@end

@implementation NotasTableViewController{
    SingletonClass *singleton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    singleton = [SingletonClass sharedManager];
    
    self.tabBarController.delegate=self;
    
    
    [_nota2ReaisFrente setAccessibilityIdentifier:@"frente"];
    [_nota5ReaisFrente setAccessibilityIdentifier:@"frente"];
    [_nota10ReaisFrente setAccessibilityIdentifier:@"frente"];
    [_nota20ReaisFrente setAccessibilityIdentifier:@"frente"];
    [_nota50ReaisFrente setAccessibilityIdentifier:@"frente"];
    [_nota100ReaisFrente setAccessibilityIdentifier:@"frente"];

    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                  initWithTarget:self
                                  action:@selector(dismissKeyboard)];
    
    
    
    [self.view addGestureRecognizer:tap];
    
    
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip2Reais)];
    singleTap2.numberOfTapsRequired = 1;
    [_nota2ReaisFrente setUserInteractionEnabled:YES];
    [_nota2ReaisFrente addGestureRecognizer:singleTap2];
    
    UITapGestureRecognizer *singleTap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip5Reais)];
    singleTap5.numberOfTapsRequired = 1;
    [_nota5ReaisFrente setUserInteractionEnabled:YES];
    [_nota5ReaisFrente addGestureRecognizer:singleTap5];
    
    UITapGestureRecognizer *singleTap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip10Reais)];
    singleTap10.numberOfTapsRequired = 1;
    [_nota10ReaisFrente setUserInteractionEnabled:YES];
    [_nota10ReaisFrente addGestureRecognizer:singleTap10];
    
    UITapGestureRecognizer *singleTap20 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip20Reais)];
    singleTap20.numberOfTapsRequired = 1;
    [_nota20ReaisFrente setUserInteractionEnabled:YES];
    [_nota20ReaisFrente addGestureRecognizer:singleTap20];
    
    UITapGestureRecognizer *singleTap50 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip50Reais)];
    singleTap50.numberOfTapsRequired = 1;
    [_nota50ReaisFrente setUserInteractionEnabled:YES];
    [_nota50ReaisFrente addGestureRecognizer:singleTap50];
    
    UITapGestureRecognizer *singleTap100 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip100Reais)];
    singleTap100.numberOfTapsRequired = 1;
    [_nota100ReaisFrente setUserInteractionEnabled:YES];
    [_nota100ReaisFrente addGestureRecognizer:singleTap100];
}



-(void)viewDidLayoutSubviews{
    _lblTotalNotas.text= [NSString stringWithFormat:@"%.2f", singleton.total];

}





-(void)dismissKeyboard {
    [self.view endEditing:YES];
}


- (IBAction)zerarButtonClicked:(id)sender {
    _qtd2Reais.text = @"";
    _qtd5Reais.text = @"";
    _qtd10Reais.text = @"";
    _qtd20Reais.text = @"";
    _qtd50Reais.text = @"";
    _qtd100Reais.text = @"";
    
    singleton.totalNotas=0;
    singleton.total=0;
    _lblTotalNotas.text=[NSString stringWithFormat:@"%.2f", singleton.total];
    
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
    return 10;
}



- (IBAction)calculaTotal:(id)sender {
    [self.view endEditing:YES];
    singleton.totalNotas=0;
    
    singleton.totalNotas=singleton.totalNotas+2*[_qtd2Reais.text floatValue];
    singleton.totalNotas=singleton.totalNotas+5*[_qtd5Reais.text floatValue];
    singleton.totalNotas=singleton.totalNotas+10*[_qtd10Reais.text floatValue];
    singleton.totalNotas=singleton.totalNotas+20*[_qtd20Reais.text floatValue];
    singleton.totalNotas=singleton.totalNotas+50*[_qtd50Reais.text floatValue];
    singleton.totalNotas=singleton.totalNotas+100*[_qtd100Reais.text floatValue];

    singleton.total=singleton.totalNotas+singleton.totalMoedas;
    _lblTotalNotas.text=[NSString stringWithFormat:@"%.2f", singleton.total];
    
    singleton.vezesCalculadas++;
    if (singleton.vezesCalculadas%3==0) {
        [Chartboost showInterstitial:CBLocationHomeScreen];
    }
    

}


-(void)flip2Reais{

    
    if ([_nota2ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso2 = [UIImage imageNamed:@"nota2_back"];
        [UIView transitionWithView:_nota2ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota2ReaisFrente.image = verso2;
                           } completion:nil];
        
        [_nota2ReaisFrente setAccessibilityIdentifier:@"verso"];

        
    }else{
        UIImage *frente2 = [UIImage imageNamed:@"nota2reais"];
        [UIView transitionWithView:_nota2ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota2ReaisFrente.image = frente2;
                           } completion:nil];
        
        [_nota2ReaisFrente setAccessibilityIdentifier:@"frente"];

        
    }
    
}


-(void)flip5Reais{
    
    
    if ([_nota5ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso5 = [UIImage imageNamed:@"nota5_back"];
        [UIView transitionWithView:_nota5ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota5ReaisFrente.image = verso5;
                           } completion:nil];
        
        [_nota5ReaisFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente5 = [UIImage imageNamed:@"nota5reais"];
        [UIView transitionWithView:_nota5ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota5ReaisFrente.image = frente5;
                           } completion:nil];
        
        [_nota5ReaisFrente setAccessibilityIdentifier:@"frente"];
        
        
    }
    
}


-(void)flip10Reais{
    
    
    if ([_nota10ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso10 = [UIImage imageNamed:@"nota10_back"];
        [UIView transitionWithView:_nota10ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota10ReaisFrente.image = verso10;
                           } completion:nil];
        
        [_nota10ReaisFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente10 = [UIImage imageNamed:@"nota10reais"];
        [UIView transitionWithView:_nota10ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota10ReaisFrente.image = frente10;
                           } completion:nil];
        
        [_nota10ReaisFrente setAccessibilityIdentifier:@"frente"];
        
        
    }
    
}


-(void)flip20Reais{
    
    
    if ([_nota20ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso20 = [UIImage imageNamed:@"nota20_back"];
        [UIView transitionWithView:_nota20ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota20ReaisFrente.image = verso20;
                           } completion:nil];
        
        [_nota20ReaisFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente20 = [UIImage imageNamed:@"nota20reais"];
        [UIView transitionWithView:_nota20ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota20ReaisFrente.image = frente20;
                           } completion:nil];
        
        [_nota20ReaisFrente setAccessibilityIdentifier:@"frente"];
        
        
    }
    
}

-(void)flip50Reais{
    
    
    if ([_nota50ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso50 = [UIImage imageNamed:@"nota50_back"];
        [UIView transitionWithView:_nota50ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota50ReaisFrente.image = verso50;
                           } completion:nil];
        
        [_nota50ReaisFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente50 = [UIImage imageNamed:@"nota50reais"];
        [UIView transitionWithView:_nota50ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota50ReaisFrente.image = frente50;
                           } completion:nil];
        
        [_nota50ReaisFrente setAccessibilityIdentifier:@"frente"];
        
        
    }
    
}

-(void)flip100Reais{
    
    
    if ([_nota100ReaisFrente.accessibilityIdentifier  isEqual: @"frente"]) {
        
        UIImage *verso100 = [UIImage imageNamed:@"nota100_back"];
        [UIView transitionWithView:_nota100ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota100ReaisFrente.image = verso100;
                           } completion:nil];
        
        [_nota100ReaisFrente setAccessibilityIdentifier:@"verso"];
        
        
    }else{
        UIImage *frente100 = [UIImage imageNamed:@"nota100reais"];
        [UIView transitionWithView:_nota100ReaisFrente duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               _nota100ReaisFrente.image = frente100;
                           } completion:nil];
        
        [_nota100ReaisFrente setAccessibilityIdentifier:@"frente"];
        
        
    }
    
}


- (IBAction)digitandoQtd2Reais:(id)sender {
    [self flip2Reais];
}

- (IBAction)digitandoQtd5Reais:(id)sender {
    [self flip5Reais];
}

- (IBAction)digitandoQtd10Reais:(id)sender {
    [self flip10Reais];
}

- (IBAction)digitandoQtd20Reais:(id)sender {
    [self flip20Reais];
}

- (IBAction)digitandoQtd50Reais:(id)sender {
    [self flip50Reais];
}

- (IBAction)digitandoQtd100Reais:(id)sender {
    [self flip100Reais];
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
