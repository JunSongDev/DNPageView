# 分页控件    
### 一、总体结构    
       使用两个 ScrollView 来分别装载按钮和控制器    
### 二、使用    
        1. 手动下载，将 DNPageView 文件夹拖入项目工程
        2. pod 'DNPageView'    
### 三、具体使用代码    
       1. 导入头文件 .... #import "DNPageView.h"    
       2. <pre><code> [self.view addSubview:pageView];
    pageView.selectColor = UIColor.cyanColor;
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(self.view);
    }];    
    </code></pre>    
### 四、Demo API 来源    
       [简书:有梦想的程序丶猿（免费开放接口API）](https://www.jianshu.com/p/e6f072839282)