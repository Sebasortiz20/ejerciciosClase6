//
//  SegundoViewController.swift
//  ejercicio2Clase6
//
//  Created by sebas  on 11/12/22.
//

import UIKit

class SegundoViewController: UIViewController {
    
    
    @IBOutlet weak var campoDeTextoCalificacion: UITextField!
    @IBOutlet weak var labelAlerta: UILabel!
    
    var numeroIngresado: Int!
    
    @IBAction func accionDelBotonCalificar(_ sender: Any) {
        extraerDatos()
        numerosValidos()
    }
    
    func extraerDatos() {
        numeroIngresado = Int(campoDeTextoCalificacion.text ?? "")
    }
    
    
    func numerosValidos() {
        switch numeroIngresado!{
        
        case 1...5 :
            cerrarVista()
        default:
            pintarAlerta()
        }
    }
    
    func pintarAlerta() {
        let alerta = UIAlertController(title: "Numero No Valido", message: "Ingrese Un Numero De 1 a 5", preferredStyle: .alert)
        let accionCorregir = UIAlertAction(title: "Corregir", style: .destructive)
        alerta.addAction(accionCorregir)
        present(alerta, animated: true)
    }
    
    func cerrarVista() {
        navigationController?.popViewController(animated: true)
    }
}

