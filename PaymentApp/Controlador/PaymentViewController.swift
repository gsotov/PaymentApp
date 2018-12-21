//
//  PaymentViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tarjetaCredito: UITableView!
    @IBOutlet weak var cantidadLbl: UILabel!
    
    var tarjetasDeCreditos = [TarjetaCredito]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cantidadLbl.text = ServiceApi.ParameterValues.cant_pagar

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextSegueBtn(_ sender: Any)
    {
        performSegue(withIdentifier: "segue3", sender: nil)
    }
    
    func getDataPayment(){
        ServiceApi.getPaymentMethod { (success, creditCards, error) in
            DispatchQueue.main.async {
                if (success){
                    if let creditCards = creditCards {
                        self.tarjetasDeCreditos = creditCards
                        self.tarjetaCredito.reloadData()
                        
                    }
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tarjetasDeCreditos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellReuseId = "cell"
        let tarjetaCredito = tarjetasDeCreditos[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
        let imageUrlString = tarjetaCredito.thumbnail
        let imageUrl = URL(string: imageUrlString ?? "")!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        //Carga poco optimizada, deberia ser carga de data a uiimage
        cell.imageView?.image = image
        cell.textLabel?.text = tarjetaCredito.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tarjetaCredito = tarjetasDeCreditos[(indexPath as NSIndexPath).row]
        debugPrint("el nombre de la tarjeta seleccionada es: \(tarjetaCredito.name)")
        debugPrint("el id de la tarjeta seleccionada es: \(tarjetaCredito.id)")
        if (tarjetaCredito.name.isEmpty){
            
        } else {
            btnNext.isEnabled = true
        }
        
        ServiceApi.ParameterValues.nameTC = tarjetaCredito.name
        ServiceApi.ParameterValues.tcId = tarjetaCredito.id
        
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
