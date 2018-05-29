//
//  MainViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 25/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var txtHout: UILabel!
    @IBOutlet weak var btnHout: UIButton!
    @IBOutlet weak var beschrijvingHoutView: UIView!
    @IBOutlet weak var imgHoutIcon: UIImageView!
    //@IBOutlet weak var txtHout: UILabel!
    //@IBOutlet weak var imgHoutIcon: UIImageView!
    
    //@IBOutlet weak var btnHout: UIButton!
    //@IBOutlet weak var BeschrijvingHoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
       btnHout.superview?.bringSubview(toFront: btnHout)
        txtHout.superview?.bringSubview(toFront: txtHout)
        imgHoutIcon.superview?.bringSubview(toFront: imgHoutIcon)

        
        beschrijvingHoutView.layer.borderColor =  UIColor(red:0.66, green:0.25, blue:0.28, alpha:1.0).cgColor
        beschrijvingHoutView.layer.borderWidth = 1
        beschrijvingHoutView.layer.cornerRadius = 10
        // Do any additional setup after loading the view
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
