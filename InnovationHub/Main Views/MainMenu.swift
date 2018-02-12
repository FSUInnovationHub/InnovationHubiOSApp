//
//  FirstViewController.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 1/21/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {

    @IBOutlet var mainMenuTableView: UITableView!
    var menuOptions = ["Book a Room", "Ask for Assistance","Reserve Equipment","Learn More"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuTableView.delegate = self
        mainMenuTableView.dataSource = self
    }

    @IBAction func returnToMainView(unwindSegue: UIStoryboardSegue) {
        
    }

}

extension MainMenu: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height/CGFloat(menuOptions.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuOptions") as! mainMenuOptionCell
        
        cell.menuOptionText!.text = menuOptions[indexPath.row]
        
        
        if cell.menuOptionText!.text == "Book a Room"{
            cell.backgroundImage!.image = #imageLiteral(resourceName: "feature_hacking")
        }else if cell.menuOptionText!.text == "Ask for Assistance"{
            cell.backgroundImage!.image = #imageLiteral(resourceName: "splash8")
        }else if cell.menuOptionText!.text == "Reserve Equipment"{
            cell.backgroundImage!.image = #imageLiteral(resourceName: "feature_makerspace")
        }else if cell.menuOptionText!.text == "Learn More"{
            cell.backgroundImage!.image = #imageLiteral(resourceName: "feature_colab_tech")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if menuOptions[indexPath.row] == "Book a Room"{
            //display book a room view
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "bookARoom")
            self.present(vc!, animated: true, completion: nil)
            
        }else if menuOptions[indexPath.row] == "Ask for Assistance"{
            //display supervisor request view
            //display book a room view
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "askForAssitance")
            self.present(vc!, animated: true, completion: nil)
        }else if menuOptions[indexPath.row] == "Reserve Equipment"{
            //display reserve equipment View
        }else if menuOptions[indexPath.row] == "Learn More"{
            //display learn more view
            
        }
    }
    
   
}

class mainMenuOptionCell: UITableViewCell{
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var imageFilter: UIView!
    @IBOutlet var menuOptionText: UILabel!
}
