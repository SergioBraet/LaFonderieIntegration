//
//  TextielViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 25/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class TextielViewController: UIViewController {


    @IBOutlet weak var btnTextiel: UIButton!
    @IBOutlet weak var BeschrijvingTextielView: UIView!
    @IBOutlet weak var txtTextiel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
        btnTextiel.superview?.bringSubview(toFront: btnTextiel)
         txtTextiel.superview?.bringSubview(toFront: txtTextiel)
         
         BeschrijvingTextielView.layer.borderColor =  UIColor(red:0.60, green:0.34, blue:0.27, alpha:1.0).cgColor
        BeschrijvingTextielView.layer.borderWidth = 1
        BeschrijvingTextielView.layer.cornerRadius = 10

        //Do any additional setup after loading the view.
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
