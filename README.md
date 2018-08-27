# 分页控件    
### 一、总体结构    
       使用两个 ScrollView 来分别装载按钮和控制器    
### 二、使用    
        1. 手动下载，将 DNPageView 文件夹拖入项目工程
        2. pod 'DNPageView'    
### 三、具体使用代码    
       1. 导入头文件 .... #import "DNPageView.h"    
       2. 分别传入标题数组和控制器数组
       DNPageView * pageView = [[DNPageView alloc] initWithTitle:[self segmentTitleArray]
                                                   controller:[self controllersArray]];
       [self.view addSubview:pageView];
       pageView.selectColor = UIColor.cyanColor;
       [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
              make.edges.mas_equalTo(self.view);
       }];   
     
### 四、Demo API 来源    
       [免费API](https://www.jianshu.com/p/e6f072839282)
