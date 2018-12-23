//
//  InstallmentViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class InstallmentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var totalPagarLbl: UILabel! //
    @IBOutlet weak var valorCuotaLbl: UILabel! //
    @IBOutlet weak var cuotasLbl: UILabel!  //
    @IBOutlet weak var bancoLbl: UILabel!
    @IBOutlet weak var tarjetaLbl: UILabel!
    @IBOutlet weak var montoLbl: UILabel!
    @IBOutlet weak var picketData: UIPickerView!
    
    
    var totalPagar: [String] = []
    var ArrayInstallment = [Int]()
    var seleccion: Int!
    var installment: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        montoLbl.text = ServiceApi.ParameterValues.cant_pagar
        tarjetaLbl.text = ServiceApi.ParameterValues.nameTC
        bancoLbl.text = ServiceApi.ParameterValues.nameBanco
        
        getInstallments()
        self.picketData.delegate = self
        self.picketData.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //aca se va al principal y manda muestra la alerta alertDisplayExito
    @IBAction func funcionAlerta(_ sender: UIButton) {
        
        alertDisplayExito()
    }
    
    func alertDisplayExito()
    {
        let n_cuotas = "Nº Cuotas: " + ServiceApi.ParameterValues.cantidadCuotas
        let valor_cuota = "Valor Cuota: " + ServiceApi.ParameterValues.recomendarCuotas
        let totalPagado  = "Monto Final: " + ServiceApi.ParameterValues.totalPagar
        let Datos = "\(n_cuotas) \n \(valor_cuota) \n \(totalPagado)"
        
        let alert = UIAlertController(title: "Resumen de Pago", message: Datos, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            self.performSegue(withIdentifier: "segue5", sender: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func getInstallments(){

        ServiceApi.getMensaje (cant_pagar: ServiceApi.ParameterValues.cant_pagar, idTarjeta: ServiceApi.ParameterValues.tcId, idBanco: ServiceApi.ParameterValues.idBanco){ (success, message, error) in
            if (success) {
                
                let datos = Installments.arrayInstallments
                self.installment = datos.map { String($0) }
                self.picketData.reloadAllComponents()
                self.picketData.selectRow(0, inComponent: 0, animated: false)
                
            }
            else{
                print("caida al obtener los parametros")
            }
            
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.installment.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.installment[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let totalPagar = Installments.total_Pagar[row]
        ServiceApi.ParameterValues.totalPagar = String(totalPagar)
        totalPagarLbl.text = String(totalPagar)
        
        cuotasLbl.text = installment[row]
        valorCuotaLbl.text = Installments.recommended_Message[row]
        
        //selectedInstallmentLbl.text = installments[row]
        //installmentPriceSelectedLbl.text = Installment.recommendedMessageArray[row]
        
        //se comienza a poblar el picker
        if (installment[row] == "1")
        {
            ServiceApi.ParameterValues.cantidadCuotas = installment[row]
            ServiceApi.ParameterValues.recomendarCuotas = Installments.recommended_Message[row]
            
            
            let totalPagar = Installments.total_Pagar[row]
            ServiceApi.ParameterValues.totalPagar = String(totalPagar)
            
        }
        else if (installment[row] == "3")
        {
            ServiceApi.ParameterValues.cantidadCuotas = installment[row]
            ServiceApi.ParameterValues.recomendarCuotas = Installments.recommended_Message[row]
            
            
            let totalPagar = Installments.total_Pagar[row]
            ServiceApi.ParameterValues.totalPagar = String(totalPagar)
            
        }
        else if (installment[row] == "6")
        {
            ServiceApi.ParameterValues.cantidadCuotas = installment[row]
            ServiceApi.ParameterValues.recomendarCuotas = Installments.recommended_Message[row]
            
            
            let totalPagar = Installments.total_Pagar[row]
            ServiceApi.ParameterValues.totalPagar = String(totalPagar)
            
        }
        else if (installment[row] == "9")
        {
            ServiceApi.ParameterValues.cantidadCuotas = installment[row]
            ServiceApi.ParameterValues.recomendarCuotas = Installments.recommended_Message[row]
            
            
            let totalPagar = Installments.total_Pagar[row]
            ServiceApi.ParameterValues.totalPagar = String(totalPagar)
            
        }
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
