//
//  ViewController.swift
//  AngelHackApp
//
//  Created by Alvin Varghese on 27/Jun/15.
//  Copyright (c) 2015 iDreamCode. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Outlets
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var childName: UILabel!
    
    //MARK: Local Variables
    
    var userQuestions : [String] = ["Why Aren't There Any More Dinosaurs?","Why Are There So Many Languages in The World?","Why Don't We Want Others to See Our Private Parts?","Why Is That Man Homeless?","Why Do People Get Sick?"]
    
    var childNameForTitle : String =  String()
    
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // TableView
        
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.separatorInset = UIEdgeInsetsZero
        
        // BackButton
        
        self.backButton.setTitle("\u{F060}", forState: UIControlState.Normal)
        self.backButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.backButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // Child Name
        
        self.childName.text = self.childNameForTitle
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
        
        let cell : MainTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("mainTableViewCell", forIndexPath: indexPath) as! MainTableViewCell
        
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        // Questions suggested by the server
        
        cell.mainQuestionTItleLabel.text = self.userQuestions[indexPath.row]
        
        // Favorite
        
        cell.favoriteButotn.setTitle("\u{F08A}", forState: UIControlState.Normal)
        cell.favoriteButotn.titleLabel?.textAlignment = NSTextAlignment.Center
        cell.favoriteButotn.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        
        cell.favoriteButotn.addTarget(self, action: Selector("favoriteButtonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        cell.favoriteButotn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // Likes
        
        cell.likesButton.addTarget(self, action: Selector("likesButtonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        cell.likesButton.setTitle("\u{F164} \(self.currentLikesForAQuestion)", forState: UIControlState.Normal)
        cell.likesButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        cell.likesButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cell.likesButton.backgroundColor = UIColor.whiteColor()
        cell.likesButton.layer.cornerRadius = 9
        cell.likesButton.clipsToBounds = true
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.userQuestions.count
    }
    
    // Favorite Button Clicked - Action performed here
    
    var flagForCheckingWhetherQusetionIsFavoriteOrNot : Bool = false
    
    func favoriteButtonClicked(sender : UIButton)
    {
        if self.flagForCheckingWhetherQusetionIsFavoriteOrNot
        {
            // Un- Favourited
            
            sender.setTitle("\u{F08A}", forState: UIControlState.Normal)
            sender.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            self.flagForCheckingWhetherQusetionIsFavoriteOrNot = false
        }
        else
        {
            // Favourited
            
            sender.setTitle("\u{F004}", forState: UIControlState.Normal)
            sender.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            self.flagForCheckingWhetherQusetionIsFavoriteOrNot = true
        }
    }
    
    // Likes Button Clicked - Action performed here
    
    var currentLikesForAQuestion : Int = 41
    var flagForCheckingWhetherQusetionIsLikedOrNot : Bool = false
    
    
    func likesButtonClicked(sender : UIButton)
    {
        if self.flagForCheckingWhetherQusetionIsLikedOrNot
        {
            // Increase the total likse plus one
            
            self.currentLikesForAQuestion =  self.currentLikesForAQuestion - 1
            
            sender.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            sender.backgroundColor = UIColor.whiteColor()
            
            self.flagForCheckingWhetherQusetionIsLikedOrNot = false
        }
        else
        {
            // Increase the total likse plus one
            
            self.currentLikesForAQuestion =  self.currentLikesForAQuestion + 1
            
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            sender.backgroundColor = UIColor.blackColor()
            
            self.flagForCheckingWhetherQusetionIsLikedOrNot = true
        }
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let viewControllerToPresent : AnswerShowingViewController = Utilities.sharedInstance.getViewController("AnswerShowingVC", mainStoryBoardName: "Main") as! AnswerShowingViewController
        
        viewControllerToPresent.questionTitle = self.userQuestions[indexPath.row]
        
        viewControllerToPresent.questionDescription = "Tell your kid About 65 million years ago an enormous asteroid collided with the earth and changed everything on the planet. The dinosaurs couldn't adapt and eventually died out, making way for new animals, ones that were better suited to this other climate"
        
        viewControllerToPresent.imagesAndVideosURLs = ["http://www.youtube.com","https://s-media-cache-ak0.pinimg.com/originals/90/ee/8c/90ee8c7d852e53327dbde9fc252cf023.gif","https://www.youtube.com/watch?t=27&v=XxJxPSx_zOk","http://www.google.com"]

        self.presentViewController(viewControllerToPresent, animated: true, completion: nil)
    }
    
    //MARK: back button clicked
    
    @IBAction func backButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

















