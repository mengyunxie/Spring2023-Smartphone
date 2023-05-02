//
//  ViewController.swift
//  LocalDBUsingRealm
//
//  Created by Miya on 3/6/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm  = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
        // testFunction()
        getValues()
    }
    
    func getValues(){
        do{
            let stocks = realm.objects(StockPrice.self)
            print(stocks)
        } catch let error as NSError {
            print("Unable to add values to the DB")
        }
    }
    
    
    func testFunction() {
        let tsla: StockPrice = StockPrice()
        tsla.symbol = "TSLA"
        tsla.price = 200.23
        tsla.volume = 123234235
        
        // Add to the Realm
        do {
            try realm.write {
                realm.add(tsla, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add values to the DB")
        }
    }

}

