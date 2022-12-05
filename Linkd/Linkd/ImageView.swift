//
//  ImageView.swift
//  Linkd
//
//  Created by Sam Kartiganer on 12/4/22.
//

import UIKit

class ImageView: UIViewController {

    @IBOutlet var image: UIImageView!
    var daimage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = daimage
    }



}
