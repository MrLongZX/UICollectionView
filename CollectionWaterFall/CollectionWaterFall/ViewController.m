//
//  ViewController.m
//  CollectionWaterFall
//
//  Created by guimi on 2018/5/29.
//  Copyright © 2018年 guimi. All rights reserved.
//

#import "ViewController.h"
#import "GMShopOwnerStyleViewController.h"
#import "GMShopOwnerStyleViewController2.h"

static NSString *identifier = @"TableViewCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** Table */
@property (nonatomic, strong) UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"瀑布流";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.table];
}

#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"方式一";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"方式二";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            
            GMShopOwnerStyleViewController *vc = [[GMShopOwnerStyleViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            
            GMShopOwnerStyleViewController2 *vc = [[GMShopOwnerStyleViewController2 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 懒加载
- (UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.dataSource = self;
        _table.delegate = self;
        _table.backgroundColor = [UIColor whiteColor];
        _table.showsVerticalScrollIndicator = NO;
        _table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _table;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
