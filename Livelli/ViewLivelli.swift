//
//  ViewLivelli.swift
//  Game Therapy
//
//  Created by Caliendo Gianluca on 17/05/2019.
//  Copyright © 2019 iOSFoundation. All rights reserved.
//

import UIKit

class ViewLivelli: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let items = ["tutorial","1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let level = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        if level.accessibilityElementIsFocused() {
            level.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        
        
        //Label nel livello
        level.myLabel.text = items[indexPath.item]
        if level.isSelected {
            level.layer.borderColor = UIColor.black.cgColor
            level.layer.cornerRadius = 10
            level.layer.borderWidth = 1
            level.isSelected = true
            
        }else {
            level.layer.borderColor = UIColor.black.cgColor
            level.layer.cornerRadius = 10
            level.layer.borderWidth = 1
            level.isSelected = true
        }
        

        
        return level
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: "tutorial", sender: nil)
        case 1:
            print("Accesso a livello 2")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        case 2:
            print("Accesso a livello 3")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        case 3:
            print("Accesso a livello 4")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        case 4:
            print("Accesso a livello 5")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        case 5:
            print("Accesso a livello 6")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        default:
            print("Accesso a ultimo livello giocato")
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            cell?.isSelected = false
        }
        
    }

}
