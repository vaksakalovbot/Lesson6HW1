//
//  FirstScreenViewController.swift
//  Lesson6HW1
//
//  Created by Vladimir on 05/06/2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 1.0, alpha: 1.0)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showColorChangeSegue" {
            var dummyAlpha: CGFloat = 0.0
            let colorChangeVC = segue.destination as! ColorChangeViewController
            colorChangeVC.delegate = self
            colorChangeVC.currentR = 1.0
            colorChangeVC.currentG = 1.0
            colorChangeVC.currentB = 1.0
            if let _ = view.backgroundColor {
            view.backgroundColor?.getRed(&colorChangeVC.currentR, green: &colorChangeVC.currentG, blue: &colorChangeVC.currentB, alpha: &dummyAlpha)
            }
        }
    }

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showColorChangeSegue", sender: nil)
    }
}

extension FirstScreenViewController: ChangeColorDelegate {
    func changeColor(redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat) {
        view.backgroundColor = UIColor(red: redValue, green:greenValue, blue: blueValue, alpha: 1.0)
        }
}


