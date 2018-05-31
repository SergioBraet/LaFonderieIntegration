//
//  hintViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 31/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class hintViewController: UIViewController {

    @IBAction func Button(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBOutlet var tekstView: UIView!
    @IBOutlet var tekst: UILabel!
    var huidigeStap:Int?
    override func viewDidLoad() {        
        super.viewDidLoad()
        tekstView.layer.borderWidth = 1
        tekstView.layer.cornerRadius = 10
        tekstView.layer.borderColor = UIColor(red:0.25, green:0.35, blue:0.40, alpha:1.0).cgColor
         self.view.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0)
        if huidigeStap == 1{
            self.tekst.text = "Zet de geleiders op de juiste plaats, Draai deze zo dicht mogelijk bij het zaagblad zodat deze mooi op zijn plaats blijft."
        }else if huidigeStap == 2{
            self.tekst.text = "Nu moet je proberen om het kleine wiel laten draaien om de motor aan te zetten."
        }else if huidigeStap == 3{
            self.tekst.text = "Sleep de bruine band naar links om de machine in gang te zettten."
        }else{
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
