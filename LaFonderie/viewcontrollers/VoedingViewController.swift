//
//  VoedingViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 25/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class VoedingViewController: UIViewController {



    @IBOutlet weak var btnVoeding: UIButton!
    @IBOutlet weak var txtVoeding: UILabel!
    @IBOutlet weak var VoedingBeschrijvingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
        btnVoeding.superview?.bringSubview(toFront: btnVoeding)
        txtVoeding.superview?.bringSubview(toFront: txtVoeding)

        VoedingBeschrijvingView.layer.borderColor =  UIColor(red:0.67, green:0.75, blue:0.59, alpha:1.0).cgColor
        VoedingBeschrijvingView.layer.borderWidth = 1
        VoedingBeschrijvingView.layer.cornerRadius = 10
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
