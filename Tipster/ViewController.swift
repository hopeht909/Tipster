//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipSLider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var percentageA: UILabel!
    @IBOutlet weak var percentageB: UILabel!
    @IBOutlet weak var percentageC: UILabel!
    @IBOutlet weak var resultA: UILabel!
    @IBOutlet weak var resultB: UILabel!
    @IBOutlet weak var resultC: UILabel!
    @IBOutlet weak var valueA: UILabel!
    @IBOutlet weak var valueB: UILabel!
    @IBOutlet weak var valueC: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    var TheValue : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        TheValue = ""
        valueLabel.text = ""
    }
    func addToValue(value: String ){
        TheValue = TheValue + value
        valueLabel.text = TheValue
        calculation()
    }
    
    func calculation(){
        
        let totalValue = Float(valueLabel.text ?? "0")!
        let percentageA = Float((percentageA.text?.split(separator: "%")[0])!)! / 100
        let percentageB = Float((percentageB.text?.split(separator: "%")[0])!)! / 100
        let percentageC = Float((percentageC.text?.split(separator: "%")[0])!)! / 100
        let groupNumber = groupSlider.value.rounded()
        
        resultA.text = String(format: "%.2f", (totalValue * percentageA / groupNumber))
        resultB.text = String(format: "%.2f", (totalValue * percentageB / groupNumber))
        resultC.text = String(format: "%.2f", (totalValue * percentageC / groupNumber))
        
        valueA.text = String(format: "%.2f", (totalValue * percentageA + totalValue) / groupNumber)
        valueB.text = String(format: "%.2f", (totalValue * percentageB + totalValue) / groupNumber )
        valueC.text = String(format: "%.2f", (totalValue * percentageC + totalValue) / groupNumber )
        }
    
    @IBAction func numbersTap(_ sender: UIButton) {
        addToValue(value: String(sender.tag))
    }
    
    @IBAction func allClearTap(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func decimalTap(_ sender: UIButton) {
        addToValue(value: ".")
    }
    
    @IBAction func tipSliderAction(_ sender: UISlider) {
        
        percentageA.text = "\(Int((tipSLider.value)))%"
        percentageB.text = "\(Int((tipSLider.value) + 5))%"
        percentageC.text = "\(Int((tipSLider.value) + 10))%"
        calculation()
    }
    
    @IBAction func groupSliderAction(_ sender: UISlider) {
        groupLabel.text = "Group Size: \(Int(groupSlider.value))"
        calculation()
    }
}

