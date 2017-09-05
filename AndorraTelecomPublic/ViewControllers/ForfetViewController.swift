//
//  ForfetViewController.swift
//  AndorraTelecomPublic
//
//  Created by Francisco Mico on 08/08/2017.
//  Copyright © 2017 Liferay. All rights reserved.
//

import Foundation
import LiferayScreens

class ForfetViewController: UIViewController, PortletDisplayScreenletDelegate{
    
    var url: String = ""
    var menuList: String = ""
    
    @IBOutlet weak var portletDisplayScreenlet: PortletDisplayScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPortletScreenlet()
    }
    
    func loadPortletScreenlet() {
        let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: self.url)
            .set(webType: .other)
            .addCss(localFile: "forfet")
            .addJs(localFile: "forfet")
            .load()
        
        portletDisplayScreenlet.configuration = portletConfiguration
        
        portletDisplayScreenlet.backgroundColor = UIColor(red:0.83, green:0.02, blue:0.45, alpha:1.0)
        portletDisplayScreenlet.load()
        portletDisplayScreenlet.delegate = self
    }
    
    func createButtonMenuList() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "section".localized(), style: .plain, target: self, action: #selector(createMenuList))
    }
    
    func createMenuList() {
        let actionSheetController: UIAlertController = UIAlertController(title: "section".localized(), message: "choose".localized(), preferredStyle: .alert)
        
    
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel".localized(), style: .cancel) { action -> Void in
            actionSheetController.dismiss(animated: true, completion: nil)
        }
        
        let fullList = self.menuList.components(separatedBy: "|")
        
        for i in 0...fullList.count - 1 {
            var item = fullList[i].components(separatedBy: ",")
        
            let itemAction: UIAlertAction = UIAlertAction(title: item[0], style: .default) { action -> Void in
                self.portletDisplayScreenlet.inject(injectableScript: JsScript(name: item[0], js: "gotoId(\"\(item[1])\")"))
            }
            actionSheetController.addAction(itemAction)
        }
        
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func screenlet(_ screenlet: PortletDisplayScreenlet, onScriptMessageNamespace namespace: String, onScriptMessage message: String) {
        switch namespace {
        case "menu":
            menuList = message
            createButtonMenuList()
        default:
            print("Any event")
        }
        
    }
    
    func onPortletPageLoaded(_ screenlet: PortletDisplayScreenlet, url: String) {
        portletDisplayScreenlet.inject(injectableScript: JsScript(name: "Nombre", js: "ahora()"))
    }
    
    
    
}
