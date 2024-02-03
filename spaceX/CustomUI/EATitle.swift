//
//  EATitle.swift
//  spaceX
//
//  Created by Emir AKSU on 3.02.2024.
//

import UIKit

class EATitle: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
    }
    
    
    
    init(textAlignment : NSTextAlignment,fontSize : CGFloat){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize)
        configure()
    }
    
    private func configure(){
        
        self.textColor = .label
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
