//
//  ShareVC.swift
//  Linkd
//
//  Created by Sam Kartiganer on 11/30/22.
//

import UIKit
import CoreData
protocol Reloader {
    func reload()
}

class ShareVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Reloader {
    
    
    let cellIdent = "MyCell"
    
    var images: [UIImage] = []
    
    var names: [String] = []
    
    var sentover = 0


    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let fetchedResults = retrieveQR()
        images = []
        
        for QR in fetchedResults {
            if let QRdata = QR.value(forKey: "storedImage") as? Data {
                if let QRname = QR.value(forKey: "name") as? String{
                    let imageMake = UIImage(data: QRdata)!
                    images.append(imageMake)
                }
            }
        }

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdent, for: indexPath) as! CollectionViewCell
        cell.img.image = self.images[indexPath.row]
        return cell
    }
    func retrieveQR() -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "QRcode")
        var fetchedResults:[NSManagedObject]? = nil
        

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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = UICollectionViewFlowLayout()
        let containWidth = collectionView.bounds.width
        let cellSize = containWidth / 3
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue",
           let nextVC = segue.destination as? ImageView {
            nextVC.daimage = images[sentover]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
        collectionView.reloadData()
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
    func reload() {
        collectionView.reloadData()

    }
}
