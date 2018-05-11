//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by John Carter on 12/17/17.
//  Copyright © 2017 Jack Carter. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var priceList: UITableView!
    
    var prices = [TableViewCell]()
    var dictOfThings: [String: String] = [:]
    var dictKeys = [String]()
    var dictValues = [String]()
    var oneHourChanges = [String]()
    var twentyFourHourChanges = [String]()
    var oneWeekChanges = [String]()
    
    
    func getPrices() {
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON { (response) in
            
            if let JSON = response.result.value as? [[String: Any]] {
                
                
                
                for eachItem in JSON {
                    //print(eachItem["percent_change_24h"])
                    
                    //guard eachItem["percent_change_24h"] != nil else { print("no"); return }
                    print(eachItem["name"])
                    print(eachItem["percent_change_24h"])
                    if let test24 = eachItem["percent_change_24h"] {
                        //print("ouch")
                        //continue
                    } else {
                        print("ouch")
                        continue
                    }
                    if let test1 = eachItem["percent_change_1h"]  {
                        //print("nil")
                        //continue
                    } else {
                        print("1")
                        continue
                    }

                    print(eachItem)
                    let currency = eachItem["name"] as! String
                    let price = eachItem["price_usd"] as! String
                    print(currency)
                    print(price)
                    let oneHourChange = eachItem["percent_change_1h"] as? String
                    let twentyFourHourChange = eachItem["percent_change_24h"] as? String
                    let oneWeekChange = eachItem["percent_change_7d"] as? String
                    self.dictKeys.append(currency)
                    self.dictValues.append(price)
                    self.oneHourChanges.append(oneHourChange!)
                    //self.twentyFourHourChanges.append(twentyFourHourChange!)
                    self.oneWeekChanges.append(oneWeekChange!)
                }
            }
            self.priceList.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictKeys.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.currency.text = dictKeys[indexPath.row]
        cell.price.text = dictValues[indexPath.row]

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "masterToDetail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "masterToDetail" {
            if let detailVC = segue.destination as? DetailViewController {
                if let indexPath = priceList.indexPathForSelectedRow {
                    detailVC.currencyData = dictKeys[indexPath.row]
                    detailVC.oneHourData = oneHourChanges[indexPath.row] + "%"
                    //detailVC.twentyFourHourData = twentyFourHourChanges[indexPath.row] + "%"
                    detailVC.sevenDayData = oneWeekChanges[indexPath.row] + "%"
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceList.dataSource = self
        priceList.delegate = self
        getPrices()

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
