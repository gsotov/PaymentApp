//
//  BancoViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class BancoViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextView(_ sender: Any)
    {
        performSegue(withIdentifier: "segue4", sender: nil)
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
