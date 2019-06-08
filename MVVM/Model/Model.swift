//
//  Model.swift
//  MVVM
//
//  Created by Raghavendra on 06/06/19.
//  Copyright © 2019 Raghavendra. All rights reserved.
//

import UIKit



class ResultModel :Decodable{
    
    
    var  results = [MovieModel]()
    
    
    init(movieMode:[MovieModel]) {
        
        self.results = movieMode
    }
}
class MovieModel: Decodable {

    var  artistName:String?
    var trackName:String?
    var artworkUrl30:String?
    
    init(artName:String , trackNme:String, artImage:String) {
        
        self.artistName  = artName
        
        self.trackName = trackNme
        self.artworkUrl30 = artImage
    }
    
}


