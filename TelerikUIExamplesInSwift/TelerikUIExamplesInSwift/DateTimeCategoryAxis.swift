//
//  DateTimeCategoryAxis.swift
//  TelerikUIExamplesInSwift
//
//  Copyright (c) 2015 Telerik. All rights reserved.
//

import UIKit

class DateTimeCategoryAxis: TKExamplesExampleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let chart = TKChart(frame:self.view.bounds)
        chart.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleWidth.rawValue | UIViewAutoresizing.FlexibleHeight.rawValue)
        self.view.addSubview(chart)
        
        // >> chart-axis-datetime-cat-swift
        let xAxis = TKChartDateTimeCategoryAxis()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "d MMM"
        xAxis.labelFormatter = formatter
        // << chart-axis-datetime-cat-swift
        
        xAxis.style.majorTickStyle.ticksOffset = -3
        xAxis.style.majorTickStyle.ticksHidden = false
        xAxis.style.majorTickStyle.ticksWidth = 1.5
        xAxis.style.majorTickStyle.ticksFill = TKSolidFill(color:UIColor(red: 203/255.0, green: 203/255.0, blue: 203/255.0, alpha: 1))
        xAxis.style.majorTickStyle.maxTickClippingMode = TKChartAxisClippingMode.Visible
        
        // >> chart-category-plot-swift
        xAxis.setPlotMode(TKChartAxisPlotMode.BetweenTicks)
        // << chart-category-plot-swift
        
        let yAxis = TKChartNumericAxis(minimum:320, andMaximum:360)
        yAxis.majorTickInterval = 20
        
        let series = TKChartCandlestickSeries(items:StockDataPoint.stockPoints(10))
        // >> chart-gap-swift
        series.gapLength = 0.6
        // << chart-gap-swift
        series.xAxis = xAxis
        chart.yAxis = yAxis
        
        chart.addSeries(series)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
