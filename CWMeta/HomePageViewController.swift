//
//  HomePageViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 8. 20..
//  Copyright (c) 2015년 김대호. All rights reserved.
//
import UIKit

class HomePageViewController
: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var naviBarImg: UIImageView!
    
    override func viewDidLoad() {
        
        let stringURL = "http://parm.kr"
        let requestURL = NSURL(string: stringURL)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            naviBarImg.frame.origin = CGPoint(x: naviBarImg.frame.origin.x * frameForWidth, y: naviBarImg.frame.origin.y * frameForHeight)
            webView.frame.origin = CGPoint(x: webView.frame.origin.x * frameForWidth, y: webView.frame.origin.y * frameForHeight)
            
            backBtn.frame.size = CGSizeMake(backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            naviBarImg.frame.size = CGSizeMake(naviBarImg.frame.width * frameForWidth,  naviBarImg.frame.height * frameForHeight)
            webView.frame.size = CGSizeMake(webView.frame.width * frameForWidth,  webView.frame.height * frameForHeight)
        }
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
