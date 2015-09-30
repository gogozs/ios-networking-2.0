//
//  ViewController.swift
//  FlickFinder
//
//  Created by Jarrod Parkes on 1/29/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!

    @IBAction func searchPhotosByPhraseButtonTouchUp(sender: AnyObject) {
        print("Implement this function...")
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=bf0d300ea3b287953d9643cf5dde7f79&text=baby+asian+elephant&format=json&nojsoncallback=1")
        let request = NSURLRequest(URL: url!)
        
       let task = session.dataTaskWithRequest(request) { (data, response, error) in
            guard (error == nil) else {
               print("there was an error with your request: \(error)")
               return;
            }
            
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode < 300 else {
                
                print("your response is wrong")
                return
                
            }
            
            
            print("data: \(response)")
        }
        
        task.resume()
        
        
        
    }
    
    @IBAction func searchPhotosByLatLonButtonTouchUp(sender: AnyObject) {
        print("Will implement this function in a later step...")
    }
}