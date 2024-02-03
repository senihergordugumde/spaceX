//
//  NetworkManager.swift
//  spaceX
//
//  Created by Emir AKSU on 2.02.2024.
//

import Foundation

enum EAError : Error{
    
    case parsingError
    case badUrl
    case dataError
    
    
}



class NetworkManager{
    
    static let shared = NetworkManager()
    
    
    let baseURL = "https://api.spacexdata.com/v3/"
    
    func callAPI(callType : String, completion : @escaping(Result<[RocketModel], EAError>) -> Void){
        
        let endPoint = "\(baseURL)\(callType)"
        
        guard let url = URL(string: endPoint) else{
            
            completion(.failure(.badUrl))
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if error != nil{
                completion(.failure(.badUrl))
            }
            
            guard let data = data else{
                completion(.failure(.dataError))
                return
            }
            
            do{
                let rockets = try JSONDecoder().decode ([RocketModel].self, from: data)
                
                completion(.success(rockets))
            }catch{
                completion(.failure(.parsingError))
                
            }
            
            
        }
        task.resume()
    }
    
}
