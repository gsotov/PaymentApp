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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view, typically from a nib.

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
            debugPrint("Data monto :", ViewController.txtValoMonto)
            ServiceApi.ParameterValues.cant_pagar = txtMonto.text!
            performSegue(withIdentifier: "segue2", sender: nil)
            
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    //Se encaerga de obtener los datos de la compra
    override func viewDidAppear(_ animated: Bool)
    {
        let obtieneData = ServiceApi.ParameterValues.alert
        
        if (obtieneData)
        {
            alertDisplayExito()
        }
        else
        {
            print("problemas con la carga")
        }
    }
    
    func alertDisplayExito()
    {
        let tarjetaCredito = "Tarjeta: " + ServiceApi.ParameterValues.nameTC
        let montoPagar = "Monto: " + ServiceApi.ParameterValues.cant_pagar
        let nombre_banco = "Banco: " + ServiceApi.ParameterValues.nameBanco
        let n_cuotas = "Cuotas: " + ServiceApi.ParameterValues.cantidadCuotas
        let valor_cuota = "Valor cuota: " + ServiceApi.ParameterValues.recomendarCuotas
        let totalPagado  = "Total Pagado: " + ServiceApi.ParameterValues.totalPagar
        let summary = "\(tarjetaCredito) \n \(montoPagar) \n \(nombre_banco) \n \(n_cuotas) \n \(valor_cuota) \n \(totalPagado)"
        
        let alert = UIAlertController(title: "Resumen", message: summary, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func alertDisplayError()
    {
       
        let alert = UIAlertController(title: "Resumen", message: "Problemas al obtener los datos de compra", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

}

