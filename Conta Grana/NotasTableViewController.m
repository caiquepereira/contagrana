//
//  NotasTableViewController.m
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 13/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import "NotasTableViewController.h"

@interface NotasTableViewController ()

@end

@implementation NotasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                  initWithTarget:self
                                  action:@selector(dismissKeyboard)];
    
    
    
    [self.view addGestureRecognizer:tap];
    
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
    
    _total=0;
    _lblTotalNotas.text=[NSString stringWithFormat:@"%.2f", _total];
    
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
    _total=0;
    
    _total=_total+2*[_qtd2Reais.text floatValue];
    _total=_total+5*[_qtd5Reais.text floatValue];
    _total=_total+10*[_qtd10Reais.text floatValue];
    _total=_total+20*[_qtd20Reais.text floatValue];
    _total=_total+50*[_qtd50Reais.text floatValue];
    _total=_total+100*[_qtd100Reais.text floatValue];

    
    _lblTotalNotas.text=[NSString stringWithFormat:@"%.2f", _total];
    
    
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
