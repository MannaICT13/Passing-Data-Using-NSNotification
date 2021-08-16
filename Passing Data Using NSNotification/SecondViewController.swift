//
//  SecondViewController.swift
//  Passing Data Using NSNotification
//
//  Created by Sharetrip-iOS on 12/08/2021.
//

import UIKit

class SecondViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    //MARK:- Properties
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var ageTextField : UITextField!
    @IBOutlet weak var myImg : UIImageView!
    static let identifier = "SecondViewController"
    
    
    var imagePickerController : UIImagePickerController!
    
    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

       addImg()
     
    }
    
   private func addImg(){
        
    let tap = UITapGestureRecognizer(target: self, action: #selector(pickingImg))
    myImg.isUserInteractionEnabled  = true
    myImg.addGestureRecognizer(tap)
    }
    
    @objc func pickingImg(){
        
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.isEditing = false
        imagePickerController.sourceType = .photoLibrary
        
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let temImage = info[.originalImage] as! UIImage
        myImg.image = temImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickBtnAction(_ sender: Any) {
        
        var information = [String : Any]()
        information["name"] = nameTextField.text
        information["age"] = ageTextField.text
        information["img"] = myImg.image
        
        NotificationCenter.default.post(name: .notificationKey, object: self, userInfo: information)
        self.navigationController?.popViewController(animated: true)
        
    }
    


}
