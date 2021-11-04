//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Cam Riemensnider on 11/4/21.
//  Copyright © 2021 Cam Dresie. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var tipPerPerson: String?
    var splitNum: String?
    var tipPercent: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = tipPerPerson
        if Int(splitNum!)! > 1 {
            settingsLabel.text = "Split between \(splitNum!) people, with \(tipPercent!)% tip."
        } else {
            settingsLabel.text = "Paying the tip alone with a \(tipPercent!)% tip."
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
