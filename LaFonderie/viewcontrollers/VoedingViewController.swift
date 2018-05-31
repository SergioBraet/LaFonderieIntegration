//
//  VoedingViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 25/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
import Firebase
class VoedingViewController: UIViewController {

    var ref: DatabaseReference?
    var databasehandle:DatabaseHandle?

    @IBOutlet weak var btnVoeding: UIButton!
    @IBOutlet weak var txtVoeding: UILabel!
    @IBOutlet weak var VoedingBeschrijvingView: UIView!
    @IBOutlet var txtBeschrijvingVoeding: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
        btnVoeding.superview?.bringSubview(toFront: btnVoeding)
        txtVoeding.superview?.bringSubview(toFront: txtVoeding)
        haalTekstOp()
        haalGegevensOp()
        VoedingBeschrijvingView.layer.borderColor =  UIColor(red:0.67, green:0.75, blue:0.59, alpha:1.0).cgColor
        VoedingBeschrijvingView.layer.borderWidth = 1
        VoedingBeschrijvingView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func haalGegevensOp(){
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                let storage = Storage.storage().reference()
                let tempImageRef = storage.child("home 2.png")
                
                tempImageRef.getData(maxSize: 1*1000*1000){
                    (data, error) in
                    if error == nil{
                        let afbeelding:UIImage? = UIImage(data: data!)
                        self.btnVoeding.setImage(afbeelding, for: .normal)
                    }else{
                        print(error!.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    func haalTekstOp(){

        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                
                
                
                self.databasehandle = self.ref?.child("sectoren").child("VOEDING").child("beschrijving").observe(.value, with: { (snapshot) in
                    self.txtBeschrijvingVoeding.text = snapshot.value as? String
                })
                
            }else{
                print(error!.localizedDescription)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController{
            if let destination = nav.viewControllers[0] as? MachinesTableViewController{
                destination.sector = "VOEDING"
            }
        }
        
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
