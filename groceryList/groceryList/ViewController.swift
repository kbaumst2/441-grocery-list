//
//  ViewController.swift
//  groceryList
//
//  Created by Kate Baumstein on 3/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addItemTextField : UITextField!
    @IBOutlet var addItemButton : UIButton!

    var groceries = ["apples", "bananas", "broccoli", "Cheese"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

       // self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)

        let groceryItem = groceries[indexPath.row]
        cell.textLabel?.text = groceryItem

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    @IBAction func addItem(sender: UIButton){
        groceries.append(addItemTextField.text!)
        addItemTextField.text = ""
        tableView.reloadData()
        
    }
    
//    @IBAction func clearTextField(sender: UIButton){
//        addItemTextField.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
