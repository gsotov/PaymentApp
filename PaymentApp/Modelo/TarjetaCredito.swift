//
//  TarjetaCredito.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

struct TarjetaCredito {
    var id: String
    var name: String
    var thumbnail: String?
    
    init (dictionary: [String:AnyObject]){
        id = dictionary[ServiceApi.TarjetaCredito_Object.JsonResponseKeys.TCId] as! String
        name = dictionary[ServiceApi.TarjetaCredito_Object.JsonResponseKeys.TCName] as! String
        thumbnail = dictionary[ServiceApi.TarjetaCredito_Object.JsonResponseKeys.Thumbnail] as? String
    }
    
    static func getTarjetaCredito(_ tarjetaCreditoResultado: [[String:AnyObject]]) -> [TarjetaCredito] {
    
        var TCArray = [TarjetaCredito]()
        
        for tarjetaCre in tarjetaCreditoResultado
        {
            TCArray.append(TarjetaCredito(dictionary: tarjetaCre))
        }
        return TCArray
    }
}
