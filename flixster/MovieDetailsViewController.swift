//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by user145126 on 2/4/19.
//  Copyright © 2019 Shakkhar Biswas. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisText: UITextView!
    
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisText.text = movie["overview"] as? String
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let highResUrl = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: highResUrl + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        
        let trailerController = segue.destination as! TrailerViewController
        trailerController.movie = movie
        
        let baseURL = "https://api.themoviedb.org/3/movie/"
        let movieID = movie["id"] as? String
        let keyURL = "/videos?language=en-US&api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let trailerURL = URL(string: baseURL + (movieID ?? "nil") + keyURL)
        
        trailerController.trailerURL = trailerURL
        
        let request = URLRequest(url: trailerURL!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let trailerKey = dataDictionary["key"] as? String
                print(dataDictionary as Any)
            }
        }
        task.resume()
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
