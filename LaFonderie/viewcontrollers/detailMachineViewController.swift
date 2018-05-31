//
//  detailMachineViewController.swift
//  LaFonderie
//
//  Created by ontlener on 24/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
import Firebase

class detailMachineViewController: UIViewController {

    var ref: DatabaseReference?
    var databasehandle:DatabaseHandle?
    var countTouches = 0
    var currentValue:CGFloat = 0.0{
        didSet{
            if(currentValue > 100){
                currentValue = 100
            }
            if(currentValue < 0){
                currentValue = 0
            }
        }
    }
    
    @IBOutlet var btnVolgende: UIButton!
    @IBOutlet var handel: UIImageView!
    @IBOutlet var Band: UIImageView!
    @IBOutlet var Band2: UIImageView!
    @IBAction func info(_ sender: Any) {
        let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "hintView") as! hintViewController
        self.addChildViewController(PopupVC)
        PopupVC.huidigeStap = 1
        PopupVC.view.frame = self.view.frame
        self.view.addSubview(PopupVC.view)
        PopupVC.didMove(toParentViewController: self)
        
    }
    
  
    @IBOutlet var imgMachine: UIImageView!
    var feedbackLabel = UILabel(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnVolgende.isHidden = true
        Band.superview?.bringSubview(toFront: Band)
        Band2.superview?.bringSubview(toFront: Band2)
     
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        haalGegevensOp(naamAfbeelding: "FINAL-5.png")
        imgMachine.superview?.bringSubview(toFront: imgMachine)
       //randTekst.layer.borderColor = UIColor(red:0.32, green:0.44, blue:0.46, alpha:1.0).cgColor
        //randTekst.layer.borderWidth = 1
        //randTekst.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func haalGegevensOp(naamAfbeelding:String){
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                let storage = Storage.storage().reference()
                let tempImageRef = storage.child("animatie").child(naamAfbeelding)
                
                tempImageRef.getData(maxSize: 1*1000*1000){
                    (data, error) in
                    if error == nil{
                        var afbeelding:UIImage? = UIImage(data: data!)
                        self.imgMachine.image = afbeelding
                    }else{
                        print(error?.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    func haalTekstOp(){
        var tekst:String = ""
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                
                self.databasehandle = self.ref?.child("sectoren").child("METAAL").child("beschrijving").observe(.value, with: { (snapshot) in
                   // self.txtBeschrijvingMetaal.text = snapshot.value as! String
                })
                
            }else{
                print(error?.localizedDescription)
            }
        }
        
    }
    
   
  

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        countTouches = countTouches + 1
        if(countTouches % 2 == 0){
               handel.rotate(1).animate()
            
            print(countTouches)
        }else{
            print(countTouches)
            self.handel.rotate(-1).animate()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.btnVolgende.isHidden = false
                })
            
            
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
