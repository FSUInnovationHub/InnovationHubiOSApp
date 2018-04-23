//
//  ReserveEquipment.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 2/12/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit

class ReserveEquipment: UIViewController {

    @IBOutlet var returnButton: UIButton!
    
    @IBOutlet var eqtCollectionView: UICollectionView!
    var eqt = ["3D Printer", "Hacking Space", "Circuit Boards", "Virtual Reality","Design Computers","Film Camera"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eqtCollectionView.delegate = self
        eqtCollectionView.dataSource = self

        //return button rounded
        returnButton.layer.borderWidth = 2
        returnButton.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        returnButton.layer.cornerRadius = 15
        
    }

}


extension ReserveEquipment: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eqt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eqtCell", for: indexPath) as! eqtCell

        cell.image.image = #imageLiteral(resourceName: "splash8")
        
        if eqt[indexPath.row] == "3D Printer"{
            cell.image.image = UIImage(named: "3DPrintingIcon")
        }else if eqt[indexPath.row] == "Hacking Space"{
            cell.image.image = #imageLiteral(resourceName: "HackingIcon")
        }else if eqt[indexPath.row] == "Virtual Reality"{
            cell.image.image = #imageLiteral(resourceName: "VRIcon")
        }else if eqt[indexPath.row] == "Design Computers"{
            cell.image.image = #imageLiteral(resourceName: "DesignComputer")
        }else if eqt[indexPath.row] == "Film Camera"{
            cell.image.image = #imageLiteral(resourceName: "filmCameraIcon")
        }else if eqt[indexPath.row] == "Circuit Boards"{
            cell.image.image = #imageLiteral(resourceName: "circuitsIcon")
        }
        cell.eqtTitle.text = eqt[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(eqt[indexPath.row])
    }
    
}


class eqtCell: UICollectionViewCell{
    
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var eqtTitle: UILabel!
    
    
}
