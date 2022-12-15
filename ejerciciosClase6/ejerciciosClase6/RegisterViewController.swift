//
//  RegisterViewController.swift
//  ejerciciosClase6
//
//  Created by sebas  on 7/12/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    enum EstadoFormulario {
        case correoValido, contraseñaValida, confirmacionContraseñaValida, correoVacio, contraseñaVacia, confirmarContraseñaNoCoinside, confirmarContraseñaVacio, correoYaEstaRegistrado
    }
    
    struct Constant {
        static let correoResgistrado = "test@test.com"
        static let correoYaExiste = "Correo Ya Existe"
        static let usuaruioRegistradoCorrectamente = "Usuario Registrado Correctamente"
        static let contraseñasNoCoinsiden = "Contraseñas No Coinsiden"
        static let diligenciarCorreo = "Diligenciar Correo"
        static let diligenciarContraseña = "Diligenciar Contraseña"
        static let diligenciarConfirmacionContraseña = "Diligenciar Confirmacion Contraseña"
        static let diligenciarCorreoYContraseña = "Diligenciar Correo y Contraseña"
        static let diligenciarCamposDeColorRojo = "Diligenciar Campos De Color Rojo"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var outletButtonCrear: UIButton!
    
    var correo: String?
    var contraseña: String!
    var confirmacionContraseña: String!
    var mensajeDeResultado: String!
    
    var resultadosDeValidacion: [EstadoFormulario] = []
    
    
    @IBAction func crearButtonAction(_ sender: UIButton) {
        limpiarResultadosDeValidacion()
        extraerDatos()
        validacioCorreoContraseñaYConfirmacionContraseña()
        procesarResultadosValidacion()
    }
    
    func validacioCorreoContraseñaYConfirmacionContraseña(){
        validarCorreo()
        validarContraseña()
        validarConfirmacionContraseña()
    }
    
    func limpiarResultadosDeValidacion() {
        resultadosDeValidacion = []
    }
    
    func extraerDatos() {
        correo = emailTextField.text ?? ""
        contraseña = passwordTextField.text ?? ""
        confirmacionContraseña = confirmPasswordTextField.text ?? ""
    }
    
    func validarCorreo() {
        if let correoSeguro = correo {
            if correoSeguro.isEmpty {
                resultadosDeValidacion.append(.correoVacio)
            } else if correo == Constant.correoResgistrado {
                resultadosDeValidacion.append(.correoYaEstaRegistrado)
            } else {
                resultadosDeValidacion.append(.correoValido)
            }
        }
    }
    
    func validarContraseña() {
        resultadosDeValidacion.append(contraseña.isEmpty ? .contraseñaVacia : .contraseñaValida)
    }
    
    func validarConfirmacionContraseña() {
        if confirmacionContraseña.isEmpty {
            resultadosDeValidacion.append(.confirmarContraseñaVacio)
        } else if confirmacionContraseña != contraseña {
            resultadosDeValidacion.append(.confirmarContraseñaNoCoinside)
        } else {
            resultadosDeValidacion.append(.confirmacionContraseñaValida)
        }
    }
    
    func procesarResultadosValidacion() {
        determinarColoresCamposDeFormulario()
        definirMensajeDeResultado()
        pintarResultadoEnPantalla()
    }
    
    func determinarColoresCamposDeFormulario() {
        determinarColorCampoDeCorreo()
        determinarColorCampoDeContraseña()
        determinarColorCampoDeConfirmacionContraseña()
    }
    
    func determinarColorCampoDeCorreo() {
        emailTextField.backgroundColor = resultadosDeValidacion.contains(.correoValido) ? .systemBackground : .red
    }
    
    func determinarColorCampoDeContraseña() {
        passwordTextField.backgroundColor = resultadosDeValidacion.contains(.contraseñaValida) ? .systemBackground : .red
    }
    
    func determinarColorCampoDeConfirmacionContraseña() {
        confirmPasswordTextField.backgroundColor = resultadosDeValidacion.contains(.confirmacionContraseñaValida) ? .systemBackground : .red
    }
    
    func definirMensajeDeResultado() {
        if resultadosDeValidacion.contains([.correoValido, .contraseñaValida, .confirmacionContraseñaValida]) {
            mensajeDeResultado = Constant.usuaruioRegistradoCorrectamente
        } else if resultadosDeValidacion.contains([.correoValido, .contraseñaValida, .confirmarContraseñaNoCoinside]) {
            mensajeDeResultado = Constant.contraseñasNoCoinsiden
        } else if resultadosDeValidacion.contains([.correoVacio, .contraseñaValida, .confirmacionContraseñaValida]) {
            mensajeDeResultado = Constant.diligenciarCorreo
        } else if resultadosDeValidacion.contains([.correoValido, .contraseñaVacia, .confirmarContraseñaVacio]) {
            mensajeDeResultado = Constant.diligenciarContraseña
        } else if resultadosDeValidacion.contains([.correoValido, .contraseñaValida, .confirmarContraseñaVacio]) {
            mensajeDeResultado = Constant.diligenciarConfirmacionContraseña
        } else if resultadosDeValidacion.contains([.confirmacionContraseñaValida, .correoVacio, .contraseñaVacia]) {
            mensajeDeResultado = Constant.diligenciarCorreoYContraseña
        } else if resultadosDeValidacion.contains([.correoYaEstaRegistrado, .confirmacionContraseñaValida, .contraseñaValida]) {
            mensajeDeResultado = Constant.correoYaExiste
        } else if resultadosDeValidacion.contains([.correoYaEstaRegistrado, .contraseñaVacia, .confirmarContraseñaVacio]) {
            mensajeDeResultado = Constant.correoYaExiste
        } else if resultadosDeValidacion.contains([.correoValido, .contraseñaVacia, .contraseñaVacia]) {
            mensajeDeResultado = Constant.diligenciarContraseña
        } else if resultadosDeValidacion.contains([.correoVacio, .contraseñaVacia, .confirmacionContraseñaValida]) {
            mensajeDeResultado = Constant.diligenciarCorreoYContraseña
        } else if resultadosDeValidacion.contains([.correoVacio, .contraseñaVacia, .confirmarContraseñaVacio]) {
            mensajeDeResultado = Constant.diligenciarCamposDeColorRojo
        } else {
            mensajeDeResultado = Constant.diligenciarCamposDeColorRojo
        }
    }
    
    func pintarResultadoEnPantalla() {
        resultLabel.text = mensajeDeResultado
    }
}
