//
//  RocketsVC.swift
//  spaceX
//
//  Created by Emir AKSU on 2.02.2024.
//

import UIKit

class RocketsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketsCellVC.id, for: indexPath) as! RocketsCellVC
        
        cell.set(rocketModel: rockets[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        
     
    
        navigationController?.pushViewController(RocketsInfoVC(), animated: true)
        
    }
    
 
    var rockets = [RocketModel]()
    var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCall()
        configure()
        configureCollectionView()
    }
    
    
    func makeCall(){
        
        NetworkManager.shared.callAPI(callType: "Rockets") { response in
            
            switch response{
          
            case .success(let rockets):
                self.rockets = rockets
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
          
            case .failure(let error):
                print(error)
                
            }
            
        
            
        }
        

    }
    
    func configure(){
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rockets"
  

    
   
    }
    
    func configureCollectionView(){
   
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
       
     
        

        
        collectionView.register(RocketsCellVC.self, forCellWithReuseIdentifier: RocketsCellVC.id)
        
        view.addSubview(collectionView)
    }
    
    
    func createFlowLayout() -> UICollectionViewFlowLayout{
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let width = view.bounds.width
        let padding : CGFloat = 13
        let newWidth = width / 4
        
        flowLayout.itemSize = .init(width: newWidth, height: newWidth + 40)
        flowLayout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        
        
        return flowLayout
        
        
        
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
