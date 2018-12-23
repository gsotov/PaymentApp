//
//  ServiceApi.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class ServiceApi : NSObject
{
    
    //Se declaran las funciones para consumir las API mercadoPado
    
    static func getPaymentMethod(_ finallyPayment: @escaping ( _ success: Bool, _ tarjetaCredito: [TarjetaCredito]?, _  errorString: String?) -> Void){
        Alamofire.request("https://api.mercadopago.com/v1/payment_methods?public_key=444a9ef5-8a6b-429f-abdf-587639155d88").responseJSON { response in
            if let json = response.result.value {
                print("json: \(json)")
                
                let resultsTarjetas = TarjetaCredito.getTarjetaCredito(json as! [[String : AnyObject]])
                finallyPayment(true, resultsTarjetas, nil)
                
            }
        }
    }
    
    
    //metodo GET para obtener bancos
    static func getBancos(TarjetaId:String,_ finallyBancos: @escaping ( _ success: Bool, _ bancos: [Bancos]?, _  errorString: String?) -> Void){
        let url = "https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=444a9ef5-8a6b-429f-abdf-587639155d88"
        let payment_method = "&payment_method_id="+TarjetaId
        
        print("URL getBancos: \(url+payment_method)")
        Alamofire.request(url+payment_method).responseJSON { response in
            
            if let json = response.result.value {
                print("JSON: \(json)")
                let resultadoBancos = Bancos.getBancos(json as! [[String : AnyObject]])
                finallyBancos(true, resultadoBancos, nil)
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }

    
    static func getMensaje(cant_pagar:String, idTarjeta: String, idBanco:String, _ completionHandlerForMessageObject: @escaping ( _ success: Bool, _ creditCards:[Installments]?, _  errorString: String?) -> Void){
        let url = "https://api.mercadopago.com/v1/payment_methods/installments?public_key=444a9ef5-8a6b-429f-abdf-587639155d88"
        
        let _cant_pagar = "&amount=" + cant_pagar
        let _idTarjeta = "&payment_method_id=" + idTarjeta
        let _idBanco = "&issuer.id=" + idBanco
        
        print("URL getMensaje: \(url+_cant_pagar+_idTarjeta+_idBanco)")
        
        Alamofire.request(url+_cant_pagar+_idTarjeta+_idBanco).responseJSON
            {
                response in
                if let json = response.result.value
                {
                    debugPrint("JSON ", json)
                    let parsedJson = JSON(json)
                    debugPrint("JSON", parsedJson)
                    let resultMessage = Installments.getMessage(json as! [[String : AnyObject]])
                    completionHandlerForMessageObject(true, resultMessage, nil)
                }
           }
    }
    
    
    struct ParameterValues {

        static var nameTC = ""
        static var tcId = ""
        static var cant_pagar = ""
        static var nameBanco = ""
        static var idBanco = ""
        static var cantidadCuotas = ""
        static var recomendarCuotas = ""
        static var totalPagar = ""
    }
    
    struct TarjetaCredito_Object
    {
        
        struct  JsonResponseKeys
        {
            static let TCId = "id"
            static let TCName = "name"
            static let Thumbnail = "secure_thumbnail"
        }
    }
    
    struct Bancos_Objetc
    {
        
        struct  JsonResponseKeys
        {
            static let BId = "id"
            static let BName = "name"
            static let Thumb = "secure_thumbnail"
        }
    }
    
    struct Installments_JsonObject
    {
        struct  JsonResponseKeys
        {
            static let PayerCosts = "payer_costs"
            static let RecommendMessage = "recommended_message"
            static let Installments = "installments"
        }
    }

    
    
    
}
