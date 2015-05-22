//
//  MoedasTableViewController.m
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 22/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import "MoedasTableViewController.h"

@interface MoedasTableViewController ()

@end

@implementation MoedasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    _total=0;
    _lblTotalMoedas.text=[NSString stringWithFormat:@"%.2f", _total];
    
    
}


- (IBAction)calculaTotalMoedas:(id)sender {
    [self.view endEditing:YES];
    _total=0;
    
    _total=_total+0.01*[_qtd1Centavo.text floatValue];
    _total=_total+0.05*[_qtd5Centavos.text floatValue];
    _total=_total+0.10*[_qtd10Centavos.text floatValue];
    _total=_total+0.25*[_qtd25Centavos.text floatValue];
    _total=_total+0.50*[_qtd50Centavos.text floatValue];
    _total=_total+1*[_qtd1Real.text floatValue];
    
    
    _lblTotalMoedas.text=[NSString stringWithFormat:@"%.2f", _total];

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
    
}

-(void)flip10Centavos{
    
}

-(void)flip25Centavos{
    
}

-(void)flip50Centavos{
    
}

-(void)flip1Real{
    
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
