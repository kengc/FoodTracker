//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Kevin Cleathero on 2017-07-01.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties

    @IBOutlet var nameTextField: UITextField!
      
    @IBOutlet var photoImageView: UIImageView!

    @IBOutlet var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self;
    }


//MARK: Actions
    
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        mealNameLabel.text = "Default Text"
//    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //jide the keyboard
        //This code ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary //The type of imagePickerController.sourceType is known to be UIImagePickerControllerSourceType, which is an enumeration. This means you can write its value as the abbreviated form .photoLibrary instead of UIImagePickerControllerSourceType.photoLibrary.
        
        imagePickerController.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        present(imagePickerController, animated: true, completion: nil)
        
    }

    
//MARK: UITextFieldDelegate
    
    //You need to specify that the text field should resign its first-responder status when the user taps a button to end editing in the text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        //is called after the text field resigns its first-responder status.
        //The textFieldDidEndEditing(_:) method gives you a chance to read the information entered into the text field and do something with it
        
        //mealNameLabel.text = textField.text
        
    }
    
    
//MARK: UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //The first of these, imagePickerControllerDidCancel(_:), gets called when a user taps the image picker’s Cancel button. This method gives you a chance to dismiss the UIImagePickerController (and optionally, do any necessary cleanup).
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        //The info dictionary always contains the original image that was selected in the picker.
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
        UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}





