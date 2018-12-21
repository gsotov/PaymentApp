//
//  Installments.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
struct Installment
{
    let Payer_Costs: [[String:AnyObject]]?
    var installments: Int = 0
    var recommended_message: String = ""
    var total_amount: Double = 0
    var installment_amount: Double = 0
    
    static var installmentsArray: [Int] = []
    static var recommended_MessageArray: [String] = []
    static var total_AmountArray: [Double] = []
    static var installment_AmountArray: [Double] = []
    
    init(dictionary: [String:AnyObject])
    {
        
        Payer_Costs = dictionary["payer_costs"] as? [[String:AnyObject]]
        
        if let Payer_Costs = Payer_Costs
        {
            for i in Payer_Costs
            {
                
                installments = i["installments"] as! Int
                recommended_message = i["recommended_message"] as! String
                total_amount = i["total_amount"] as! Double
                installment_amount = i["installment_amount"] as! Double
                
                Installment.installmentsArray.append(installments)
                Installment.recommended_MessageArray.append(recommended_message)
                Installment.total_AmountArray.append(total_amount)
                Installment.installment_AmountArray.append(installment_amount)
                
            }
        }
    }
    
    
    static func getMessage(_ messageResultado: [[String:AnyObject]]) -> [Installment]
    {
        var mensajeInst = [Installment]()
        
        for mensaje in messageResultado
        {
            mensajeInst.append(Installment(dictionary: mensaje))
        }
        return mensajeInst
    }
    

}
