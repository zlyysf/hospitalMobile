//
//  LZMultiSelectDiseaseController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-24.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZMultiSelectDiseaseController.h"
#import "LZSelectDiseaseCell.h"
#import "SSCheckBoxView.h"
#import "LZUtility.h"

@interface LZMultiSelectDiseaseController ()

@end

@implementation LZMultiSelectDiseaseController{
    NSArray *diseaseAry ;
    NSMutableArray *checkStateAry;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    diseaseAry = @[@"心脏病",@"冠心病",@"糖尿病",@"高血压",@"肝炎", @"中风",@"尿毒症",@"肾炎",@"肺炎",@"支气管炎",
                   @"气管炎",@"胃溃疡",@"十二指肠溃疡",@"胃炎",@"结膜炎", @"角膜炎",@"鼻窦炎",@"中耳炎",@"口腔溃疡",@"颈椎病",
                   @"关节炎",@"咽炎",@"喉炎",@"骨质增生",@"直肠炎"];
    checkStateAry = [LZUtility generateArrayWithFillItem:[NSNumber numberWithBool:false] andArrayLength:diseaseAry.count];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) checkBoxViewChangedState:(SSCheckBoxView *)cbv
{
    int idx = cbv.tag;
    checkStateAry[idx] = [NSNumber numberWithBool:cbv.checked];
//    NSLog(@"checkBoxViewChangedState: %d", cbv.checked);
//    [UIHelpers showAlertWithTitle:@"CheckBox State Changed" msg:[NSString stringWithFormat:@"checkBoxView state: %d", cbv.checked]];
//    
//    // toggle all
//    for (SSCheckBoxView *cbv in self.checkboxes) {
//        cbv.enabled = !cbv.enabled;
//    }
}

- (void)btnOKTouchUpInside:(UIButton*)senderBtn
{
    NSMutableArray *checkedItems = [NSMutableArray array];
    for(int i=0; i<diseaseAry.count; i++){
        NSNumber *checkState = checkStateAry[i];
        if ([checkState boolValue]){
            [checkedItems addObject:diseaseAry[i]];
        }
    }//for
    NSString *strSelectedItems = [checkedItems componentsJoinedByString:@"，"];
    if (self.outerTextField != nil){
        self.outerTextField.text = strSelectedItems;
    }
    if (self.outerTextView != nil){
        self.outerTextView.text = strSelectedItems;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)btnCancelTouchUpInside:(UIButton*)senderBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (diseaseAry.count+1)/2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZSelectDiseaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZSelectDiseaseCell" forIndexPath:indexPath];
    int idx1 = indexPath.row * 2;
    int idx2 = indexPath.row * 2 + 1;
    
    if (cell.cbView1 == nil){
        CGRect frame = CGRectMake(10, 7, 140, 30);
        SSCheckBoxView *cbv = [[SSCheckBoxView alloc] initWithFrame:frame style:kSSCheckBoxViewStyleGlossy checked:false];
        [cbv setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
        cbv.textLabel.font = [UIFont systemFontOfSize:14];
        cell.cbView1 = cbv;
        [cell addSubview:cbv];
    }
    cell.cbView1.tag = idx1;
    [cell.cbView1 setText:diseaseAry[idx1]];
    NSNumber *checkState1 = checkStateAry[idx1];
    cell.cbView1.checked = [checkState1 boolValue];
    
    if (cell.cbView2 == nil){
        CGRect frame = CGRectMake(170, 7, 140, 30);
        SSCheckBoxView *cbv = [[SSCheckBoxView alloc] initWithFrame:frame style:kSSCheckBoxViewStyleGlossy checked:false];
        [cbv setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
        cbv.textLabel.font = [UIFont systemFontOfSize:14];
        cell.cbView2 = cbv;
        [cell addSubview:cbv];
    }
    cell.cbView2.tag = idx2;
    cell.cbView2.checked = true;
    if (idx2 <= diseaseAry.count-1){
        [cell.cbView2 setText:diseaseAry[idx2]];
        cell.cbView2.hidden = false;
        NSNumber *checkState2 = checkStateAry[idx2];
        cell.cbView2.checked = [checkState2 boolValue];
    }else{
        cell.cbView2.hidden = true;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIButton *btnOK = [[UIButton alloc]initWithFrame:CGRectMake(70, 6, 80, 30)];
    UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(170, 6, 80, 30)];
    [sectionView addSubview:btnOK];
    [sectionView addSubview:btnCancel];
    [btnOK setTitle:@"确定" forState:UIControlStateNormal];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    
    [btnOK setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnCancel setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btnOK addTarget:self action:@selector(btnOKTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel addTarget:self action:@selector(btnCancelTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    return sectionView;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
