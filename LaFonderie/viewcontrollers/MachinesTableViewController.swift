//
//  MachinesTableViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 28/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.

//bron: https://www.ralfebert.de/ios-examples/uikit/uitableviewcontroller/custom-cells/
//

import UIKit
import Firebase

class MachineCell:UITableViewCell  {
    @IBOutlet var afbeelding: UIImageView!
    @IBOutlet var beschrijving: UIView!
    @IBOutlet var txtTitel: UILabel!
    @IBOutlet var txtBeschrijving: UILabel!
}

class MachinesTableViewController: UITableViewController {
    
    var ref: DatabaseReference?
    var databasehandle:DatabaseHandle?
    var sector:String = ""
    var aantalRows:Int = 0
    var namenArray:[String] = []
    
    
    @IBOutlet var mijnTableview: UITableView!
    @IBOutlet weak var header: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        haalAantalMachinesOp()
        
       let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red:0.96, green:0.96, blue:0.91, alpha:1.0)
        
        mijnTableview.tableHeaderView = header

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return aantalRows
       
    }

    func haalAantalMachinesOp(){
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                
                
                self.databasehandle = self.ref?.child("sectoren").child(self.sector).child("machines").observe(.value, with: { (snapshot)  in
                    let dict = snapshot.value as! [String:AnyObject]
                    for (key,value) in dict{

                       self.namenArray.append(key)
                        
                    }
                    self.aantalRows = dict.count
                    self.mijnTableview.reloadData()

                })
               
                
            }else{
                print(error!.localizedDescription)
            }
        }
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MachineCell", for: indexPath) as! MachineCell
        haalTekstOp(naamMachine: namenArray[indexPath.row],cell: cell)
        haalGegevensOp(naamMachine: namenArray[indexPath.row],cell: cell)
        cell.afbeelding.superview?.bringSubview(toFront: cell.afbeelding)
          cell.beschrijving.layer.borderWidth = 1
           cell.beschrijving.layer.cornerRadius = 10
           cell.beschrijving.layer.borderColor =  UIColor(red:0.46, green:0.52, blue:0.53, alpha:1.0).cgColor
        // Configure the cell...

        return cell
    }
    
    func haalGegevensOp(naamMachine:String, cell:MachineCell){
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                let storage = Storage.storage().reference()
                let tempImageRef = storage.child("\(naamMachine).png")
                
                tempImageRef.getData(maxSize: 1*1000*1000){
                    (data, error) in
                    if error == nil{
                       cell.afbeelding.image = UIImage(data: data!)
                        //self.btnMetaalView.setImage(afbeelding, for: .normal)
                    }else{
                        print(error!.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    func haalTekstOp(naamMachine:String, cell:MachineCell){

        print(naamMachine)
        print(self.sector)
        Auth.auth().signIn(withEmail: "lafonderie2@gmail.com", password: "Lafonderi2") { (user, error) in
            if user != nil{
                self.ref = Database.database().reference()
                
                
                
                self.databasehandle = self.ref?.child("sectoren").child(self.sector).child("machines").child(naamMachine).observe(.value, with: { (snapshot) in
                    var arr = snapshot.value as! [String:AnyObject]
                    cell.txtTitel.text = arr["naam"] as? String
                    cell.txtBeschrijving.text = arr["beschrijving"] as? String
                })
                
            }else{
                print(error!.localizedDescription)
            }
        }
        
    }
    
    

 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
