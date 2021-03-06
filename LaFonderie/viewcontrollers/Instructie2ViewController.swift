//
//  Instructie2ViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 30/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class Instructie2ViewController: UIViewController {

    @IBAction func hintButton(_ sender: Any) {
        let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "hintView") as! hintViewController
        self.addChildViewController(PopupVC)
        PopupVC.huidigeStap = 2
        PopupVC.view.frame = self.view.frame
        self.view.addSubview(PopupVC.view)
        PopupVC.didMove(toParentViewController: self)
    }
    @IBOutlet var btnStapVoltooid: UIButton!
    @IBOutlet var groteWiel: UIImageView!
    @IBOutlet var kleineWiel: UIImageView!
    var currentValue:CGFloat = 0.0{
        didSet{
            if(currentValue > 100){
                currentValue = 100
            }
            if(currentValue < 0){
                currentValue = 0
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        kleineWiel.isHidden = true
        groteWiel.isHidden = true
        btnStapVoltooid.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        
        
        if let distance = recognizer.distance {
            if(distance < 80){
                recognizer.isEnabled = true
                if let rotation = recognizer.rotation {
                    currentValue += rotation.degrees/360*100
                    kleineWiel.rotate(currentValue).animate()
                  
                    if (currentValue == 100) {
                    self.kleineWiel.rotate(.pi).attachment(0, frequency: 20).animate()
                    self.groteWiel.rotate(.pi).attachment(0, frequency: 20).animate()
                         btnStapVoltooid.isHidden = false
                    }
                }
                
            }else{
                recognizer.isEnabled = false
            }
            
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
      
        kleineWiel.isHidden = false
        groteWiel.isHidden = false
        
        
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.kleineWiel.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
