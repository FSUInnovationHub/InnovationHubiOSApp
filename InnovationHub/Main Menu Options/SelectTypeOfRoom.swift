//
//  SelectTypeOfRoom.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 2/26/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit


var typeofRoomAddition = String()

class SelectTypeOfRoom: UIViewController {

    
    @IBOutlet var returnButton: UIButton!
    var typesOfRooms = ["STUDY ROOM", "PROGRAM ROOM", "COMMONS"]
    
    @IBOutlet var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomsTableView.delegate = self
        roomsTableView.dataSource = self
        
        //return button rounded
        returnButton.layer.borderWidth = 2
        returnButton.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        returnButton.layer.cornerRadius = 15
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let index = self.roomsTableView.indexPathForSelectedRow{
            roomsTableView.deselectRow(at: index, animated: true)
        }
        
    }
    
    
    
    
    @IBAction func returnToRoomSelection(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    


}



extension SelectTypeOfRoom: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.bounds.height/CGFloat(typesOfRooms.count))-CGFloat(20)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return typesOfRooms.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        //footer.bounds.height = footer.bounds.height-CGFloat(10)
        footer.frame = CGRect(x: footer.bounds.midX, y: footer.bounds.midY, width: footer.bounds.width, height: footer.bounds.height-CGFloat(10))
        footer.isHidden = true
        return footer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeofRoom") as! roomTypesCell
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        
        
        cell.roomLabel.text = typesOfRooms[indexPath.section]
        if cell.roomLabel.text == "STUDY ROOM"{
            cell.roomBGImage.image = #imageLiteral(resourceName: "study_room")
        }
        else if cell.roomLabel.text == "PROGRAM ROOM"{
            cell.roomBGImage.image = #imageLiteral(resourceName: "program_room")
            
        }
        else if cell.roomLabel.text == "COMMONS"{
            cell.roomBGImage.image = #imageLiteral(resourceName: "commons")
        }
        
        cell.layer.borderWidth = 3.5
        cell.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        cell.imageFilter.alpha = 0.40
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if typesOfRooms[indexPath.section] == "STUDY ROOM"{
            bookingRoute = websiteURL + "hub_study_rooms"
            
        }
        else if typesOfRooms[indexPath.section] == "PROGRAM ROOM"{
           
            bookingRoute = websiteURL + "hub_program_rooms"
            
        }
        else if typesOfRooms[indexPath.section] == "COMMONS"{
            
             bookingRoute = websiteURL + "hub_commons"
           
        }

        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "bookARoom")
        self.present(vc!, animated: true, completion: nil)
    
    }
   
}





class roomTypesCell: UITableViewCell{
    @IBOutlet var roomBGImage: UIImageView!
    @IBOutlet var roomLabel: UILabel!
    @IBOutlet var imageFilter: UIView!
}
