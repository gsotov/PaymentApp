//
//  PaymentViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tarjetaCredito: UITableView!
    @IBOutlet weak var cantidadLbl: UILabel!
    
    var arregloTarjeta = [TarjetaCredito]()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        cantidadLbl.text = ServiceApi.ParameterValues.cant_pagar
        
        tarjetaCredito.delegate = self
        tarjetaCredito.dataSource = self
        
        getDataPayment()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextSegueBtn(_ sender: Any)
    {
        performSegue(withIdentifier: "segue3", sender: nil)
    }
    
    func getDataPayment(){
        ServiceApi.getPaymentMethod { (success, tarjetaCredito, error) in
            DispatchQueue.main.async {
                if (success)
                {
                    
                    if let tarjetaCreditos = tarjetaCredito
                    {
                        print("entra en IF")
                        self.arregloTarjeta = tarjetaCreditos
                        self.tarjetaCredito.reloadData()
                        
                    }
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        print("---------")
        print(arregloTarjeta.count)
        print("end Tarjetas")
        return arregloTarjeta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellReuseId = "cellTarjeta"
        let tarjetaCredito = arregloTarjeta[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
        let imageUrlString = tarjetaCredito.thumbnail
        let imageUrl = URL(string: imageUrlString ?? "")!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        cell.imageView?.image = image
        cell.textLabel?.text = tarjetaCredito.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tarjetaCredito = arregloTarjeta[(indexPath as NSIndexPath).row]
        
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
