//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Bobby Taylor on 2/15/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit
struct CalulatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue () -> String {
        let bmiTo1DecimalPlace = String (format: "%0.1f", bmi?.value ?? 0.0) // Chaining optional example
         return bmiTo1DecimalPlace
    } //getBMIValue
    
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmiValue = (weight / (height * height))
        let bmiAdvice: String
        var bmiColor = UIColor.red
        let bmiUnderweight: Float = 18.5
        //let bmiNormalLow: Float = 18.5
        let bmiNormalHigh: Float = 24.9
        
        if bmiValue < bmiUnderweight {
            bmiAdvice = "Underweight"
            bmiColor = UIColor.blue
        } else if  bmiValue < bmiNormalHigh {
            bmiAdvice = "Normal"
            bmiColor = UIColor.green
        } else {
            bmiAdvice = "Overweight"
            bmiColor = UIColor.red
        } //else
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor)
    } //calculateBMI
    
    func getAdvice() -> String {
        print(bmi?.advice ?? "No Advice")
        return bmi?.advice ?? "No Advice"
    } //getAdvice
    
    func getColor() -> UIColor {
        print(bmi?.color ?? .red)
        return bmi?.color ?? .red
    } //getColor
    
    
} //CalulatorBrain
