//
//  MapViewController.swift
//  AndorraTelecomPublic
//
//  Created by Francisco Mico on 19/08/2017.
//  Copyright © 2017 Liferay. All rights reserved.
//

import UIKit
import LiferayScreens

class MapViewController: UIViewController {
    
    @IBOutlet var portletDisplayScreenlet: PortletDisplayScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadPortletScreenlet()
    }
    
    func loadPortletScreenlet() {
        let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: LanguageHelper.shared().url(page: .map))
            .set(webType: .other)
            .addCss(localFile: "map")
            .addJs(localFile: "map")
            .load()
        portletDisplayScreenlet.configuration = portletConfiguration
        
        portletDisplayScreenlet.backgroundColor = UIColor(red:0.83, green:0.02, blue:0.45, alpha:1.0)
        
        portletDisplayScreenlet.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
