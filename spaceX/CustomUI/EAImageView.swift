//
//  EAImageView.swift
//  spaceX
//
//  Created by Emir AKSU on 3.02.2024.
//

import UIKit

class EAImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "logo")

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    private func configure(){
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = placeholderImage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func downloadImage(url : String){
        URLCache.shared.removeAllCachedResponses()

        guard let url = URL(string: url) else {return}
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 15)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if error != nil { return }
            guard let self = self else { return}

            guard let data = data else {return}
            
            guard let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
        task.resume()
        
    }
}
