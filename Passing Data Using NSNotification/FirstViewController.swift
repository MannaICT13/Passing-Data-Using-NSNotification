//
//  FirstViewController.swift
//  Passing Data Using NSNotification
//
//  Created by Sharetrip-iOS on 12/08/2021.
//

import UIKit



class FirstViewController: UIViewController {

    
    //MARK:- Properties
    
    @IBOutlet weak var infoLbl : UILabel!
    @IBOutlet weak var myImgView : UIImageView!
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NextVC", style: .plain, target: self, action: #selector(goToNextVC(_:)))
        NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotify(_:)), name: .notificationKey, object: nil)
        

    }
 

    @objc func goToNextVC(_ : UINavigationItem){
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: SecondViewController.identifier) as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    @objc func doWhenNotify(_ notification : NSNotification){
        
        if let dic = notification.userInfo as NSDictionary?{
            if let name = dic["name"] as? String ,let age = dic["age"] as? String,let img = dic["img"]{
                infoLbl.text = "This is Mr \(name)and age is \(age)"
                myImgView.image = img as? UIImage
            }
        }
        
        
    }
}
 

extension Notification.Name{
    
    static let notificationKey = Notification.Name("notificationKey")
}
