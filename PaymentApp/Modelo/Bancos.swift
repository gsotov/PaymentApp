//
//  Bancos.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation

struct Bancos
{
    //variables
    var id: String
    var name: String
    let thumbnail: String?
    
    init(dictionary: [String:AnyObject])
    {
        
        id = dictionary[ServiceApi.Bancos_Objetc.JsonResponseKeys.BId] as! String
        name = dictionary[ServiceApi.Bancos_Objetc.JsonResponseKeys.BName] as! String
        thumbnail = dictionary[ServiceApi.Bancos_Objetc.JsonResponseKeys.Thumb] as? String
    }
    
    static func getBancos(_ bancosResultado: [[String:AnyObject]]) -> [Bancos]
    {
        var arregloBancos = [Bancos]()
        
        for bancos in bancosResultado
        {
            arregloBancos.append(Bancos(dictionary: bancos))
        }
        return arregloBancos
    }
}
