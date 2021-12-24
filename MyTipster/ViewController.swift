//
//  ViewController.swift
//  MyTipster
//
//  Created by admin on 23/12/2021.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    
    @IBOutlet weak var percentage1: UILabel!
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var total1: UILabel!
    
    
    @IBOutlet weak var percentage2: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var total2: UILabel!
    
    @IBOutlet weak var percentage3: UILabel!
    @IBOutlet weak var tip3: UILabel!
    @IBOutlet weak var total3: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    @IBOutlet weak var groupSizeLbl: UILabel!
    
    
    var totalBill: Float = 0.0
    var totalBillString: String = ""
    var groupSize: Int = 1
    var senderValue: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLbl.text = "0.00"
    }


    @IBAction func nine(_ sender: UIButton) {
        totalBillString += "9"
        totalLbl.text = totalBillString
    }
    @IBAction func eight(_ sender: UIButton) {
        totalBillString += "8"
        totalLbl.text = totalBillString
    }
    @IBAction func seven(_ sender: UIButton) {
        totalBillString += "7"
        totalLbl.text = totalBillString
    }
    @IBAction func six(_ sender: UIButton) {
        totalBillString += "6"
        totalLbl.text = totalBillString
    }
    @IBAction func five(_ sender: UIButton) {
        totalBillString += "5"
        totalLbl.text = totalBillString
    }
    @IBAction func four(_ sender: UIButton) {
        totalBillString += "4"
        totalLbl.text = totalBillString
    }
    @IBAction func three(_ sender: UIButton) {
        totalBillString += "3"
        totalLbl.text = totalBillString
    }
    @IBAction func two(_ sender: UIButton) {
        totalBillString += "2"
        totalLbl.text = totalBillString
    }
    @IBAction func one(_ sender: UIButton) {
        totalBillString += "1"
        totalLbl.text = totalBillString
    }
    @IBAction func zero(_ sender: UIButton) {
        totalBillString += "0"
        totalLbl.text = totalBillString
    }
    @IBAction func dot(_ sender: UIButton) {
        totalBillString += "."
        totalLbl.text = totalBillString
    }
    @IBAction func resetClear(_ sender: UIButton) {
        totalLbl.text = "0.00"
        totalBillString = ""
        totalBill = 0.0
        totalBillString = ""
        groupSize = 1
        senderValue = 0.0
        tip1.text = "0"
        total1.text = "0"
        tip2.text = "0"
        total2.text = "0"
        tip3.text = "0"
        total3.text = "0"
    }
    
    @IBAction func tipSliderChange(_ sender: UISlider) {
        percentage1.text = String(format: "%.2f", ((sender.value + 0.05) * 100)) + "%"
        percentage2.text = String(format: "%.2f", ((sender.value + 0.15) * 100)) + "%"
        percentage3.text = String(format: "%.2f", ((sender.value + 0.2) * 100)) + "%"
        
        senderValue = sender.value
        calculateTotal(total: sender.value)
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupSizeLbl.text = "Group Size: \(Int(sender.value.rounded()))"
        groupSize = Int(sender.value.rounded())
        calculateTotal(total: senderValue)
    }
    
    
    func calculateTotal(total: Float){
        if let billFloat = Float(totalBillString){
            totalBill = billFloat
            
            let first = (totalBill * (total + 0.05)) / Float(groupSize)
            tip1.text = String(format: "%.2f", first)
            total1.text = String(format: "%.2f", (totalBill + first))
            
            let second = (totalBill * (total + 0.15)) / Float(groupSize)
            tip2.text = String(format: "%.2f", second)
            total2.text = String(format: "%.2f", (totalBill + second))
            
            let third = (totalBill * (total + 0.2)) / Float(groupSize)
            tip3.text = String(format: "%.2f", third)
            total3.text = String(format: "%.2f", (totalBill + third))
            
        }
    }
}

