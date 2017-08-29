//
//  SizerViewController.m
//  右侧滑出筛选项
//
//  Created by WangXueqi on 17/8/29.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "SizerViewController.h"

@interface SizerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *arrList;
@end

@implementation SizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选";
    [self createTable];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(showLeft:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (NSArray *)arrList {

    if (!_arrList) {
        _arrList = [NSArray arrayWithObjects:@"选项一",@"选项二",@"选项三",@"选项四",@"选项五",@"选项六", nil];
    }
    return _arrList;
}

- (void)createTable {
    
    UITableView *myTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.rowHeight = 44;
    myTable.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:myTable];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.arrList[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.clickCell(self.arrList[indexPath.row], indexPath.row);
    self.tap();
}
//返回按钮
-(void)showLeft:(UIButton *)sender{
    
    self.tap();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
