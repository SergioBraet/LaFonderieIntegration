//
//  Instructie3ViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 30/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class Instructie3ViewController: UIViewController {


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
            bovensteWiel.rotate(.pi).attachment(0,frequency: 20).animate()
            ondersteWiel.rotate(.pi).attachment(0,frequency: 20).animate()
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
