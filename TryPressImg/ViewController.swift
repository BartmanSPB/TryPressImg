//
//  ViewController.swift
//  TryPressImg
//
//  Created by Александр on 01.06.2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var IVCollection: UIImageView!
    @IBOutlet weak var MyImage: UIImageView!
    var MyImage1 = UIImageView()
    var screen = UIScreen()
    var array =  [[Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2))], [Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2))], [Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2))],[Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2))],[Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2)),Int(arc4random_uniform(2))]]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedM))
      
        MyImage1.addGestureRecognizer(tap)
        MyImage1.isUserInteractionEnabled = true

        let imgL = UIImage(named: "lock.png")
        let imgU = UIImage(named: "unlock.png")

        var x = 55
        var y = 55
        
                for i in 0...4 {
                    for j in 0...4 {
                        let newButton = UIButton(frame: CGRect(x: x, y: y, width: 50, height: 50))
                        newButton.backgroundColor = UIColor.white
                        newButton.setTitleColor(UIColor.white, for: UIControlState.normal)
                        newButton.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
                        newButton.titleLabel?.font = UIFont(name: "Arial", size: 10)
                        if array[i][j] == 0 {
                        newButton.setImage(imgU, for: UIControlState.normal)
                            
                        }
                        if array[i][j] == 1  {
                            newButton.setImage(imgL, for: UIControlState.normal)
                            
                        }
                        
                        
                        newButton.tag = (i+1)*10+j+1
                        
                        //print(newButton.tag)
                        self.view.addSubview(newButton)
                        x += 55
                        }
                    
                    x = 55
                    y+=55
                }
        
       
        
    }
    
  
    

    @IBOutlet weak var MyImageAction: UIImageView!
    
    @objc func tappedM()
    {
//        print("Tapped on Image")
//        let img = UIImage(named: "unlock.png")
//        MyImage1.image = img
//        view.addSubview(MyImage)
        
    }
    
   
    
   @objc func buttonTapped(sender: UIButton) -> Void {
        print("\(sender.tag) was tapped!")
    
    let row: Int = Int((String(sender.tag).first?.description)! as String)!

    let coloumn: Int = Int((String(sender.tag).last?.description)! as String)!
    
    
    let imgL = UIImage(named: "lock.png")
    let imgU = UIImage(named: "unlock.png")

    print("TEST---------------------")
    
    for i in 0...4 {
        for j in 0...4 {
            
            if array[i][j] == 0 {
                
                array[row-1][j] = 1
                array[i][coloumn-1] = 1
                sender.setImage(imgL, for: UIControlState.normal)
                self.view.addSubview(sender)
                
                
            }
            if array[i][j] == 1 {
                
                array[row-1][j] = 0
                array[i][coloumn-1] = 0
                sender.setImage(imgU, for: UIControlState.normal)
                self.view.addSubview(sender)
                
                                
            }
           
            self.view.addSubview(sender)
        }
        self.view.addSubview(sender)
    }
    viewDidLoad()
    
    
    
    }

}


