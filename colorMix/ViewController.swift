//
//  ViewController.swift
//  colorMix
//
//  Created by Lindsey on 4/27/23.
//

import UIKit

class ViewController: UIViewController {

    //  MARK: - IB (Interface Builder) Outlets
    
    @IBOutlet weak var ColorView: UIView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    //  MARK: - Instance Properties
    
    
    
    //  MARK: - VDL (View Did Load)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ColorView.layer.borderWidth = 5
        // ColorView.layer.cornerRadius = 20
        // ColorView.layer.borderColor = UIColor.black.cgColor
     
        updateUI()
        ColorView.backgroundColor = .white
        updateSliderControls()
        
    }

    // MARK: - IB (Interface Builder) Actions
    
    @IBAction func switchState(_ sender: UISwitch) {
        updateUI()
        updateSliderControls()
    }
    
    // TODO: - create action for slider
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateUI()
    }
    
    //create the reset() instance method before calling it here
    @IBAction func resetButtonTapped(_ sender: Any) {
        reset()
        updateUI()
        updateSliderControls()
    }
    
    
    // MARK: - Instance Methods
    
    func updateUI(){
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            // red = 1
            red = CGFloat(redSlider.value)
            redLabel.text = "Red = \(redSlider.value)"
        }
        
        if greenSwitch.isOn {
            // green = 1
            green = CGFloat(greenSlider.value)
            greenLabel.text = "Green = \(greenSlider.value)"
        }
            
        if blueSwitch.isOn {
           // blue = 1
            blue = CGFloat(blueSlider.value)
            blueLabel.text = "Blue = \(blueSlider.value)"
        }
        
        // this is the value that colorView will access to make that view aware of our colors
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        // assign color to the colorView
        ColorView.backgroundColor = color
                
        
        }
    
    func reset(){
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
       
        updateUI()
        ColorView.backgroundColor = .white
        
    }
    
    //prevents sliders from working when corresponding switch is off
   
    func updateSliderControls(){
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    }
    

