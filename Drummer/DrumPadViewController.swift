//
//  ViewController.swift
//  Drummer
//
//  Created by Paige Plander on 12/28/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import UIKit

class DrumPadViewController: UIViewController {
    
    let drummer = Drummer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// Informs the model that a drum pad has been pressed
    ///
    /// - Parameter sender: The button that was pressed
    @IBAction func didTapDrumButton(_ sender: UIButton) {
        drummer.playDrumSound(forDrumWithTag: sender.tag)
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        drummer.setDrumKitID(toValue: sender.selectedSegmentIndex)
    }
}

