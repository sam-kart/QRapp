//
//  PrivatePolicyViewController.swift
//  Linkd
//
//  Created by Macbook Pro 15 on 11/29/22.
//

import UIKit

class PrivatePolicyViewController: UIViewController {

    @IBOutlet weak var privacyPolicyTitle: UILabel!
    @IBOutlet weak var privacyPolicy: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        privacyPolicy.isEditable = false
        privacyPolicy.isScrollEnabled = true
        privacyPolicy.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if lightingMode == "Dark"{
            view.overrideUserInterfaceStyle = .dark
        }
        else if lightingMode == "Light"{
            view.overrideUserInterfaceStyle = .light
        }
        else{
            view.overrideUserInterfaceStyle = .light
        }
        
        if defaultFont == "Roboto"{
            privacyPolicy.font = UIFont(name: "Roboto", size: 16)
            privacyPolicyTitle.font = UIFont(name: "Roboto", size: 16)
        }
        if defaultFont == "Arial"{
            privacyPolicy.font = UIFont(name: "Arial", size: 16)
            privacyPolicyTitle.font = UIFont(name: "Arial", size: 16)
        }
        if defaultFont == "TimesNewRomanPSMT"{
            privacyPolicy.font = UIFont(name: "TimesNewRomanPSMT", size: 16)
            privacyPolicyTitle.font = UIFont(name: "TimesNewRomanPSMT", size: 16)
        }
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
