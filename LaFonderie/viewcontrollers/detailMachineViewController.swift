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
    
    @IBOutlet var handel: UIImageView!
    @IBAction func info(_ sender: Any) {
        let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpInstructie") as! InstructieViewController
        self.addChildViewController(PopupVC)
        PopupVC.view.frame = self.view.frame
        self.view.addSubview(PopupVC.view)
        PopupVC.didMove(toParentViewController: self)
        
    }
    
  
    @IBOutlet var imgMachine: UIImageView!
    var feedbackLabel = UILabel(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
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
    
    @objc func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        feedbackLabel.text = ""
       
       
        if let rotation = recognizer.rotation {
            currentValue += rotation.degrees/360*100
   
            
            feedbackLabel.text = feedbackLabel.text! + String(format:"Value: %.2f%%", currentValue)
            
        }
      
            //recognizer.isEnabled = true
            if let angle = recognizer.angle {
                feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Angle: %.2f%", angle.degrees)

                
            }
        
        if let distance = recognizer.distance {
            
            
            
            feedbackLabel.text = feedbackLabel.text! + "\n" + String(format:"Value: %.2f%%", distance)
                
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
                let PopupVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "PopupView") as! PopUpViewController
                self.addChildViewController(PopupVC)
                PopupVC.view.frame = self.view.frame
                self.view.addSubview(PopupVC.view)
                PopupVC.didMove(toParentViewController: self)
                })
            
            
        }
      
      /* self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))*/
   
        
        //feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //view.addSubview(feedbackLabel)
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: [], metrics: nil, views: ["view":feedbackLabel]))
        
        //feedbackLabel.textAlignment = .center
        //feedbackLabel.numberOfLines = 0;
        //feedbackLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        //feedbackLabel.text = "Perform a gesture here."
        

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
