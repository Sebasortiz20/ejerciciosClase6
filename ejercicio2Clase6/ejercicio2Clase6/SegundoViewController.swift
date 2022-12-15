//
//  SegundoViewController.swift
//  ejercicio2Clase6
//
//  Created by sebas  on 11/12/22.
//

import UIKit

class SegundoViewController: UIViewController {
    
    enum EstadoCampoDeTexto {
        case campoVacio, campoValido
    }
    
    @IBOutlet weak var campoDeTextoCalificacion: UITextField!
    @IBOutlet weak var labelAlerta: UILabel!
    
    var numeroIngresado: String?
    var resultadoDeValidacion: [EstadoCampoDeTexto] = []
    
    @IBAction func accionDelBotonCalificar(_ sender: Any) {
        extraerDatos()
        verificarSiElNumeroIngresadoEsValido()
        revisarCampoDeTextoVacio()
    }
    
    func extraerDatos() {
        numeroIngresado = campoDeTextoCalificacion.text ?? ""
    }
    
    func revisarCampoDeTextoVacio() {
        if let revisionCampo = numeroIngresado {
            if revisionCampo.isEmpty {
                resultadoDeValidacion.append(.campoVacio)
            } else {
                resultadoDeValidacion.append(.campoValido)
            }
        }
    }
    
    func verificarSiElNumeroIngresadoEsValido() {
        let numeroIngresadoInt = Int(numeroIngresado ?? "")
        switch numeroIngresadoInt ?? 0 {
        case 1...5 :
            cerrarVista()
        default :
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

