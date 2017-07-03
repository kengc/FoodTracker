//
//  Meal.swift
//  FoodTracker
//
//  Created by Kevin Cleathero on 2017-07-02.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class Meal {
    
    //In Swift, you can represent the name using a String, the photo using a UIImage, and the rating using an Int. Because a meal always has a name and rating but might not have a photo, make the UIImage an optional.
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
//MARK: Initialization
    
    //your initializer returns an optional Meal? object. in case one of the params sent is nil, then return a nil object
    init?(name: String, photo: UIImage?, rating: Int) {
        
        
        //A guard statement declares a condition that must be true in order for the code after the guard statement to be executed. If the condition is false, the guard statement’s else branch must exit the current code block (for example, by calling return, break, continue, throw, or a method that doesn’t return like fatalError(_:file:line:)).
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
