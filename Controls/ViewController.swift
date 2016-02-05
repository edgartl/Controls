//
//  ViewController.swift
//  Controls
//
//  Created by Tom Edgar on 2/3/16.
//  Copyright © 2016 Tom Edgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var numberField: UITextField!
  @IBOutlet weak var sliderLabel: UILabel!
  @IBOutlet weak var leftSwitch: UISwitch!
  @IBOutlet weak var rightSwitch: UISwitch!
  @IBOutlet weak var doSomethingButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    sliderLabel.text = "50"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func textFieldDoneEditing(sender: UITextField) {
    sender.resignFirstResponder()
  }
  
  @IBAction func backgroundTap(sender: UIControl) {
    nameField.resignFirstResponder()
    numberField.resignFirstResponder()
  }
  @IBAction func sliderChanged(sender: UISlider) {
    let progress = lroundf(sender.value)
    sliderLabel.text = "\(progress)"
  }
  @IBAction func switchChanged(sender: UISwitch) {
    let setting = sender.on
    leftSwitch.setOn(setting, animated: true)
    rightSwitch.setOn(setting, animated: true)
  }
  
  @IBAction func toggleControls(sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      leftSwitch.hidden = false
      rightSwitch.hidden = false
      doSomethingButton.hidden = true
    } else {
      leftSwitch.hidden = true
      rightSwitch.hidden = true
      doSomethingButton.hidden = false
    }
  }
  @IBAction func buttonTapped(sender: AnyObject) {
    
    let actionController = UIAlertController(title: "Are you Sure?", message: nil, preferredStyle: .ActionSheet)
    
    let yesAction = UIAlertAction(title: "Yes, I'm Sure", style: .Destructive, handler: {
      action in let msg = self.nameField.text!.isEmpty ?
      "You can breathe easy, everything went OK." :
      "You can breathe easy, \(self.nameField.text)," + "Everything went OK."
      
      let alertController = UIAlertController(title: "Something was done", message: msg, preferredStyle: .Alert)
      let cancelAction = UIAlertAction(title: "Phew", style: .Cancel, handler: nil)
      alertController.addAction(cancelAction)
      self.presentViewController(alertController, animated: true, completion: nil)
    })
    
    let noAction = UIAlertAction(title: "No Way!", style: .Cancel, handler: nil)
    
    actionController.addAction(yesAction)
    actionController.addAction(noAction)
    
    if let ppc = actionController.popoverPresentationController {
      ppc.sourceView = sender as? UIView
      ppc.sourceRect = sender.bounds
    }
    
    presentViewController(actionController, animated: true, completion: nil)
}
}
