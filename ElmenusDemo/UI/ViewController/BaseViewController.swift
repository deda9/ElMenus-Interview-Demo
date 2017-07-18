//
//  BaseViewController.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import ReachabilitySwift

class BaseViewController: UIViewController {
    
    var dialogFullScreenView: UIView?
    var dialogLoadingGroup: STLoadingGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func showProgressDialog(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        if !(dialogFullScreenView?.isDescendant(of: self.view))!{
            self.view.addSubview(dialogFullScreenView!)
            dialogFullScreenView?.fillScreenLayoutConstrains()
        }
        
        dialogLoadingGroup?.show(dialogFullScreenView)
        dialogLoadingGroup?.startLoading()
    }
    
    public func hideProgressDialog(){
        dialogLoadingGroup?.stopLoading()
        dialogFullScreenView?.removeFromSuperview()
    }
    
    func setScreeenTitle(){
        navigationItem.title = "Menus"
    }
    
    public func showErrorMessage(_ message: String){
        UIHelper.showErrorMessage(message)
    }
    
    public func showInfoMessage(_ message: String){
        UIHelper.showInfoMessage(message)
    }
    
    public func isNetworkConnected() -> Bool{
        let reachability = Reachability()!
        return reachability.isReachable
    }
    
    public func showNoNetworkConnectedMessage(){
        UIHelper.showErrorMessage("There is no network connection right now, try again later")
    }


}

