//
//  detailMachineViewController.swift
//  LaFonderie
//
//  Created by ontlener on 24/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class detailMachineViewController: UIViewController {


    @IBOutlet weak var randTekst: UIView!
    @IBOutlet weak var imgMachine: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        
        imgMachine.superview?.bringSubview(toFront: imgMachine)
       randTekst.layer.borderColor = UIColor(red:0.32, green:0.44, blue:0.46, alpha:1.0).cgColor
        randTekst.layer.borderWidth = 1
        randTekst.layer.cornerRadius = 10
        
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
