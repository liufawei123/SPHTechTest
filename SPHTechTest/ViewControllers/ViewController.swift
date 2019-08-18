//
//  ViewController.swift
//  SPHTechTest
//
//  Created by yuanchun tang on 18/8/2019.
//

import UIKit
import Charts

class ViewController: UIViewController {
    var chartView: LineChartView!
    var records = [MobileDataModel]()
    @IBOutlet weak var safeView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dataLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView = LineChartView(frame: safeView.bounds)
        safeView.addSubview(chartView)
        chartView.delegate = self
        chartView.xAxis.valueFormatter = self
        
        chartView.rightAxis.enabled = false
    
        dataManagerInstance.getModesl { (models, error) in
            guard let models = models else {return}
            self.records = models

            var yVals1 = [ChartDataEntry]()
            for (index, item) in self.records.enumerated() {
                yVals1.append(ChartDataEntry(x: Double(index), y: Double((item.volumeOfMobileData! as NSString).floatValue * 100)))
            }

            let chartDataSet = LineChartDataSet(entries: yVals1, label: "Mobile Data Usage")
            chartDataSet.axisDependency = .left
            chartDataSet.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
            chartDataSet.lineWidth = 2
            chartDataSet.circleRadius = 3
            chartDataSet.circleColors = [UIColor.blue, UIColor.red]
            chartDataSet.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
            chartDataSet.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
            chartDataSet.drawCircleHoleEnabled = true

            let data = LineChartData(dataSets: [chartDataSet])
            data.setValueTextColor(.white)
            data.setValueFont(.systemFont(ofSize: 9))

            self.chartView.data = data
            self.chartView.animate(xAxisDuration: 2.5)
        }
//        apiManagerInstance.datastoreSearch("a807b7ab-6cad-4aa6-87d0-e283a7353a0f", 20) { (data, error) in
//            guard let records = data?.result.records else {return}
//            self.records = records
//            
//            var yVals1 = [ChartDataEntry]()
//            for (index, item)in records.enumerated() {
//                yVals1.append(ChartDataEntry(x: Double(index), y: Double((item.volumeOfMobileData as NSString).floatValue * 100)))
//            }
//            
//            let chartDataSet = LineChartDataSet(entries: yVals1, label: "Mobile Data Usage")
//            chartDataSet.axisDependency = .left
//            chartDataSet.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
//            chartDataSet.lineWidth = 2
//            chartDataSet.circleRadius = 3
//            chartDataSet.circleColors = [UIColor.blue, UIColor.red]
//            chartDataSet.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
//            chartDataSet.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
//            chartDataSet.drawCircleHoleEnabled = true
//            
//            let data = LineChartData(dataSets: [chartDataSet])
//            data.setValueTextColor(.white)
//            data.setValueFont(.systemFont(ofSize: 9))
//            
//            self.chartView.data = data
//            self.chartView.animate(xAxisDuration: 2.5)
//        }
    }
    
}
extension ViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return self.records[Int(value)].quarter ?? ""
    }
}
extension ViewController: ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let record = records[Int(entry.x)]
        self.dataLbl.text = record.volumeOfMobileData
        self.timeLbl.text = record.quarter
    }
    
    /// Called when a user stops panning between values on the chart
    func chartViewDidEndPanning(_ chartView: ChartViewBase) {
        
    }
    
    // Called when nothing has been selected or an "un-select" has been made.
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        
    }
    
    // Callbacks when the chart is scaled / zoomed via pinch zoom gesture.
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        
    }
    
    // Callbacks when the chart is moved / translated via drag gesture.
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        
    }
    
    // Callbacks when Animator stops animating
    func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator) {
        
    }
}
