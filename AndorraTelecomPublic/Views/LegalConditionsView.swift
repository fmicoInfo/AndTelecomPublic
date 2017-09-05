//
//  LegalConditionsView.swift
//  AndorraTelecomPublic
//
//  Created by Francisco Mico on 19/08/2017.
//  Copyright © 2017 Liferay. All rights reserved.
//

import UIKit
import LiferayScreens

class LegalConditionsView: UIView, PortletDisplayScreenletDelegate {

    @IBOutlet var view: UIView!
    
    @IBOutlet var portletDisplayScreenlet: PortletDisplayScreenlet!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("LegalConditionsView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = frame
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        loadPortletScreenlet()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("LegalConditionsView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    func loadPortletScreenlet() {
        let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: LanguageHelper.shared().url(page: .legal))
            .set(webType: .other)
            .addCss(localFile: "legal")
            .addJs(localFile: "legal")
            .load()
        
        portletDisplayScreenlet.backgroundColor = .clear
        portletDisplayScreenlet.configuration = portletConfiguration
        portletDisplayScreenlet.delegate = self
        portletDisplayScreenlet.load()
    }
    
    func screenlet(_ screenlet: PortletDisplayScreenlet,
                   onPortletError error: NSError){
        print("Legal Condition PDS Error: \(error)")
    }
    
}
