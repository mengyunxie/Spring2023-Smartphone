//
//  ViewController.swift
//  ConcurrencyExample
//
//  Created by Miya on 4/20/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = ["test1","test2", "test3"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getListOfFiles(_ sender: Any) {
        // serialQueueWork()
        concurrentQueue()
    }
    
    func listPhotoFiles(strName : String) async -> [String] {
        do{
            try await Task.sleep(until: .now + .seconds(5), clock: .continuous)
            return ["Image1", "Image2", "Image3"]
        }
        catch{
            print("error")
        }
        return []
    }
    
    func concurrentQueue(){
        let concurrentQueue = DispatchQueue(label: "my.Concurrent.Queue", attributes: .concurrent)
        concurrentQueue.async {
            print("Concurrent, Task 1 started")
            Task{
                let files = await self.listPhotoFiles(strName: "test")
                self.data = files
                self.tblView.reloadData()
            }
            print("Concurrent, Task 1 ended")
        }
        
        concurrentQueue.async {
            print("Concurrent, Task 2 started")
            print("Concurrent, Task 2 ended")
        }
    }
    
    func serialQueueWork(){
        let serialQueue = DispatchQueue(label: "my.Serial.Queue")
        serialQueue.async {
            print("Serial, Task 1 started")
            Task{
                let files = await self.listPhotoFiles(strName: "test")
                self.data = files
                self.tblView.reloadData()
            }
            print("Serial, Task 1 ended")
        }
        
        serialQueue.async {
            print("Serial, Task 2 started")
            Task{
                do{
                    try await Task.sleep(until: .now + .seconds(5), clock: .continuous)
                }
                catch{
                    print(error)
                }
            }
            print("Serial, Task 2 ended")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

