//
//  StockTableViewControllerCode.swift
//  NEUStockAppV2
//
//  Created by Miya on 3/16/23.
//
import UIKit
import Foundation

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksInDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let symbol = stocksInDB[indexPath.row].symbol
        let price = stocksInDB[indexPath.row].price
        cell.textLabel?.text = "\(symbol): \(price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let stock = stocksInDB[indexPath.row]
            stocksInDB.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeStockFromDB(symbol : stock.symbol)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stock = stocksInDB[indexPath.row]
        stockSymbolForSegue = stock.symbol
        performSegue(withIdentifier: "SegueStockDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueStockDetails" {
            let vc = segue.destination as! StockDetailsViewController
            vc.stockSymbol = stockSymbolForSegue
        }
    }
}
