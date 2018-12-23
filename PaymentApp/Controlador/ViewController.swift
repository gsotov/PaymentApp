//
//  ViewController.swift
//  PaymentApp
//
//  Created by Gabriel Soto valenzuela on 12/20/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var txtMonto: UITextField!
    @IBOutlet weak var btnAceptar: UIButton!
    
    static var txtValoMonto: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Oculta el navegationBar y cambia el color
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func botonAceptar(_ sender: UIButton)
    {
        if (self.txtMonto.text?.isEmpty ?? true)
        {
            txtMonto.becomeFirstResponder()
        }
        else
        {
            ViewController.txtValoMonto = txtMonto.text!
            ServiceApi.ParameterValues.cant_pagar = txtMonto.text!
            performSegue(withIdentifier: "segue2", sender: nil)
            
        }
    }
}

