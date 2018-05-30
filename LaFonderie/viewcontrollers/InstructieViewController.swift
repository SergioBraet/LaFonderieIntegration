//
//  InstructieViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 30/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class InstructieViewController: UIViewController {

    @IBOutlet var Instructies: UILabel!
    @IBAction func btnSluiten(_ sender: Any) {
          self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
self.view.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.6)
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
