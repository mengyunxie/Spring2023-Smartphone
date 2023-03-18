//
//  ViewController.swift
//  SevenWonders
//
//  Created by Miya on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let sevenWondersNames = ["The Colosseum, Rome, Italy", "The Great Wall of China, China", "The Taj Mahal, India", "Christ the Redeemer, Brazil", "Machu Picchu, Peru", "Chichén Itzá, Mexico", "Petra, Jordan"]
    
    let sevenWondersDetails = [
        "The Colosseum is the great oval amphitheater in the center of Rome where gladiators once fought for their life. The largest amphitheater ever built, it was constructed from sand and stone over eight years, from AD72 to AD80.",
        "The Great Wall of China is a huge barrier that spans thousands of miles along China’s historic northern border. Created over millennia, the wall began its life as a series of smaller walls dating back to the 7th century BCE, built as protective barriers against nomadic raids.",
        "India’s renowned Taj Mahal (Persian for Crown of Palaces) is the stunning white marble mausoleum on the bank of the Yamuna River in the city of Agra, and it has been selected as one of the seven wonders of the world.",
        "The totemic statue of Christ the Redeemer stands over Rio de Janeiro on the top of Mount Corcovado. At 30 meters tall, this monument is an iconic emblem of Brazil. This huge public artwork was designed by the Polish-French sculptor Paul Landowski in the 1920s and completed by Brazilian engineer Heitor da Silva Costa, and French engineer Albert Caquot in 1931.",
        "Machu Picchu is a lost treasure of the 15th century, a rare citadel discovered high in the Andes mountains above the Peruvian Sacred Valley. Astonishingly, it is one of the only pre-Columbian ruins found nearly intact, featuring evidence of former plazas, temples, agricultural terraces and homes. Archaeologists believe the citadel was built as an estate for the Inca emperor Pachacuti in around 1450 in polished drystone walls.",
        "Deep in the Mexican state of Yucatán lies Chichen Itza, a historic Mayan city built between the 9th and 12th centuries. Constructed by the pre-Columbian Mayan tribe Itzá, the city includes a series of monuments and temples.",
        "Petra, the ancient city in southern Jordan is also known as the ‘rose city’ for its golden hue. It dates as far back as 312BC. Set in a remote valley, this ancient city was founded by the Arab Nabataeans, a sophisticated civilization who carved stunning architecture and complex waterways out of surrounding rock faces."
    ]
    

    // wonderDetails is current selected row of wonder's details
    var wonderDetails = ""
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevenWondersNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
                
        cell.imgContainer.image = UIImage(named: "\(indexPath.row)")
        cell.lblTitle.text = sevenWondersNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblView {
            wonderDetails = sevenWondersDetails[indexPath.row]
            performSegue(withIdentifier: "segueDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails" {
            let detailVC = segue.destination as! DetailsViewController
            detailVC.details = wonderDetails
        }
    }
}

