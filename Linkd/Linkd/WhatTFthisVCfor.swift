//
//  WhatTFthisVCfor.swift
//  Linkd
//
//  Created by Sam Kartiganer on 11/29/22.
//

import UIKit
import CoreData



class WhatTFthisVCfor: UIViewController {

    
    @IBOutlet var textstuff: UITextField!
    
    @IBOutlet var theImage: UIImageView!
    var delegate = ShareVC()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if lightingMode == "Dark"{
            view.overrideUserInterfaceStyle = .dark
        }
        if lightingMode == "Light"{
            view.overrideUserInterfaceStyle = .light
        }
        else{
            view.overrideUserInterfaceStyle = .light
        }

    }
    @IBAction func ButtonPressed(_ sender: Any) {
        let enterdText = textstuff.text
        self.theImage.image = nil
        let imagee = generateQRCode(from: "\(enterdText ?? "www.google.com")")
        self.theImage.image = imagee
        let pngImageData = imagee?.pngData()
        let QR = NSEntityDescription.insertNewObject(forEntityName: "QRcode", into: context)
        QR.setValue(pngImageData, forKey: "storedImage")
        QR.setValue(enterdText, forKey: "name")

        //ShareVC().collectionView.reloadData()
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
    }
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        let context = CIContext()

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                if let retImg = context.createCGImage(output, from: output.extent) {
                    return UIImage(cgImage: retImg)
                }
            }
        }
        return nil
    }

}
