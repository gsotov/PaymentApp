//
//  InstallmentViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class InstallmentViewController: UIViewController {

    @IBOutlet weak var totalPagarLbl: UILabel!
    @IBOutlet weak var valorCuotaLbl: UILabel!
    @IBOutlet weak var cuotasLbl: UILabel!
    @IBOutlet weak var bancoLbl: UILabel!
    @IBOutlet weak var tarjetaLbl: UILabel!
    @IBOutlet weak var montoLbl: UILabel!
    @IBOutlet weak var picketData: UIPickerView!
    
    
    var arregloTotalAPagar: [String] = []
    var InstallmentsArray = [Int]()
    var seleccion: Int!
    var installments: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPagarLbl.text = ServiceApi.ParameterValues.totalPagar
        tarjetaLbl.text = ServiceApi.ParameterValues.nameTC
        bancoLbl.text = ServiceApi.ParameterValues.nameBanco
        
        getInstallments()
        
        // Do any additional setup after loading the view.
    }
    
    func getInstallments(){

        ServiceApi.getMensaje (amount: ServiceApi.ParameterValues.cant_pagar, paymentMethod: ServiceApi.ParameterValues.tcId, issuerId: ServiceApi.ParameterValues.idBanco){ (success, message, error) in
            if success {
                
                let v = Installment.installmentsArray
                self.installments = v.map { String($0) }
                self.picketData.reloadAllComponents()
                self.picketData.selectRow(0, inComponent: 0, animated: false)
                
            }
            
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.installments.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.installments[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
