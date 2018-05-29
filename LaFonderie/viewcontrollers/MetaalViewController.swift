//
//  MetaalViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 28/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class MetaalViewController: UIViewController {

    @IBOutlet weak var txtMetaal: UILabel!
    @IBOutlet weak var btnMetaalView: UIButton!
    @IBOutlet weak var BeschrijvingMetaalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
        btnMetaalView.superview?.bringSubview(toFront: btnMetaalView)
        txtMetaal.superview?.bringSubview(toFront: txtMetaal)
        
       BeschrijvingMetaalView.layer.borderColor =  UIColor(red:0.25, green:0.35, blue:0.40, alpha:1.0).cgColor
        BeschrijvingMetaalView.layer.borderWidth = 1
        BeschrijvingMetaalView.layer.cornerRadius = 10
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
