//
//  TemperatureConversionViewController.swift
//  ejerciciosClase6
//
//  Created by sebas  on 7/12/22.
//

import UIKit

class TemperatureConversionViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldCelciusAFahrenheit: UITextField!
    @IBOutlet weak var textFieldFahrenheitACelcius: UITextField!
    @IBOutlet weak var labelResultFahrenheit: UILabel!
    @IBOutlet weak var labelResultCelcius: UILabel!
    
    struct Constant {
        static let enterValueToCalculate = "ingrese valor"
        static let characterDegreesFahrenheit = "\u{2109}"
        static let characterDegreesCelsius = "\u{2103}"
        static let segueName = "navegarHaciaInicioSeccion"
    }
    
    @IBAction func onLogoutButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func convertToFahrenheitButton(_ sender: UIButton) {
        convertCelsiusToFahrenheit()
    }
    
    @IBAction func convertToCelciusButton(_ sender: UIButton) {
        convertFahrenheitToCelsius()
    }
    
    func convertCelsiusToFahrenheit() {
        if let celciusTemperature = Double(textFieldCelciusAFahrenheit.text!){
            labelResultFahrenheit.text = "\((celciusTemperature * 9) / 5 + 32) \(Constant.characterDegreesFahrenheit)"
        } else {
            labelResultFahrenheit.text = Constant.enterValueToCalculate
        }
    }
    
    func convertFahrenheitToCelsius() {
        if let fahrenheitTemperature = Double(textFieldFahrenheitACelcius.text!){
            labelResultCelcius.text = "\((fahrenheitTemperature - 32 ) * 5 / 9) \(Constant.characterDegreesCelsius)"
        } else {
            labelResultCelcius.text = Constant.enterValueToCalculate
        }
    }
}


