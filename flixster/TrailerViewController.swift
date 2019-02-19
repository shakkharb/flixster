//
//  TrailerViewController.swift
//  flixster
//
//  Created by user145126 on 2/11/19.
//  Copyright © 2019 Shakkhar Biswas. All rights reserved.
//

import UIKit
import SafariServices

class TrailerViewController: UIViewController {
    
    var movie: [String:Any]!
    var video: [String:Any]!
    var trailerURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SafariViewController = SFSafariViewController(url: trailerURL!)
        self.present(SafariViewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
