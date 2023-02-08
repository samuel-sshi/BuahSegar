//
//  ViewController.swift
//  FinalExam_2401962964
//
//  Created by Samuel Christopher on 08/02/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    var context: NSManagedObjectContext!
    
    var emailArr = [String]()
    var passwordArr = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onLogin(_ sender: Any) {
        let eemail = emailTf.text
        let ppassword = passwordTf.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        do {
            let res = try context.fetch(fetchReq) as! [NSManagedObject]
            
            for data in res {
                if let email = data.value(forKey: "email") as? String {
                    self.emailArr.append(email)
                }
                if let password = data.value(forKey: "password") as? String {
                    self.passwordArr.append(password)
                }
            }
        }catch {
            print("Something went wrong")
        }
        
        if(eemail!.isEmpty && ppassword!.isEmpty) {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        else if(eemail!.isEmpty) {
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
        
        else if(emailArr.contains(emailTf.text!)) {
            performSegue(withIdentifier: "toList", sender: nil)
            
        }
        else if(!emailArr.contains(emailTf.text!)) {
            let alert = UIAlertController(title: "Error", message: "Email has not been registered!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        else if(emailArr.contains(emailTf.text!) && !passwordArr.contains(passwordTf.text!)) {
            let alert = UIAlertController(title: "Error", message: "Password don't match!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Understood", style: .default, handler: {
                action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        
    }
    
    
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }


}

