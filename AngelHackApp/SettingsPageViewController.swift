//
//  SettingsPageViewController.swift
//  
//
//  Created by Alvin Varghese on 27/Jun/15.
//
//

import UIKit

class SettingsPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: Outlets
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var parentImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    // Local Variables
    
    let childrenDOB : [String] = ["02-December-1999","12-January-2002","19-April-2004","07-June-2007"]
    let childrenImages : [UIImage] = [UIImage(named: "natasha")!, UIImage(named: "stephen")!,UIImage(named: "rosy")!,UIImage(named: "paul")!] // images
    let childrenNames : [String] = ["Natasha","Stephen","Rosy","Paul"] // images

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        // table View
        
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.separatorInset = UIEdgeInsetsZero
        
        // BackButton
        
        self.backButton.setTitle("\u{F060}", forState: UIControlState.Normal)
        self.backButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.backButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // Add Child Button
        
        self.addButton.setTitle("\u{F0C0}", forState: UIControlState.Normal)
        self.addButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.addButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.addButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: UITableViewDataSource
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell :  SettingsPageTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("SettingsPageTableViewCell", forIndexPath: indexPath) as! SettingsPageTableViewCell
        
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        
        // Children Names
        
        cell.childName.text = self.childrenNames[indexPath.row]
        
        // Children Photos
        
        cell.childPhoto.image = self.childrenImages[indexPath.row]
        
        // Children DOB
        
        cell.childDOB.text = self.childrenDOB[indexPath.row]

       
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.childrenNames.count
    }
    
    //MARK: Add Child - Action goes here
    
    @IBAction func addButtonClicked(sender: UIButton) {
        
        
    }
    
    //MARK: Back button - Action goes here

    @IBAction func backButtonClicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
