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
    
    //https://www.npmjs.com/package/cusspvz-cordova-plugin-mapbox

    @IBOutlet var portletDisplayScreenlet: PortletDisplayScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadPortletScreenlet()
    }
    
    func loadPortletScreenlet() {
        
        /*let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: html!)
            .set(webType: .liferay)
            .addCss(localFile: "forfet")
            .addJs(localFile: "forfet")
            .load()
        
        portletDisplayScreenlet.configuration = portletConfiguration
        
        portletDisplayScreenlet.load()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
