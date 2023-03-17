//
//  StocksNetworkingCode.swift
//  NEUStockAppV2
//
//  Created by Miya on 3/16/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner

extension ViewController {
    func getAndAddStockValueInDB(_ symbol : String) {
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock price for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in response")
                return
            }
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            let volume = stock["volume"].int64Value
            
            // Add to the Realm
            let newStock: StockPrice = StockPrice()
            newStock.symbol = symbol
            newStock.price = price
            newStock.volume = volume
            
            self.addDataToRealmDB(stock: newStock)
            self.stocksInDB.append(newStock)
            self.tblView.reloadData()
        }
    }
    
    func getStockDataFromAPI() {
        for stock in stocksInDB {
            // Make network calls for each of stock and undate the value
            let url = "\(baseURL)\(stock.symbol)?apikey=\(apiKey)"
            AF.request(url).responseJSON { response in
                
                if response.error != nil {
                    print("Error in response")
                    return
                }
                guard let rawData = response.data else {return}
                guard let jsonArray = JSON(rawData).array else {return}
                guard let stock = jsonArray.first else {return}
                let symbol = stock["symbol"].stringValue
                let price = stock["price"].floatValue
                let volume = stock["volume"].int64Value
                
                // Add to the Realm
                let newStock: StockPrice = StockPrice()
                newStock.symbol = symbol
                newStock.price = price
                newStock.volume = volume
                
                if let i = self.stocksInDB.firstIndex(where: { $0.symbol == symbol }) {
                    self.stocksInDB[i].price = price
                    self.stocksInDB[i].volume = volume
                    self.tblView.reloadData()
                }

            }
        }
    }
}
