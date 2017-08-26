//
//  ViewController.swift
//  AndorraTelecomPublic
//
//  Created by Francisco Mico on 25/07/2017.
//  Copyright © 2017 Liferay. All rights reserved.
//

import UIKit
import LiferayScreens

class MenuViewController: UIViewController, PortletDisplayScreenletDelegate {

    @IBOutlet weak var portletDisplayScreenlet: PortletDisplayScreenlet!
class MenuViewController: UIViewController, PortletDisplayScreenletDelegate, CallMeBackDelegate {
    
    
    @IBOutlet weak var heightCallMeBack: NSLayoutConstraint!
    @IBOutlet weak var headerCallmeBack: UIView!
    @IBOutlet weak var viewCallmeBack: UIView!
    @IBOutlet weak var labelCallMeBack: UILabel!
    
    @IBOutlet weak var callMeBack: CallMeBackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLogoToNavegationBar()
        modifyHeightCallMeBack(height: 0)
        attachClickHeaderCallBack()
        callMeBack.delegate = self
        
        buttonChangeLanguage(language: LanguageHelper.shared().threeLettersFormatted)
        loadPortletScreenlet()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func modifyHeightCallMeBack(height: CGFloat) {
        heightCallMeBack.constant = height
        self.viewCallmeBack.layoutIfNeeded()
    }
    
    func addLogoToNavegationBar() {
        let logo = UIImage(named: "Logo") as UIImage?
        let imageView = UIImageView(image:logo)
        imageView.frame.size.width = 100;
        imageView.frame.size.height = 32;
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        self.navigationItem.titleView = imageView
    }
    
    func buttonChangeLanguage(language: String) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: language, style: .plain, target: self, action: #selector(onClickChangeLanguage))
    }
    
    func onClickChangeLanguage() {
        let actionSheetController: UIAlertController = UIAlertController(title: "language".localized(), message: "choose".localized(), preferredStyle: .actionSheet)
        
        for value in LanguageHelper.shared().listLanguages {
            let itemAction: UIAlertAction = UIAlertAction(title: value, style: .default) { action -> Void in
                LanguageHelper.shared().change(language: value)
                self.loadPortletScreenlet()
                self.buttonChangeLanguage(language: LanguageHelper.shared().threeLettersFormatted)
                self.loadPortletScreenlet()
                self.callMeBack.setTextOutlets()
            }
            actionSheetController.addAction(itemAction)
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel".localized(), style: .cancel) { action -> Void in
            actionSheetController.dismiss(animated: true, completion: nil)
        }
        
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func attachClickHeaderCallBack() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (MenuViewController.checkAction(sender:)))
        self.headerCallmeBack.addGestureRecognizer(gesture)
    }
    
    func checkAction(sender : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            let bigSize:CGFloat = 400.0
            let smallSize:CGFloat = 50.0
            
            if self.heightCallMeBack.constant.isEqual(to: bigSize){
                self.heightCallMeBack.constant = smallSize
                self.viewCallmeBack.superview?.layoutIfNeeded()
            } else {
                self.heightCallMeBack.constant = bigSize
                self.viewCallmeBack.superview?.layoutIfNeeded()
            }
            
        })
    }
    
    func loadPortletScreenlet() {
        let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: LanguageHelper.shared().url(page: .index))
            .set(webType: .liferay)
            .addCss(localFile: "menu")
            .addJs(localFile: "menu")
            .load()
        portletDisplayScreenlet.configuration = portletConfiguration
        
        portletDisplayScreenlet.backgroundColor = UIColor(red:0.83, green:0.02, blue:0.45, alpha:1.0)
        
        portletDisplayScreenlet.load()
        portletDisplayScreenlet.delegate = self

        configurationPortletScreenletCallMeBack()
    }
    
    func configurationPortletScreenletCallMeBack() {
        let portletConfiguration = PortletConfiguration
            .Builder(portletUrl: LanguageHelper.shared().url(page: .index))
            .set(webType: .liferay)
            .addCss(localFile: "callmeback")
            .addJs(localFile: "callmeback")
            .load()
        portletDisplayScreenletCallBackMe.configuration = portletConfiguration
    }
    
    func screenlet(_ screenlet: PortletDisplayScreenlet, onScriptMessageNamespace namespace: String, onScriptMessage message: String) {
        switch namespace {
            case "call-me-back":
                createPopOverCallMeBack(message: message);
            case "click-button":
                goNextForfet(position: message)
            case "map":
                goToMap()
            default:
                print("Any event")
        }
        
    }
    
    func createPopOverCallMeBack(message: String) {
        labelCallMeBack.text = message
        UIView.animate(withDuration: 1, animations: {
            self.heightCallMeBack.constant = 50
            self.viewCallmeBack.superview?.layoutIfNeeded()
        })
    }
    
    func goNextForfet(position: String) {
        performSegue(withIdentifier: "forfet", sender: position)
        print("Position \(position)")
    func goToMap() {
        performSegue(withIdentifier: "map", sender: nil)
    }
    
    func onPortletPageLoaded(_ screenlet: PortletDisplayScreenlet, url: String) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forfet" ,
            let vc = segue.destination as? ForfetViewController {
            switch sender as! String {
            case "0":
                vc.url = LanguageHelper.shared().url(page: .mobileland29)
            case "1":
                vc.url = LanguageHelper.shared().url(page: .roming)
            case "2":
                vc.url = LanguageHelper.shared().url(page: .paquete69)
            case "3":
                vc.url = LanguageHelper.shared().url(page: .optima)
            default:
                print("Sorry, we don't have more cases")
            }
            
        }
    }

}

