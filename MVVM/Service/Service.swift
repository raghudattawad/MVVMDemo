//
//  Service.swift
//  MVVM
//
//  Created by Raghavendra on 06/06/19.
//  Copyright © 2019 Raghavendra. All rights reserved.
//

import UIKit

class Service: NSObject {

    
    static let sharedInstance = Service()
    
    func getAllMovieData(completion:@escaping([MovieModel]?, Error?)->()){
        
        
        let urlStrin = "https://itunes.apple.com/search?media=music&term=bollywood"
        
        
        guard let url = URL(string: urlStrin) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
          
            
            if let err = error {
                
                completion(nil,err)
                print("loading data errror \(error?.localizedDescription) ")
                
                
                
            }
            else{
                
                guard let data  = data  else{ return}
                
                do{
                    
                    var arrayMovieData = [MovieModel]()
                    let  resuts =  try JSONDecoder().decode(ResultModel.self, from: data)
                    
                    for movie in resuts.results{
                        
                      
                        arrayMovieData.append(MovieModel(artName:movie.artistName! , trackNme:movie.trackName!, artImage:movie.artworkUrl30!))
                    }
                
                   completion(arrayMovieData,nil)
                }catch let jsonError{
                    print("json erro \(jsonError.localizedDescription)")
                    
                }
                
            }
        }.resume()

    }
    
    
}

