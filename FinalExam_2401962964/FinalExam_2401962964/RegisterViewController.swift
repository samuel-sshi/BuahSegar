//
//  RegisterViewController.swift
//  FinalExam_2401962964
//
//  Created by Samuel Christopher on 08/02/23.
//

import UIKit

import CoreData

class RegisterViewController: UIViewController {

    
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    
    
    var context: NSManagedObjectContext!
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRegister(_ sender: Any) {
        let email = emailTf.text
        let ppassword = passwordTf.text
        
        if(email!.isEmpty && ppassword!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        else if(email!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Please fill email!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        else if(ppassword!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Please fill password!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        
        saveData()
        
        let alert = UIAlertController(title: "Register Successful", message: "Click Login to Continue", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func saveData() {
        let email = emailTf.text!
        let password = passwordTf.text!
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        
        let newContact = NSManagedObject(entity: entity!, insertInto: context)
        
        newContact.setValue(email, forKey: "email")
        newContact.setValue(password, forKey: "password")
        
        do {
            try context.save()
            print("data saved")
        }catch {
            print("failed to save data")
        }
    }
    


}
