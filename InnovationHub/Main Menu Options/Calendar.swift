//
//  Calendar.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 2/12/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit

class Calendar: UIViewController {

    @IBOutlet var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //return button rounded
        returnButton.layer.borderWidth = 2
        returnButton.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        returnButton.layer.cornerRadius = 15
    }
}

