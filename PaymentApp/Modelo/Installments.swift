//
//  Installments.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation

struct Installments
{
    let Payer_Costs: [[String:AnyObject]]?
    var installments: Int = 0
    var recommended_message: String = ""
    var total_amount: Double = 0
    var installment_amount: Double = 0
    
    static var arrayInstallments: [Int] = []
    static var recommended_Message: [String] = []
    static var total_Pagar: [Double] = []
    static var installment_Amount: [Double] = []
    
    init(dictionary: [String:AnyObject])
    {
        
        Payer_Costs = dictionary["payer_costs"] as? [[String:AnyObject]]
        
        if let Payer_Costs = Payer_Costs
        {
            for data in Payer_Costs
            {
                
                installments = data["installments"] as! Int
                recommended_message = data["recommended_message"] as! String
                total_amount = data["total_amount"] as! Double
                installment_amount = data["installment_amount"] as! Double
                
                Installments.arrayInstallments.append(installments)
                Installments.recommended_Message.append(recommended_message)
                Installments.total_Pagar.append(total_amount)
                Installments.installment_Amount.append(installment_amount)
                
            }
        }
    }
    
    
    static func getMessage(_ messageResultado: [[String:AnyObject]]) -> [Installments]
    {
        var mensajeInst = [Installments]()
        //obtiene los datos y lo va almacenando en el diccionario
        for mensaje in messageResultado
        {
            mensajeInst.append(Installments(dictionary: mensaje))
        }
        return mensajeInst
    }
    

}
