//
//  ViewController.swift
//  imageView
//
//  Created by Tarik Daouine on 02/08/2019.
//  Copyright © 2019 Tarik Daouine. All rights reserved.
//

import UIKit
struct Profile {
    let name: String
    let picture : UIImage?
    }

class ViewController: UIViewController {

    let card = [Profile(name: "Camille", picture: UIImage(named: "gens1")),
                Profile(name: "Kevin", picture: UIImage(named: "Kevin")),
                Profile(name: "Lyan", picture: UIImage(named: "gens2")),
                Profile(name: "Tarik", picture: UIImage(named: "Profile"))]
    
    var cardIndex = 0
    
    
    @IBOutlet var customView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var thumbsView: UIImageView!
    
    var diviseur: CGFloat!
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       diviseur = (view.frame.width / 2) / 0.4
       
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(gestureAction(sender:)))
        gesture.maximumNumberOfTouches = 1
        gesture.minimumNumberOfTouches = 1
        imageView.addGestureRecognizer(gesture)
        
        profileView.layer.cornerRadius = 16
        imageView.layer.cornerRadius = 16
    }
    @objc
    func gestureAction(sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: self.imageView)
    let xFromcenter = imageView.center.x - view.center.x
        
        
        
        
        imageView.center = CGPoint(x: imageView.center.x + translation.x, y: imageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.imageView)
        
       
        imageView.transform = CGAffineTransform(rotationAngle: xFromcenter/diviseur )
        
        if xFromcenter > 0 {
        thumbsView.image = #imageLiteral(resourceName: "heart-2")
        thumbsView.tintColor = UIColor.green
        } else {
            thumbsView.image = #imageLiteral(resourceName: "close")
        thumbsView.tintColor = UIColor.red
        }
        
        thumbsView.alpha = abs(xFromcenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
        
            if imageView.center.x < 75 {
           // sort coter gauche
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageView.center = CGPoint(x: self.imageView.center.x - 200, y: self.imageView.center.y + 75)
                    self.imageView.alpha = 0
                }) { [weak self] _ in
                self?.nextImage()
                }
                   return
            } else if imageView.center.x > (view.frame.width - 75) {
                // sort coter droit
                UIView.animate(withDuration: 0.3, animations: {
                self.imageView.center = CGPoint(x: self.imageView.center.x + 200, y: self.imageView.center.y + 75)
                self.imageView.alpha = 0
                }) { [weak self] _ in
                    self?.nextImage()
                }
               return
            }
       
        
          resetImageView()
   
        }
    }
    
    func nextImage() {
        imageView.center = self.view.center
        thumbsView.alpha = 0
        imageView.alpha = 1
        imageView.transform = CGAffineTransform.identity
        profileView.image = card[cardIndex].picture
        profileLabel.text = card[cardIndex].name
        cardIndex += 1
        if cardIndex >= card.count{
            cardIndex = 0
        }
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
      resetImageView()
    }
    func resetImageView() {
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.center = self.view.center
                self.thumbsView.alpha = 0
                self.imageView.alpha = 1
                self.imageView.transform = CGAffineTransform.identity
            })
        }
    }
		
            

    







