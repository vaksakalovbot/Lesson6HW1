//
//  ViewController.swift
//  Lesson2HW1
//
//  Created by vaksakalov on 23.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    private var currentR : CGFloat = 0.5
    private var currentG : CGFloat = 0.5
    private var currentB : CGFloat = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        redSlider.value = Float(currentR)
        
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.value = Float(currentG)
        
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        blueSlider.value = Float(currentB)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue

        redValueLabel.text = String(format: "%.2f", currentR)
        greenValueLabel.text = String(format: "%.2f", currentG)
        blueValueLabel.text = String(format: "%.2f", currentB)
        
        redValueLabel.textColor = .red
        greenValueLabel.textColor = .green
        blueValueLabel.textColor = .blue

        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.cornerRadius = min(colorView.frame.height, colorView.frame.width) / 8
    }

    @IBAction func redSliderChanged() {
        currentR = CGFloat(redSlider.value)
        redValueLabel.text = String(format: "%.2f", currentR)
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
    
    @IBAction func greenSliderChanged() {
        currentG = CGFloat(greenSlider.value)
        greenValueLabel.text = String(format: "%.2f", currentG)
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
    
    @IBAction func blueSliderChanged() {
        currentB = CGFloat(blueSlider.value)
        blueValueLabel.text = String(format: "%.2f", currentB)
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
}

