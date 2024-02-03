//
//  MainVC.swift
//  spaceX
//
//  Created by Emir AKSU on 2.02.2024.
//

import UIKit

class MainVC: UIViewController {
    
    
    let button = EAButton(backgroundColor: .systemPink, buttonText: "Rockets")
    override func viewDidLoad() {
        super.viewDidLoad()

       configure()
        configureButton()
    }
    
    
    func configure(){
        
        view.backgroundColor = .systemBackground
        
    }
    
    
    func configureButton(){
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
       
        view.addSubview(button)
        NSLayoutConstraint.activate([
        
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 60)
        
        
        ])
    }
    
    @objc func buttonClicked(){
        
        
        navigationController?.pushViewController(RocketsVC(), animated: true)
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
