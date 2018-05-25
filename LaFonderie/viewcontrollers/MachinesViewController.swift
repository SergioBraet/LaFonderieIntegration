//
//  MachinesViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 24/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//  geraadpleegde bronnen:
// https://www.hackingwithswift.com/example-code/uikit/how-to-bring-a-subview-to-the-front-of-a-uiview
// https://www.youtube.com/watch?v=V1OGv1aNveI
// http://uicolor.xyz/#/rgb-to-ui
// https://stackoverflow.com/questions/24687238/changing-navigation-bar-color-in-swift?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
//

import UIKit

class MachinesViewController: UIViewController {

    @IBOutlet weak var btnOntdekEersteMachine: UIButton!
    @IBOutlet weak var beschrijvingView: UIView!
    @IBOutlet weak var imgMachine: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        
        imgMachine.layer.cornerRadius = 10
        imgMachine.clipsToBounds = true
        imgMachine.superview?.bringSubview(toFront: imgMachine)
        
        beschrijvingView.layer.borderColor =  UIColor(red:0.46, green:0.52, blue:0.53, alpha:1.0).cgColor
        beschrijvingView.layer.borderWidth = 1
        beschrijvingView.layer.cornerRadius = 10
        
        btnOntdekEersteMachine.layer.cornerRadius = 5
       
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
