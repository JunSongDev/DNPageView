//
//  PageListController.m
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "PageListController.h"
#import "DNHomeDataModel.h"
#import "DNTextCell.h"
#import "DNImageCell.h"
#import "DNVedioCell.h"

@interface PageListController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation PageListController

#pragma mark -- LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setControlForSuper];
    [self addConstrainsForSuper];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.page = 0;
    [self getDataWithType:self.type page:self.page];
}


/**
- (void)viewDidAppear:(BOOL)animated {
[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
[super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated {
[super viewDidDisappear:animated];
}
*/


#pragma mark -- DidReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- SetControlForSuper
- (void)setControlForSuper
{
    [self.tableView registerClass:[DNTextCell class] forCellReuseIdentifier:@"DNTextCell"];
    [self.tableView registerClass:[DNImageCell class] forCellReuseIdentifier:@"DNImageCell"];
    
    [self.view addSubview:self.tableView];
    DNWeak(self);
    [self.tableView dn_startHeaderRefreshWithRefreshBlock:^{
       
        [weakself refresh];
    }];
    
    [self.tableView dn_startFooterUploadRefreshBlock:^{
       
        [weakself loadMore];
    }];
}

- (void)refresh {
    self.page = 0;
    [self getDataWithType:self.type page:self.page];
}

- (void)loadMore {
    self.page ++;
    [self getDataWithType:self.type page:self.page];
}

#pragma mark -- AddConstrainsForSuper
- (void)addConstrainsForSuper
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).inset(TAB_BAR_HEIGHT);
    }];
}

#pragma mark -- Target Methods

#pragma mark -- Private Methods

#pragma mark -- UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DNHomeDataModel * model = self.dataArray[indexPath.row];
    if (model.type.integerValue == 29) {
        DNTextCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DNTextCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    else if (model.type.integerValue == 10) {
        
        DNImageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DNImageCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    else {
        NSString * identifier = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        
        DNVedioCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[DNVedioCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.model = model;
        return cell;
    }
    
}

/**

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
return <#height#>;
}
*/

#pragma mark -- Other Delegate

#pragma mark -- NetWork Methods

- (void)getDataWithType:(NSInteger)type page:(NSInteger)page {
    
    NSString * typeStr = [NSString stringWithFormat:@"%ld",type];
    NSString * pageNum = [NSString stringWithFormat:@"%ld",page];
    NSDictionary * dict = @{@"type":typeStr,
                            @"page":pageNum
                            };
    [NSBaseNetManager POSTRequestWithURL:@"satinApi"
                                   param:dict
                               isNeedSVP:YES
                         completeHandler:^(NSDictionary *dict) {
        
                             if (self.page == 0) {
                                 [self.dataArray removeAllObjects];
                             }
                             
                             for (NSDictionary * dic in dict[@"data"]) {
                                 DNHomeDataModel * model = [DNHomeDataModel mj_objectWithKeyValues:dic];
                                 [self.dataArray addObject:model];
                             }
                             [self.tableView reloadData];
    
                         } faildHandler:^(id data) {
        
    
                         }];
    
    //[self.tableView reloadData];
}

#pragma mark -- Setter && Getter

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
