//
//  ViewController.swift
//  NEUStockAppV2
//
//  Created by Miya on 3/15/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm  = try! Realm()
    var txtField: UITextField?
    var stocksInDB: [StockPrice] = [StockPrice]()
    @IBOutlet weak var tblView: UITableView!
    var stockSymbolForSegue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
        getStockValuesFromLocalDB()
    }
    
    @IBAction func addStockToDB(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Stock to DB", message: "Enter Stock Symbol", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            guard let symbol = self.txtField?.text else {return}
            if symbol == "" {return}
            self.findAndAddStockToLocalDB(symbol: symbol.uppercased())
        }
        
        let cancelButton = UIAlertAction (title: "Cancel", style: .cancel){ action in
        }
        
        alertController.addTextField{ lblTextField in
            self.txtField = lblTextField
            lblTextField.placeholder = "Enter Stock Value"
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true)
    }
}
