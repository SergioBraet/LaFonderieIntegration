//
//  Instructie3ViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 30/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class Instructie3ViewController: UIViewController {


    @IBAction func hintButton(_ sender: Any) {
        let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "hintView") as! hintViewController
        self.addChildViewController(PopupVC)
        PopupVC.huidigeStap = 3
        PopupVC.view.frame = self.view.frame
        self.view.addSubview(PopupVC.view)
        PopupVC.didMove(toParentViewController: self)
    }
    
    @IBOutlet var zaagblad: UIImageView!
    @IBOutlet var ondersteWiel: UIImageView!
    @IBOutlet var bovensteWiel: UIImageView!
    @IBOutlet var band: UIImageView!
    @IBOutlet var groteWiel: UIImageView!
    @IBOutlet var kleineWiel: UIImageView!

    var countTouches:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        kleineWiel.rotate(.pi).attachment(0,frequency: 20).animate()
        groteWiel.rotate(.pi).attachment(0,frequency: 20).animate()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if(countTouches < 1){
             band.moveX(-10).moveY(-2).animate()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                self.bovensteWiel.rotate(.pi).attachment(0,frequency: 20).animate()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                self.ondersteWiel.rotate(.pi).attachment(0,frequency: 20).animate()
                    self.zaagblad.moveY(5).then().moveY(-5).attachment(0,frequency: 20).animate()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000), execute: {
                let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "PopupViewVoltooid") as! PopupVoltooidViewController
                self.addChildViewController(PopupVC)
                PopupVC.view.frame = self.view.frame
                self.view.addSubview(PopupVC.view)
                PopupVC.didMove(toParentViewController: self)
            })
        
        }
        countTouches += 1
       
        
        
        
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
