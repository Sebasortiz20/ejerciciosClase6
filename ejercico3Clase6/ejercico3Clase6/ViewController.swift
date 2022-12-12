//
//  ViewController.swift
//  ejercico3Clase6
//
//  Created by sebas  on 12/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func accionAlPrecionarBotonSaludar(_ sender: UIButton) {
        pintarAlerta()
    }
    
    func pintarAlerta() {
        let alerta = UIAlertController(title: "Hola", message: "Si Desea Salir Presione Cerrar", preferredStyle: .alert)
        let accionCerrar = UIAlertAction(title: "Cerrar", style: .destructive)
        alerta.addAction(accionCerrar)
        present(alerta, animated: true)
    }
}

