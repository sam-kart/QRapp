//
//  The2ndVCthatImClulessAbout.swift
//  Linkd
//
//  Created by Sam Kartiganer on 11/29/22.
//

import UIKit
import CoreData


class The2ndVCthatImClulessAbout: UIViewController {
    
    @IBOutlet var UIIMAGE: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var QRdata: Data?
        
        let fetchedResults = retrieveQR()
        
        for QR in fetchedResults {
            QRdata = QR.value(forKey: "storedImage") as? Data
        }
        let letssee = UIImage(data: QRdata!)
        UIIMAGE.image = letssee
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
    
    func retrieveQR() -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "QRcode")
        var fetchedResults:[NSManagedObject]? = nil
        
//        let predicate = NSPredicate(format: "name CONTAINS[c] 'ie'")
//        request.predicate = predicate
        
        do {
            try fetchedResults = context.fetch(request) as? [NSManagedObject]
        } catch {
            // if an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        return(fetchedResults)!
        
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
    


}
