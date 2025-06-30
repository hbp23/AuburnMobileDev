//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by Harsh Patel on 6/29/25.
//

import Foundation

struct ConverterLogic {
    
    enum ConvertError: Error {
        case invalidInput(reason: String)
    }
    
    var usdValue: Int = 0
    var pesoSwitchValue: Bool = true
    var rupeeSwitchValue: Bool = false
    var dollarSwitchValue: Bool = false
    var yenSwitchValue: Bool = false
    var invalidInputError: Bool = false
    var unknownError: Bool = false
    var errorMessage: String = ""
    var pesoAmount = ""
    var rupeeAmount = ""
    var dollarAmount = ""
    var yenAmount = ""
    
    mutating func setPesoSwitch(_ switchValue: Bool) {
        if switchValue { pesoSwitchValue = true }
        else { pesoSwitchValue = false }
    }
    
    mutating func setRupeeSwitch(_ switchValue: Bool) {
        if switchValue { rupeeSwitchValue = true }
        else { rupeeSwitchValue = false }
    }
    
    mutating func setDollarSwitch(_ switchValue: Bool) {
        if switchValue { dollarSwitchValue = true }
        else { dollarSwitchValue = false }
    }
    
    mutating func setYenSwitch(_ switchValue: Bool) {
        if switchValue { yenSwitchValue = true }
        else { yenSwitchValue = false }
    }
    
    func setTextFieldValueAsInt (_ field: String) throws -> Int {
        guard let value = Int(field) else {
            throw ConvertError.invalidInput(reason: "Please enter a valid value. Integer only!") }
        return value
    }
    
    mutating func setUsdValue(_ field: String) {
        do {
            invalidInputError = false
            unknownError = false
            errorMessage = ""
            usdValue = try setTextFieldValueAsInt(field)
        } catch ConvertError.invalidInput(let reason) {
            invalidInputError = true
            errorMessage = reason
        } catch {
            unknownError = true
            errorMessage = "Unknown error has occured"
        }
    }
    
    mutating func calculateConversions() {
        if pesoSwitchValue { pesoAmount = String(format: "%.2f", Double(usdValue) * 18.81) }
        if rupeeSwitchValue { rupeeAmount = String(format: "%.2f", Double(usdValue) * 85.43) }
        if dollarSwitchValue { dollarAmount = String(format: "%.2f", Double(usdValue) * 1.37) }
        if yenSwitchValue { yenAmount = String(format: "%.2f", Double(usdValue) * 144) }
    }
    
    func getUsdValue() -> String {
        return String(usdValue)
    }
    
    func getInvalidInputError() -> Bool {
        return invalidInputError
    }
     
    func getUnknownError() -> Bool {
        return unknownError
    }
    
    func getPesoSwitchValue() -> Bool {
        return pesoSwitchValue
    }
    
    func getRupeeSwitchValue() -> Bool {
        return rupeeSwitchValue
    }
    
    func getDollarSwitchValue() -> Bool {
        return dollarSwitchValue
    }
    
    func getYenSwitchValue() -> Bool {
        return yenSwitchValue
    }
    
    func getErrorMessage() -> String {
        return errorMessage
    }
    
    func getPesoAmount() -> String {
        return pesoAmount
    }
    
    func getRupeeAmount() -> String {
        return rupeeAmount
    }
    
    func getDollarAmount() -> String {
        return dollarAmount
    }
    
    func getYenAmount() -> String {
        return yenAmount
    }

}
