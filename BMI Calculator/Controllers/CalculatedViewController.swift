//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculatedViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalulatorBrain()
    var calculatedBMI = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    } //viewDidLoad
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format:"%0.2f", sender.value)
        heightLabel.text = "\(height)m"
    } //heightSliderChanged
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%0.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    } //weightSliderChanged
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    } //calculatePressed
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            // as! forced downcast
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        } //segue
    } //prepare
} //CalculatedViewController

