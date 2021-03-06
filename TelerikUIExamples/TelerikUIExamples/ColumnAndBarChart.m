//
//  TelerikUIExamples
//
//  Copyright (c) 2013 Telerik. All rights reserved.
//

#import "ColumnAndBarChart.h"
#import <TelerikUI/TelerikUI.h>

@implementation ColumnAndBarChart
{
    TKChart *_chart;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self addOption:@"Column" selector:@selector(columnSelected)];
        [self addOption:@"Bar" selector:@selector(barSelected)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    _chart = [[TKChart alloc] initWithFrame:self.view.bounds];
    _chart.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _chart.allowAnimations = YES;
    [self.view addSubview:_chart];
    [self columnSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)columnSelected
{
   [_chart removeAllData];
    
    // >> chart-column
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i<8; i++) {
        [array addObject:[[TKChartDataPoint alloc] initWithX:@(i+1) Y:@(arc4random() % 100)]];
    }
    
    TKChartColumnSeries *series = [[TKChartColumnSeries alloc] initWithItems:array];
    series.style.paletteMode = TKChartSeriesStylePaletteModeUseItemIndex;
    series.selection = TKChartSeriesSelectionDataPoint;
    
    // >> chart-width-cl
    series.maxColumnWidth = @50;
    series.minColumnWidth = @20;
    // << chart-width-cl
    
    [_chart addSeries:series];
    // << chart-column
    
    [_chart reloadData];
}

- (void)barSelected
{
    [_chart removeAllData];
    
    // >> chart-bar
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i<8; i++) {
        [array addObject:[[TKChartDataPoint alloc] initWithX:@(arc4random() % 100) Y:@(i+1)]];
    }
    
    TKChartSeries *series = [[TKChartBarSeries alloc] initWithItems:array];
    series.style.paletteMode = TKChartSeriesStylePaletteModeUseItemIndex;
    series.selection = TKChartSeriesSelectionDataPoint;
    [_chart addSeries:series];
    // << chart-bar
    [_chart reloadData];
}

@end
