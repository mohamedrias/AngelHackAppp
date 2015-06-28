//
//  StartingPageViewController.swift
//  
//
//  Created by Alvin Varghese on 27/Jun/15.
//
//

import UIKit

class StartingPageViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var askQuestionButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    
    //MARK: Local Variabls
    
    let qusetionsForTheParent : [String] = ["Why Aren't There Any More Dinosaurs?","Why Are There So Many Languages in The World?","where do babies come from?","WHY DON'T ALL FISH DIE WHEN LIGHTNING HITS THE SEA?"]
    
    let childrenImages : [UIImage] = [UIImage(named: "natasha")!, UIImage(named: "stephen")!,UIImage(named: "rosy")!,UIImage(named: "paul")!] // images
    let dummyImages : [UIImage] = [UIImage(named: "dinosaur")!, UIImage(named: "language")!,UIImage(named: "baby")!,UIImage(named: "fish")!] // images

    let childrenNames : [String] = ["Natasha","Stephen","Rosy","Paul"] // images

    //MARK: viewDidLoad

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Settings button
        
        self.settingsButton.setTitle("\u{F013}", forState: UIControlState.Normal)
        self.settingsButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.settingsButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.settingsButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // Ask a question
        
        self.askQuestionButton.setTitle("\u{F067}", forState: UIControlState.Normal)
        self.askQuestionButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.askQuestionButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.askQuestionButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return kSectionCountNumber
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.qusetionsForTheParent.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell : StartinPgaeCollectionViewCell =  self.collectionView.dequeueReusableCellWithReuseIdentifier("startingPageCell", forIndexPath: indexPath) as! StartinPgaeCollectionViewCell
        
        
       // cell.layer.borderWidth = 1.0
       // cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Question of the fay
        
        cell.questionTitle.text = self.qusetionsForTheParent[indexPath.row].lowercaseString
        
        // Name
        
        // cell.originalChildrenName.text  = "\u{F178} \(self.childrenNames[indexPath.row])"
        // cell.originalChildrenName.font  = UIFont(name: "FontAwesome", size: 17)
        
        cell.dummyImage.image = self.dummyImages[indexPath.row]

        // Image

        cell.childName.tag = indexPath.row
        cell.childName.contentMode = UIViewContentMode.ScaleAspectFill
        cell.childName.setBackgroundImage(self.childrenImages[indexPath.row], forState: UIControlState.Normal)
        cell.childName.addTarget(self, action: Selector("openQuestionsFeed:"), forControlEvents: UIControlEvents.TouchUpInside)
        cell.childName.layer.cornerRadius = cell.childName.frame.size.width / 2
        cell.childName.clipsToBounds = true
        
        
        return cell
    }
    
    // Clicked on child
    
    func openQuestionsFeed(sender : UIButton)
    {
        let viewControllerToPresent : ViewController = Utilities.sharedInstance.getViewController("MainViewController", mainStoryBoardName: "Main") as! ViewController
        
        viewControllerToPresent.childNameForTitle = self.childrenNames[sender.tag]
    
        self.presentViewController(viewControllerToPresent, animated: true, completion: nil)
    }
    
    //MARK: Settings Page Button Clicked
    
    @IBAction func settingsPageButtonClicked(sender: UIButton)
    {
        let viewControllerToPresent : SettingsPageViewController = Utilities.sharedInstance.getViewController("SettingsPageVC", mainStoryBoardName: "Main") as! SettingsPageViewController
        self.presentViewController(viewControllerToPresent, animated: true, completion: nil)
    }
    
    //MARK: Ask Questions Page button clicked
    
    @IBAction func askQuestionPageButtonClicked(sender: UIButton) {
        
        let viewControllerToPresent : AskAQuestionViewController = Utilities.sharedInstance.getViewController("AskAQuestionViewC", mainStoryBoardName: "Main") as! AskAQuestionViewController
                
        self.presentViewController(viewControllerToPresent, animated: true, completion: nil)
        
    }
    
}













