//
//  BancoViewController.swift
//  PaymentApp
//
//  Created by Tecnova on 12/21/18.
//  Copyright © 2018 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class BancoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableBanco: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var montoLbl: UILabel!
    @IBOutlet weak var lblTarjeta: UILabel!
    
    var arregloBancoApi = [Bancos]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        montoLbl.text = ServiceApi.ParameterValues.cant_pagar
        lblTarjeta.text = ServiceApi.ParameterValues.nameTC
        
        tableBanco.delegate = self
        tableBanco.dataSource = self
        
        getBancosApi()
        
        // Do any additional setup after loading the viewtableBanco.
    }
    @IBAction func nextView(_ sender: Any)
    {
        performSegue(withIdentifier: "segue4", sender: nil)
    }
    
    func getBancosApi(){
        ServiceApi.getBancos(TarjetaId: ServiceApi.ParameterValues.tcId){ (success, bancos, error) in
            if success {
                if let banco = bancos {
                    self.arregloBancoApi = banco
                    self.tableBanco.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloBancoApi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseId = "cellTable"
        let banco = arregloBancoApi[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
        let imageUrlString = banco.thumbnail
        let imageUrl = URL(string: imageUrlString ?? "")!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        cell.imageView?.image = image
        cell.textLabel?.text = banco.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let banco = arregloBancoApi[(indexPath as NSIndexPath).row]
        if (banco.name.isEmpty){
            
        } else {
            btnNext.isEnabled = true
        }
        debugPrint("el nombre del banco: \(banco.name)")
        debugPrint("el id deL BANCO: \(banco.id)")
        ServiceApi.ParameterValues.nameBanco = banco.name
        ServiceApi.ParameterValues.idBanco = banco.id
        
        
        
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
