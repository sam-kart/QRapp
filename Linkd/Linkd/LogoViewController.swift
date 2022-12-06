//
//  LogoViewController.swift
//  Linkd
//
//  Created by Rishabh Shah on 12/1/22.
//

import UIKit

class LogoViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!

    @IBAction func spinLogo(_ sender: Any) {
        let durationValue = 2.0
        UIView.animate(
            withDuration: durationValue,
            animations: {
                // 180 degree rotation
                self.mainImage.transform =
                self.mainImage.transform.rotated(by: CGFloat(Double.pi))
                }
        )
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(named: "linkd-long-logo")
        mainImage.image = image
    }
}
