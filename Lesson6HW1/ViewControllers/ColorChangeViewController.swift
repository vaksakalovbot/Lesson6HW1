//
//  ViewController.swift
//  Lesson2HW1
//
//  Created by vaksakalov on 23.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

protocol ChangeColorDelegate {
    func changeColor(redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat)
}

class ColorChangeViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var currentR : CGFloat!
    var currentG : CGFloat!
    var currentB : CGFloat!
    
    var delegate: ChangeColorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        initAllVariables()
        addDoneButtonToKeyboard()
        
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.cornerRadius = min(colorView.frame.height, colorView.frame.width) / 8
    }

    @IBAction func anySliderChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            currentR = CGFloat(redSlider.value)
            redValueLabel.text = String(format: "%.2f", currentR)
            redTextField.text = redValueLabel.text
        case greenSlider:
            currentG = CGFloat(greenSlider.value)
            greenValueLabel.text = String(format: "%.2f", currentG)
            greenTextField.text = greenValueLabel.text
        case blueSlider:
            currentB = CGFloat(blueSlider.value)
            blueValueLabel.text = String(format: "%.2f", currentB)
            blueTextField.text = blueValueLabel.text
        default:
            break
        }
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
        
    @IBAction func doneButtonPressed() {
        delegate.changeColor(redValue: currentR, greenValue: currentG, blueValue: currentB)
        dismiss(animated: true)
    }

    private func initAllVariables() {
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
        
        redTextField.text = redValueLabel.text
        greenTextField.text = greenValueLabel.text
        blueTextField.text = blueValueLabel.text

        redValueLabel.textColor = .red
        greenValueLabel.textColor = .green
        blueValueLabel.textColor = .blue
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }

    private func addDoneButtonToKeyboard() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneKeyboardPressed))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }
    
    func changeSlidersValues(_ textField: UITextField) {
        switch textField {
        case redTextField:
            if let curR = Float(textField.text ?? "") {
                currentR = CGFloat(curR)
                redSlider.value = curR
                redValueLabel.text = String(format: "%.2f", currentR)
            }
        case greenTextField:
            if let curG = Float(textField.text ?? "") {
                currentG = CGFloat(curG)
                greenSlider.value = curG
                greenValueLabel.text = String(format: "%.2f", currentG)
            }
        case blueTextField:
            if let curB = Float(textField.text ?? "") {
                currentB = CGFloat(curB)
                blueSlider.value = curB
                blueValueLabel.text = String(format: "%.2f", currentB)
            }
        default:
            break
        }
        
        colorView.backgroundColor = UIColor(red: currentR, green: currentG, blue: currentB, alpha: 1.0)
    }
    
    @objc func doneKeyboardPressed() {
        view.endEditing(true)
    }
}

extension ColorChangeViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField  ) {
        changeSlidersValues(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= 4
    }
}
