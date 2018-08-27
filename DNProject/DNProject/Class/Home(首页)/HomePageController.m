//
//  HomePageController.m
//  DNProject
//
//  Created by zjs on 2018/8/21.
//  Copyright © 2018年 zjs. All rights reserved.
//

#import "HomePageController.h"
#import "DNPageView.h"
#import "PageListController.h"

@interface HomePageController ()

@end

@implementation HomePageController

#pragma mark -- LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self setControlForSuper];
    // Do any additional setup after loading the view.
}

/**

- (void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:animated];
}

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

- (NSArray *)segmentTitleArray {
    
    return @[@"全部",@"文字",@"图片",@"视频"];
}

- (NSArray *)controllersArray {
    
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < [self segmentTitleArray].count; i ++) {
        
        PageListController * pageController = [[PageListController alloc] init];
        pageController.type = i+1;
        [array addObject:pageController];
    }
    return array;
}

#pragma mark -- SetControlForSuper
- (void)setControlForSuper {
    
    DNPageView * pageView = [[DNPageView alloc] initWithTitle:[self segmentTitleArray]
                                                   controller:[self controllersArray]];
    [self.view addSubview:pageView];
    pageView.selectColor = UIColor.cyanColor;
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark -- AddConstrainsForSuper
- (void)addConstrainsForSuper {

}

#pragma mark -- Target Methods

#pragma mark -- Private Methods

#pragma mark -- UITableView Delegate && DataSource

/**

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
return <#section#>;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
return <#row#>;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
return <# UITableViewCell #>;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
return <#height#>;
}
*/

#pragma mark -- Other Delegate

#pragma mark -- NetWork Methods

#pragma mark -- Setter && Getter

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
