//
//  ListViewController.swift
//  FinalExam_2401962964
//
//  Created by Samuel Christopher on 08/02/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {


    @IBOutlet weak var tvFruit: UITableView!

    


    var arrFruit = [[String: Any]]()
    
    let baseURL = "https://fruityvice.com"
    
    func loadData() {
        let url = URL(string: "\(baseURL)/api/fruit/all")!
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            let jsonData = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
            
            self.arrFruit = jsonData
            
            DispatchQueue.main.async {
                self.tvFruit.reloadData()
            }
            
            
        }).resume()

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tvFruit.dataSource = self
        loadData()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func addBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Saved", message: "This fruit has been saved!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        return
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFruit.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        let genus = arrFruit[indexPath.row]["genus"] as! String
        let name = arrFruit[indexPath.row]["name"] as! String
        let family = arrFruit[indexPath.row]["family"] as! String
        let order = arrFruit[indexPath.row]["order"] as! String

        
        
        cell.textLabel?.text = "\(genus)\n\(name)\n\(family)\n\(order)\n"
        cell.textLabel?.numberOfLines = 6
        
        return cell
    }
    
    @IBAction func onSaved(_ sender: Any) {
        performSegue(withIdentifier: "toSaved", sender: self)
    }
    @IBAction func unwindToList(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
//        // Use data from the view controller which initiated the unwind segue
    }

}
