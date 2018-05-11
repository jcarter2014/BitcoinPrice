//
//  DetailViewController.swift
//  BitcoinPrice
//
//  Created by John Carter on 12/21/17.
//  Copyright © 2017 Jack Carter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var oneHour: UILabel!
    @IBOutlet weak var twentyFourHour: UILabel!
    @IBOutlet weak var sevenDay: UILabel!
    
    var currencyData = String()
    var oneHourData = String()
    var twentyFourHourData = String()
    var sevenDayData = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currency.text = currencyData
        oneHour.text = oneHourData
        twentyFourHour.text = twentyFourHourData
        sevenDay.text = sevenDayData
        // Do any additional setup after loading the view.
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
