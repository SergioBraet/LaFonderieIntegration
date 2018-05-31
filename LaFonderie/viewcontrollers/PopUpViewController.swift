//
//  PopUpViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 30/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
// bron: https://www.youtube.com/watch?v=FgCIRMz_3dE
class PopUpViewController: UIViewController {

    @IBOutlet var Popview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Popview.layer.borderWidth = 1
        Popview.layer.cornerRadius = 10
        Popview.layer.borderColor = UIColor(red:0.25, green:0.35, blue:0.40, alpha:1.0).cgColor
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
