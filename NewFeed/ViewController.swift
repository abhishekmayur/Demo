//
//  ViewController.swift
//  NewFeed
//
//  Created by Abhishek Dhamdhere on 12/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsApi(q:"apple", from: "2021-07-1", to: "2021-07-11",apiKey:"e2436911e93944d099d7499f2b417c6e")
    }
    // MARK: -   Manual newsApi method
    func newsApi(q:String,from:String,to:String,apiKey:String)
    {
        print("api call")
        //self.activityIndicator.showLoader()
        //let branch_id:String = "1"
        let param = ["q":q,"from":from,"to":to,"apiKey":apiKey] as? [String : AnyObject]
        
        let api:APIEngine = APIEngine()
        api.newsFeedAPI(param:param!){ responseObject, error in
            
            switch responseObject?.result  {
            case .success(let JSON)?:
                print("Success with JSON: \(JSON)")
               let jsonResponse = JSON
                
                if (jsonResponse["status"].stringValue == "true") {
                   
                   // self.view.makeToast(jsonResponse["message"].stringValue,position:.center)
                //    Helper.sharedInstance.showAlert(title: "Alert", message:"Login Succesfull" )
                }
                else
                {
                  //  self.view.makeToast(jsonResponse["message"].stringValue,position:.center)
//                    self.view.makeToast("Invalid Credential")
//                    self.activityIndicator.hideLoader()
                   // Helper.sharedInstance.showAlert(title: "Alert", message:"Inavlid Credential" )
                }
            case.failure(let error)?:
                print("error: \(error)")
//                self.activityIndicator.hideLoader()
//                self.view.makeToast("Invalid Credential")
                
               // Helper.sharedInstance.showAlert(title:
                
            case .none:
                print("error: ")
            }
        }
    }

    //news feed api - https://newsapi.org/v2/everything
}

