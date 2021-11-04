
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    var tipAmount: Float = 0.0
    var totalTip = "0.0"
    var tipPerPerson = "0.0"
    var splitNum = "0"

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPercentButton {
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
        } else if sender == tenPercentButton {
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
        } else if sender == twentyPercentButton {
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Float(billTextField.text ?? "0")
        splitNum = splitNumberLabel.text ?? "1"
        let splitNumLocal = Float(splitNumberLabel.text ?? "1")
        
        if zeroPercentButton.isSelected {
            tipAmount = 0.0
        } else if tenPercentButton.isSelected {
            tipAmount = 0.1
            print(tipAmount)
        } else if twentyPercentButton.isSelected {
            tipAmount = 0.2
            print(tipAmount)
        }
        totalTip = String(format: "%.2f", billTotal! * tipAmount)
        tipPerPerson = String(format: "%.2f", (billTotal! * tipAmount) / splitNumLocal!)
        self.performSegue(withIdentifier: "goToResult", sender: self)    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitNum = splitNum
            destinationVC.tipPerPerson = tipPerPerson
            destinationVC.tipPercent = String(Int(tipAmount * 100))
        }
    }
}

