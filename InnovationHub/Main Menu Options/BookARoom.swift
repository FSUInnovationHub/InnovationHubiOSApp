//
//  BookARoom.swift
//  Innovation Hub
//
//  Created by Andres Ibarra on 2/11/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit
import WebKit

var websiteURL = "https://fsu.libcal.com/booking/"
var bookingRoute = websiteURL

class BookARoom: UIViewController, WKUIDelegate, WKNavigationDelegate{

    @IBOutlet var returnButton: UIButton!
    
    @IBOutlet var bookingWebView: WKWebView!
    
    //this is for loading up the webview so the user doesn't think the application crashed!
    var lblMessage: UILabel!
    var vwProgressPopup: UIView!
    var progressActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up the webview and activity indicator
        lblMessage = UILabel(frame: CGRect(x: 50, y: 0, width: 240, height: 50))
        vwProgressPopup = UIView(frame: CGRect(x: self.bookingWebView.frame.width/4.5, y: self.bookingWebView.frame.height/4, width: 240, height: 50))
        progressActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        
        bookingWebView.uiDelegate = self
        bookingWebView.navigationDelegate = self
        
        let myURL = URL(string: bookingRoute)
        let myRequest = URLRequest(url: myURL!)
        bookingWebView.load(myRequest)
        showProgress(msg: "Loading Webpage", withIndicator: true, remove: false)
        //done setting up activity Indicator and Webview
        
        //return button rounded
        returnButton.layer.borderWidth = 2
        returnButton.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        returnButton.layer.cornerRadius = 15
      
        
    }
    
    //Hides the progress indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        showProgress(msg: "Loading Webpage", withIndicator: true, remove: true)
    }

    
    //shows the progress indicator, and with the remove parameter, decides, whether it will display it or not
    func showProgress(msg: String, withIndicator: Bool, remove: Bool)
    {
        if !remove{
            lblMessage.text = msg
            lblMessage.textColor = UIColor.white
            vwProgressPopup.layer.cornerRadius = 15
            vwProgressPopup.backgroundColor = UIColor(white: 0, alpha: 0.7)
            if (withIndicator)
            {
                progressActivityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                progressActivityIndicator.startAnimating()
                vwProgressPopup.addSubview(progressActivityIndicator)
            }
            vwProgressPopup.addSubview(lblMessage)
            bookingWebView.addSubview(vwProgressPopup)
        }else{
            vwProgressPopup.removeFromSuperview()
        }
 
    }
 
    
}
