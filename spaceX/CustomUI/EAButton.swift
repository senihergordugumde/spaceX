//
//  EAButton.swift
//  spaceX
//
//  Created by Emir AKSU on 3.02.2024.
//

import UIKit

class EAButton: UIButton {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    init(backgroundColor : UIColor, buttonText : String){
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitle(buttonText, for: .normal)
        configure()
    }
    
    private func configure(){
        
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
