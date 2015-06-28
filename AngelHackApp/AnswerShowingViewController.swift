//
//  AnswerShowingViewController.swift
//
//
//  Created by Alvin Varghese on 27/Jun/15.
//
//

import UIKit
import AVFoundation

class AnswerShowingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIWebViewDelegate, UIScrollViewDelegate {
    
    //MARK: Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var descriptionForTheAnser: UITextView!
    @IBOutlet var questionTitleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: Local Variables
    
    var questionTitle : String = String()
    var questionDescription : String = String()
    
    var imagesAndVideosURLs : [String] = ["http://www.youtube.com","https://s-media-cache-ak0.pinimg.com/originals/90/ee/8c/90ee8c7d852e53327dbde9fc252cf023.gif","https://www.youtube.com/watch?t=27&v=XxJxPSx_zOk","http://www.google.com"]
    var imagesAndVideosURLsContentTitle : [String] = ["Yoututbe Content","An Image","Youtube Video","Website"]

    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Question Title
        
        self.questionTitleLabel.text = self.questionTitle
        
        // Question Description

        self.descriptionForTheAnser.text = self.questionDescription
        self.descriptionForTheAnser.scrollEnabled = true
        
        // BackButton
        
        self.backButton.setTitle("\u{F060}", forState: UIControlState.Normal)
        self.backButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.backButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        self.backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("speakOutThisText"), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        self.pageControl.numberOfPages = self.imagesAndVideosURLs.count
        return self.imagesAndVideosURLs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell : AnswerViewsCollectionViewCell =  self.collectionView.dequeueReusableCellWithReuseIdentifier("answerViewCell", forIndexPath: indexPath) as! AnswerViewsCollectionViewCell
        
        
        cell.layer.borderColor = UIColor.lightTextColor().CGColor
        cell.layer.borderWidth = 1

        // UIWebView
        
         cell.webViewForVideosAndImages.delegate = self
         cell.webViewForVideosAndImages.loadRequest(NSURLRequest(URL: NSURL(string: self.imagesAndVideosURLs[indexPath.row])!))
         cell.webViewForVideosAndImages.mediaPlaybackRequiresUserAction = true
         cell.webViewForVideosAndImages.scalesPageToFit = true
         cell.webViewForVideosAndImages.contentMode = UIViewContentMode.ScaleAspectFit
        
        // contentTitle
        
        cell.contentTitle.text = self.imagesAndVideosURLsContentTitle[indexPath.row]
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return kSectionCountNumber
    }
    
    //MARK: UIWebView Delegate
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        return true
    }
    func webViewDidStartLoad(webView: UIWebView)
    {
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError)
    {
    }
    
    //MARK: back button clicked
    
    @IBAction func backButtonClicked(sender: UIButton) {
        self.synthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: UIScrollViewDelegate Methods
    
     func scrollViewDidScroll(scrollView: UIScrollView) // any offset changes
     {
        let currentPage : Int  = Int(self.collectionView.contentOffset.x) / Int(self.collectionView.frame.size.width)
        self.pageControl.currentPage = currentPage
        
        
     }
    
    //MARK: Text to Speech
    
    let synthesizer : AVSpeechSynthesizer = AVSpeechSynthesizer()

    func speakOutThisText()
    {
        let utterence : AVSpeechUtterance = AVSpeechUtterance(string: self.descriptionForTheAnser.text)
        utterence.rate = 0.1
        self.synthesizer.speakUtterance(utterence)
    }
}










