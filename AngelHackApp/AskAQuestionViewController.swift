//
//  SettingsPageViewController.swift
//  
//
//  Created by Alvin Varghese on 27/Jun/15.
//
//

import UIKit

class AskAQuestionViewController : UIViewController {

    
    //MARK: Outelt
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var stephenButton: UIButton!
    @IBOutlet var natashaButton: UIButton!
    @IBOutlet var paulButton: UIButton!
    @IBOutlet var rosyButton: UIButton!
    
    @IBOutlet var submitButton: UIButton!
    //MARK: Local Variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        self.natashaButton.alpha = 0.4
        self.paulButton.alpha = 0.4
        self.rosyButton.alpha = 0.4
        self.stephenButton.alpha = 0.4

        // BackButton
        
        self.backButton.setTitle("\u{F060}", forState: UIControlState.Normal)
        self.backButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.backButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // Submit button
                
        self.submitButton.setTitle("\u{F05D}", forState: UIControlState.Normal)
        self.submitButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.submitButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.submitButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: Back button clicked

    
    @IBAction func backButtonClicked(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: submit button clicked

    @IBAction func submitButtonClicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    //MARK: clicked on a child - Action

    @IBAction func clickedOnAChild(sender: UIButton) {
        
        switch sender.tag
        {
        case 1 :
            
            self.natashaButton.alpha = 1.0
            self.paulButton.alpha = 0.4
            self.rosyButton.alpha = 0.4
            self.stephenButton.alpha = 0.4
            
        case 2 :
            
            self.natashaButton.alpha = 0.4
            self.paulButton.alpha = 1.0
            self.rosyButton.alpha = 0.4
            self.stephenButton.alpha = 0.4
            
        case 3 :
            
            self.natashaButton.alpha = 0.4
            self.paulButton.alpha = 0.4
            self.rosyButton.alpha = 1.0
            self.stephenButton.alpha = 0.4
        default :
            
            self.natashaButton.alpha = 0.4
            self.paulButton.alpha = 0.4
            self.rosyButton.alpha = 0.4
            self.stephenButton.alpha = 1.0
        }

    }
    
}









