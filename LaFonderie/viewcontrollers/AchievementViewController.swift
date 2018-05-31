//
//  AchievementViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 31/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit


class AchievementViewController: UIViewController {

    @IBOutlet var txtProgressHout: UILabel!
    @IBOutlet var progressbarMetaal: UIProgressView!
    @IBOutlet var progressbarTextiel: UIProgressView!
    @IBOutlet var progressbarVoeding: UIProgressView!
    @IBOutlet var progressbarHout: UIProgressView!
    @IBOutlet var navigationBar: UINavigationBar!
    var PercentageVoltooid:Int = UserDefaults.standard.integer(forKey: "houtPercentageVoltooid")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(PercentageVoltooid)
        self.title = ""
        progressbarHout.transform = progressbarHout.transform.scaledBy(x: 1, y: 7)
        progressbarHout.layer.cornerRadius = 10
        progressbarHout.clipsToBounds = true
        progressbarHout.setProgress(Float(PercentageVoltooid), animated: true)
      txtProgressHout.text = "\(PercentageVoltooid)%"
        
        progressbarMetaal.transform = progressbarMetaal.transform.scaledBy(x: 1, y: 7)
        progressbarMetaal.layer.cornerRadius = 10
        progressbarMetaal.clipsToBounds = true
        
        progressbarTextiel.transform = progressbarTextiel.transform.scaledBy(x: 1, y: 7)
        progressbarTextiel.layer.cornerRadius = 10
        progressbarTextiel.clipsToBounds = true
        
        progressbarVoeding.transform = progressbarVoeding.transform.scaledBy(x: 1, y: 7)
        progressbarVoeding.layer.cornerRadius = 10
        progressbarVoeding.clipsToBounds = true
        
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
