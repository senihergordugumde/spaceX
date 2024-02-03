//
//  RocketsCellVC.swift
//  spaceX
//
//  Created by Emir AKSU on 3.02.2024.
//

import UIKit

class RocketsCellVC: UICollectionViewCell {
    
    static let id = "RocketsCell"
    
    let myLabel = EATitle(textAlignment: .center, fontSize: 16)
    let image = EAImageView(frame: .zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    private func configure(){
        addSubview(image)
        addSubview(myLabel)
        NSLayoutConstraint.activate([
        
            image.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            image.heightAnchor.constraint(equalTo: image.widthAnchor)
        
        ])
        
        
        NSLayoutConstraint.activate([
        
            myLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            myLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        
    }
   
    func set(rocketModel : RocketModel){
        
        myLabel.text = rocketModel.rocket_name
        image.downloadImage(url: rocketModel.flickr_images[1])
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
