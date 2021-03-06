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
    @IBOutlet var addProduceButton : UIButton!
    @IBOutlet var addMeatButton : UIButton!
    @IBOutlet var addOtherButton : UIButton!


    var produce : [String] = []
    var meat : [String] = []
    var other : [String] =  []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

       // self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return groceries.count
        if(section == 0){
            return produce.count
        }
        if(section == 1){
            return meat.count
        }
        else{
            return other.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        if(indexPath.section == 0){
            let groceryItem = produce[indexPath.row]
            cell.textLabel?.text = groceryItem
        }
        else if(indexPath.section == 1){
            let groceryItem = meat[indexPath.row]
            cell.textLabel?.text = groceryItem
        }
        else{
            let groceryItem = other[indexPath.row]
            cell.textLabel?.text = groceryItem
        }
        
//        let groceryItem = groceries[indexPath.row]
//        cell.textLabel?.text = groceryItem

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Produce"
        }
        if(section == 1){
            return "Meat/Poultry"
        }
        else{
            return "Others"
        }
        
        //return "Grocery List"
    }
    
    
    @IBAction func addMeat(sender: UIButton){
        meat.append(addItemTextField.text!)
        addItemTextField.text = ""
        tableView.reloadData()
        
    }
    
    @IBAction func addProduce(sender: UIButton){
        produce.append(addItemTextField.text!)
        addItemTextField.text = ""
        tableView.reloadData()
    }
    
    @IBAction func addOther(sender: UIButton){
        other.append(addItemTextField.text!)
        addItemTextField.text = ""
        tableView.reloadData()
        
    }
    
    
    
    //swipe to delete https://www.hackingwithswift.com/example-code/uikit/how-to-swipe-to-delete-uitableviewcells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if(indexPath.section == 0){
                produce.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            else if(indexPath.section == 1){
                meat.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            else {
                other.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
