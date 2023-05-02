//
//  StockRealmFunctions.swift
//  NEUStockAppV2
//
//  Created by Miya on 3/16/23.
//

import Foundation
import RealmSwift

extension ViewController {
    func getStockValuesFromLocalDB() {
        let stocks = realm.objects(StockPrice.self)
        stocksInDB.removeAll ()
        for stock in stocks {
            let stockPrice = StockPrice ()
            stockPrice.symbol = stock.symbol
            stockPrice.price = stock.price
            stockPrice.volume = stock.volume
            stocksInDB.append(stockPrice)
        }
        tblView.reloadData()
        
        // At this point we have stale data
        // we want to make network calls and get real data
        getStockDataFromAPI()
        
    }
    
    func findAndAddStockToLocalDB(symbol : String) {
        
        // If the stock already exists in the DB then dont do anything
        // make a network call for the stock symbol
        // if the stock symbol exist then add it to the DB
        // Otherwise dont do anything
        
        if doesStockExistInDB(symbol) {
            return
        }
        getAndAddStockValueInDB(symbol)
    }
    
    func doesStockExistInDB(_ symbol : String) -> Bool {
        let data = realm.object(ofType: StockPrice.self, forPrimaryKey: symbol)
        return data != nil
    }
    
    func addDataToRealmDB(stock : StockPrice) {
        do {
            try self.realm.write {
                self.realm.add(stock, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add values to the DB \(error)")
        }
    }
    
    func removeStockFromDB(symbol : String) {
        // Delete the instance from the realm.
        do {
            guard let object = realm.objects(StockPrice.self).filter("symbol = %@", symbol).first else {return}
            try realm.write {
                realm.delete(object)
            }
            
        } catch let error as NSError {
            print("Unable to delete values from the DB \(error)")
        }
    }
}
