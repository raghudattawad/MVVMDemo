//
//  MovieViewModel.swift
//  MVVM
//
//  Created by Raghavendra on 08/06/19.
//  Copyright © 2019 Raghavendra. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {

    var  artistName:String?
    var trackName:String?
    var artworkUrl30:String?
    

    /// Dependency Injection //
    
    init(movieModel:MovieModel){
        
        
        self.artistName = movieModel.artistName
        self.trackName = movieModel.trackName
        self.artworkUrl30 = movieModel.artworkUrl30 
    }
    
    
}
