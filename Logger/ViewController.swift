//
//  ViewController.swift
//  Logger
//
//  Created by Varun V Nair on 25/12/22.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Log.info("test example")
        Log.error("test example")
        Log.warning("test example")
        
        if #available(iOS 14.0, *) {
            let logger = Logger.init(subsystem: "com.varun.loggingdemo", category: "main")
            logger.debug("Initializing networking object")

            logger.info("Initialized networking object")

            logger.notice("Networking object is currently nil")

            logger.error("An error occured initializing network object")

            logger.fault("Networking object has gone away prematurely")
        } else {
            // Fallback on earlier versions
        }
        
        
    }


}

