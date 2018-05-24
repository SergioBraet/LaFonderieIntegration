///Users/sergio.braet/Desktop/LaFonderie/LaFonderie/ViewController.swift
//  ViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 22/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
import Firebase

//bron finger circle gesture: https://github.com/MichMich/XMCircleGestureRecognizer
//bron animatiebibliotheek: https://github.com/AugustRush/Stellar
class ViewController: UIViewController {
    
    var feedbackLabel = UILabel(frame: CGRect.zero)
    var currentValue:CGFloat = 0.0 {
        didSet {
            if (currentValue > 100) {
                currentValue = 100
            }
            if (currentValue < 0) {
                currentValue = 0
            }
        }
    }
    
    @IBOutlet weak var Img: UIImageView!

    

    
   
   
    override func viewDidLoad() {
        /*var animation = animations()
        animation.moveUpDown(distance: 5, speed: 1, image: ImgWiel)*/
        super.viewDidLoad()
        //add gesture recognizer
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
        
        //add feedbackLabel
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feedbackLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        
        feedbackLabel.textAlignment = .center
        feedbackLabel.numberOfLines = 0;
        feedbackLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        feedbackLabel.text = "Perform a gesture here."
        

       // var ref = FIRDatabase.database().reference()
     
        
    }
    
    @objc func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        feedbackLabel.text = ""
        
        if let rotation = recognizer.rotation {
            currentValue += rotation.degrees / 360 * 100
            feedbackLabel.text = feedbackLabel.text! + String(format:"Value: %.2f%%", currentValue)
        }
        
        if let angle = recognizer.angle {
            Img.rotate(angle.degrees).animate()
            feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Angle: %.2f%", angle.degrees)
        }
        
        if let distance = recognizer.distance {
            feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Distance: %.0f%", distance)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
       
            /*.moveX(0).moveY(-50).anchorPoint(CGPoint(x: 1, y: 1)).duration(1).completion({
            print("Second step!")
        })*//*rotate(.pi).attachment(0, frequency: 1).completion({
            print("Third step!")
        })*/
            /*makeSize(CGSize(width: 50, height: 150)).snap(0.3).completion({
            print("First step")
        })*/
            /*.then().moveX(-100).moveY(-50).anchorPoint(CGPoint(x: 1, y: 1)).duration(1).completion({
                print("Second step!")
            })*/
            /*.then()*/
            /*.then().moveY(500).gravity().completion({
                print("last step, all completion")
            })*/
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Rotation(sender: UIRotationGestureRecognizer){
        
    }


}

