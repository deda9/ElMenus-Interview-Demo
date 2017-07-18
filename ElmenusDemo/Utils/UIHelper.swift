//
//  UIHelper.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/18/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

/*
 * Contain all the UI Utils methods
 */
public class UIHelper {
    
    /*
     * Show the success message
     */
    public static func showSuccessMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: "Success", body: message)
        
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    /*
     * Show the error message
     */
    public static func showErrorMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: "Error", body: message)
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    /*
     * show the info message
     */
    public static func showInfoMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.info)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: "Info", body: message)
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    /*
     * The configuration for the shown message
     */
    private static func getShowMessageConfig() -> SwiftMessages.Config{
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.dimMode = .gray(interactive: true)
        config.interactiveHide = true
        return config
    }
    
}
