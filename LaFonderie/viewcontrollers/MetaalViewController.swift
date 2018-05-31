//
//  MetaalViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 28/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
import Firebase

class MetaalViewController: UIViewController {
    
    var ref: DatabaseReference?
    var databasehandle:DatabaseHandle?

    @IBOutlet weak var txtMetaal: UILabel!
    @IBOutlet weak var btnMetaalView: UIButton!
    @IBOutlet weak var BeschrijvingMetaalView: UIView!
    @IBOutlet var txtBeschrijvingMetaal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        navigationBarAppearance.isTranslucent = false
        
        btnMetaalView.superview?.bringSubview(toFront: btnMetaalView)
        txtMetaal.superview?.bringSubview(toFront: txtMetaal)
        haalGegevensOp()
        haalTekstOp()
       BeschrijvingMetaalView.layer.borderColor =  UIColor(red:0.25, green:0.35, blue:0.40, alpha:1.0).cgColor
        BeschrijvingMetaalView.layer.borderWidth = 1
        BeschrijvingMetaalView.layer.cornerRadius = 10
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
                let tempImageRef = storage.child("home 4.png")
                
                tempImageRef.getData(maxSize: 1*1000*1000){
                    (data, error) in
                    if error == nil{
                        let afbeelding:UIImage? = UIImage(data: data!)
                        self.btnMetaalView.setImage(afbeelding, for: .normal)
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
  
                self.databasehandle = self.ref?.child("sectoren").child("METAAL").child("beschrijving").observe(.value, with: { (snapshot) in
                    self.txtBeschrijvingMetaal.text = snapshot.value as? String
                })
                
            }else{
                print(error!.localizedDescription)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController{
            if let destination = nav.viewControllers[0] as? MachinesTableViewController{
                destination.sector = "METAAL"
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
