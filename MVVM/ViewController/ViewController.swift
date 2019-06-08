//
//  ViewController.swift
//  MVVM
//
//  Created by Raghavendra on 25/04/19.
//  Copyright © 2019 Raghavendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var arrayOfViewModel = [MovieViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    getData()
        
    }

    func getData(){
        
        Service.sharedInstance.getAllMovieData { (movies, error) in
            
            if (error == nil ){
                
                
                self.arrayOfViewModel = movies?.map({ return MovieViewModel(movieModel:$0)
                }) ?? []
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()

                }
                
            }
            
            
        }
        
    }
    
}

extension  ViewController:UITableViewDataSource{

  
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrayOfViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell =      tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        
    
      
       
        let mvvm = arrayOfViewModel[indexPath.row]
        
        let url = URL(string:mvvm.artworkUrl30!)
        if let data = try? Data(contentsOf: url!)
        {
            cell.imageViewDisplay.layer.borderWidth = 1
            cell.imageViewDisplay.layer.masksToBounds = false
            cell.imageViewDisplay.layer.borderColor = UIColor.black.cgColor
            cell.imageViewDisplay.layer.cornerRadius = cell.imageViewDisplay.frame.height/2
            cell.imageViewDisplay.clipsToBounds = true
            
         cell.imageViewDisplay.image  = UIImage(data: data)!
        }
        cell.artistNameDipslay.text = mvvm.artistName
        print(mvvm.artworkUrl30!)
        cell.trackNameDisplay.text = mvvm.trackName
        
        return cell
        
        
    }
    
}
