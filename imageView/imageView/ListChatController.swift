//
//  ListChatController.swift
//  imageView
//
//  Created by Tarik Daouine on 07/08/2019.
//  Copyright © 2019 Tarik Daouine. All rights reserved.
//

import UIKit

class Message  {
    let destinataire : String
    let message : String
    let photo : UIImage
    
    init(from desti: String,_ mess:String, photo: UIImage) {
        self.destinataire = desti
        self.message = mess
        self.photo = photo
    }
    
}

class ListChatController: UITableViewController {

    let data:[Message] = [Message(from: "Pierre", "coucou", photo:UIImage(named: "gens3")! ), Message(from: "Camille", "fais tu du foot?", photo: UIImage(named: "gens1")!),
                          Message(from: "Lyan", "samedi,14H , foot ? ", photo: UIImage(named: "gens2")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessageCell
        cell.destiLabel.text = data[indexPath.row].destinataire
        cell.messageLabel.text = data[indexPath.row].message
        cell.photoView.image = data[indexPath.row].photo
        return cell
    }
    

  
}
