//
//  LZZhenHaoViewController.m
//  HospitalMobile
//
//  Created by Yasofon on 14-3-11.
//  Copyright (c) 2014年 Yasofon. All rights reserved.
//

#import "LZZhenHaoViewController.h"

#import "LZQueuePlaceCell.h"
#import "LZCurrentDiseaseCell.h"
#import "LZCheckResultCell.h"
#import "LZPrescribeMedicineItemCell.h"
#import "LZDoctorAdviceCell.h"
#import "LZDemoData.h"
#import "LZUtility.h"
#import "LZKeyboardToolBarToHideKB.h"

#import "LZCheckResultTextViewController.h"
#import "LZCheckResultImageViewController.h"

#import "LZConstant.h"

@interface LZZhenHaoViewController ()<UITextViewDelegate>

@end

@implementation LZZhenHaoViewController{
    NSArray *checkAry, *yaopinAry;
}

@synthesize zhenhaoDict;

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
    
    checkAry = [[LZDemoData singleton] get_jianchaAryByZhenhao:zhenhaoDict[@"id"]];
    yaopinAry = [[LZDemoData singleton] get_yaopinAryByZhenhao:zhenhaoDict[@"id"]];
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

#pragma mark- cell button event handler



- (void)cellbuttonPayCheckTouchUpInside:(UIButton*)sender {
    //    NSLog(@"cellbuttonPayCheckTouchUpInside sender=%@",sender);
    int rowPos = sender.tag - CellButtonTagOffsetToContainRowPosition;
    NSDictionary *checkDict = checkAry[rowPos];
    
    UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"交费" message:@"交费" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertview show];

    
}
- (void)cellbuttonSeeResultTouchUpInside:(UIButton*)sender {
    //    NSLog(@"cellbuttonSeeResultTouchUpInside sender=%@",sender);
    int rowPos = sender.tag - CellButtonTagOffsetToContainRowPosition;
    NSDictionary *checkDict = checkAry[rowPos];
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"SeeDoctor" bundle:nil];
    if ([@"血液生化" isEqualToString:checkDict[@"name"]]){
        LZCheckResultTextViewController * CheckResultTextViewController = [sboard instantiateViewControllerWithIdentifier:@"LZCheckResultTextViewController"];
        CheckResultTextViewController.checkResultDict = checkDict;
        CheckResultTextViewController.title = @"检查结果";
        [self.navigationController pushViewController:CheckResultTextViewController animated:YES];
    }if ([@"CT：头颈部" isEqualToString:checkDict[@"name"]]){
        LZCheckResultImageViewController * CheckResultImageViewController = [sboard instantiateViewControllerWithIdentifier:@"LZCheckResultImageViewController"];
        CheckResultImageViewController.checkResultDict = checkDict;
        CheckResultImageViewController.title = @"检查结果";
        [self.navigationController pushViewController:CheckResultImageViewController animated:YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0 || section==1 || section==3){
        return 1;
    }else if(section==2){
        return checkAry.count;
    }else if(section==4){
        return yaopinAry.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        LZQueuePlaceCell *QueuePlaceCell = [tableView dequeueReusableCellWithIdentifier:@"LZQueuePlaceCell" forIndexPath:indexPath];
        
        QueuePlaceCell.labelDaifu.text = zhenhaoDict[@"daifu"];
        QueuePlaceCell.labelKeshi.text = zhenhaoDict[@"department"];
        
        NSDate *dtRegisterTime = zhenhaoDict[@"RegisterTime"];
        NSDateFormatter *dtfmt = [[NSDateFormatter alloc]init];
        [dtfmt setDateFormat:@"yyyy年MM月dd日"];
        NSString *sRegisterDate = [dtfmt stringFromDate:dtRegisterTime];
        QueuePlaceCell.labelDate.text = [NSString stringWithFormat:@"%@ %@",sRegisterDate,[LZUtility getDaySpanName:dtRegisterTime]];
        
        QueuePlaceCell.labelSeqInfo.text = [NSString stringWithFormat:@"诊号序号:%@",zhenhaoDict[@"seq"] ];
        QueuePlaceCell.labelWaitQueueInfo.text = @"前面还有5人";

        return QueuePlaceCell;
    }else if(indexPath.section==1){
        LZCurrentDiseaseCell *CurrentDiseaseCell = [tableView dequeueReusableCellWithIdentifier:@"LZCurrentDiseaseCell" forIndexPath:indexPath];
        
        CurrentDiseaseCell.textviewCurrentDisease.text = zhenhaoDict[@"patientDiseaseDescription"];
        CurrentDiseaseCell.textviewCurDiseaseHistory.text = zhenhaoDict[@"patientDiseaseHistory"];
        
        CurrentDiseaseCell.textviewCurrentDisease.delegate = self;
        CurrentDiseaseCell.textviewCurDiseaseHistory.delegate = self;
        
        return CurrentDiseaseCell;
    }else if(indexPath.section == 3){
        LZDoctorAdviceCell *DoctorAdviceCell = [tableView dequeueReusableCellWithIdentifier:@"LZDoctorAdviceCell" forIndexPath:indexPath];
        
        DoctorAdviceCell.textviewDoctorConclusion.text = zhenhaoDict[@"doctorDiseaseDescription"];
        DoctorAdviceCell.textviewDoctorAdvice.text = zhenhaoDict[@"doctorAdvice"];
        
        DoctorAdviceCell.textviewDoctorConclusion.delegate = self;
        DoctorAdviceCell.textviewDoctorAdvice.delegate = self;
        
        return DoctorAdviceCell;
    }else if(indexPath.section==2){
        LZCheckResultCell *CheckResultCell = [tableView dequeueReusableCellWithIdentifier:@"LZCheckResultCell" forIndexPath:indexPath];
        NSDictionary *jianchaItem = checkAry[indexPath.row];
        
        NSDictionary *jiaofeiItem = [[LZDemoData singleton] get_jiaofeiInfoByJiancha:jianchaItem[@"id"]];
        NSNumber *nmIsPaid = jiaofeiItem[@"isPaid"];
        
        CheckResultCell.labelCheckItemName.text = jianchaItem[@"name"];
        CheckResultCell.buttonPayCheck.hidden = ([nmIsPaid intValue]==1);
        CheckResultCell.labelWaitQueueInfo.text = @"前面还有3个";
        NSString *sResultOutcomeState;
        if ([ @"已审核" isEqualToString: jianchaItem[@"checkState"]]){
            sResultOutcomeState = [NSString stringWithFormat:@"结果已出"];
            CheckResultCell.labelResultEstimateTime.hidden = true;
            CheckResultCell.buttonSeeResult.hidden = false;
        }else{
            sResultOutcomeState = [NSString stringWithFormat:@"结果未出"];
            CheckResultCell.labelResultEstimateTime.hidden = false;
            CheckResultCell.labelResultEstimateTime.text = @"1小时后";
            CheckResultCell.buttonSeeResult.hidden = true;
        }
            
        CheckResultCell.labelResultOutcomeState.text = sResultOutcomeState;
        
//        NSLog(@"CheckResultCell.buttonPayCheck.tag=%d",CheckResultCell.buttonPayCheck.tag);
        if(CheckResultCell.buttonPayCheck.tag == 0){//这里用tag既存行号，又判断是否加过事件处理函数
            [CheckResultCell.buttonPayCheck addTarget:self action:@selector(cellbuttonPayCheckTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        }
        CheckResultCell.buttonPayCheck.tag = indexPath.row+CellButtonTagOffsetToContainRowPosition;
        
        if(CheckResultCell.buttonSeeResult.tag == 0){
            [CheckResultCell.buttonSeeResult addTarget:self action:@selector(cellbuttonSeeResultTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        }
        CheckResultCell.buttonSeeResult.tag = indexPath.row+CellButtonTagOffsetToContainRowPosition;
        
        return CheckResultCell;
    }else if(indexPath.section==4){
        LZPrescribeMedicineItemCell *PrescribeMedicineItemCell = [tableView dequeueReusableCellWithIdentifier:@"LZPrescribeMedicineItemCell" forIndexPath:indexPath];
        NSDictionary *yaopinDict = yaopinAry[indexPath.row];
        PrescribeMedicineItemCell.labelName.text = yaopinDict[@"name"];
        PrescribeMedicineItemCell.labelAmount.text = [NSString stringWithFormat:@"%@%@",yaopinDict[@"amount"],yaopinDict[@"unit"]];
        return PrescribeMedicineItemCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        return 100;
    }else if(indexPath.section==1){
        return 210;
    }else if(indexPath.section == 3){
        return 210;
    }else if(indexPath.section==2){
        return 70;
    }else if(indexPath.section==4){
        return 40;
    }
    return 65;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
////    [sectionView setBackgroundColor:[UIColor whiteColor]];
//    
//    UILabel *sectionTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 310, 30)];
////    [sectionTitleLabel setTextColor:[UIColor whiteColor]];
//    [sectionTitleLabel setFont:[UIFont boldSystemFontOfSize:16]];
////    [sectionTitleLabel setBackgroundColor:[UIColor clearColor]];
//    [sectionView addSubview:sectionTitleLabel];
//    
//    NSString *sectionTitle;
//    if (section==4){
//        sectionTitle = @"开药清单";
//    }else if (section==2){
//        sectionTitle = @"检查项目";
//    }else{
//        return nil;
//    }
//    
//    sectionTitleLabel.text = sectionTitle;
//    
//    return sectionView;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section==4){
//        return 30;
//    }else if (section==2){
//        return 30;
//    }else{
//        return 0;
//    }
//}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *sectionTitle = nil;
    if (section==0){
        sectionTitle = @"排队情况";
    }else if (section==1){
        sectionTitle = @"病人填写";
    }else if (section==2){
        sectionTitle = @"检查项目";
    }else if (section==3){
        sectionTitle = @"医生诊断";
    }else if (section==4){
        sectionTitle = @"开药清单";
    }else{
        return nil;
    }
    return sectionTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    int rowPos = indexPath.row;
//    NSDictionary *zhenhao = zhenhaoAry[rowPos];
//    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"SeeDoctor" bundle:nil];
//    LZZhenHaoViewController * ZhenHaoViewController = [sboard instantiateViewControllerWithIdentifier:@"LZZhenHaoViewController"];
//    ZhenHaoViewController.zhenhaoDict = zhenhao;
//    
//    ZhenHaoViewController.title = @"诊号";
//    [self.navigationController pushViewController:ZhenHaoViewController animated:YES];
    
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */





#pragma mark- UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (textView.inputAccessoryView == nil){
        LZKeyboardToolBarToHideKB *keyboardToolbar = [LZKeyboardToolBarToHideKB newOne_withDoneButtonTitle:@"完成" andTextCtrl:textView];
        textView.inputAccessoryView = keyboardToolbar;
    }
    return YES;
}




@end












