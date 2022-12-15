//
//  ViewController.swift
//  ejercicio2Clase6
//
//  Created by sebas  on 9/12/22.
//

import UIKit

class PrimerViewController: UIViewController {
    
    @IBOutlet weak var animalsImageView: UIImageView!
    @IBOutlet weak var nameAnimalsLabel: UILabel!
    
    struct Constantes {
        static let numeroDeElementosDelArray = 3
    }
    
    let nombres: [String] = ["Guacamaya", "Perro", "Leon"]
    let imagenes = [UIImage(named: "imageGuacamaya"), UIImage(named: "imagePerro"), UIImage(named: "imageLeon")]
    
    var contador = 1
    
    @IBAction func animalChangeActionButton(_ sender: Any) {
        updateCounter()
        showName()
        showImage()
    }
    
    func updateCounter () {
        contador = Int.random(in: 1 ... Constantes.numeroDeElementosDelArray)
    }
    
    func showName () {
        let indiceAPintar = contador - 1
        nameAnimalsLabel.text = nombres [indiceAPintar]
    }
    
    func showImage () {
        let imagenAPintar = contador - 1
        animalsImageView.image = imagenes [imagenAPintar]
    }
}
