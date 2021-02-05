//
//  NetworkService.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 03.02.2021.
//

import Alamofire

protocol NetworkServiceProtocol {
    func featchData(complition: @escaping (Result<DataResponse.FirstData,Error>) -> ())
}


class NetworkService: NetworkServiceProtocol {
    
    func featchData(complition: @escaping (Result<DataResponse.FirstData, Error>) -> ()) {
        
        let url = "https://pryaniky.com/static/json/sample.json"
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { dataResponse in
            if let error = dataResponse.error {
                print("Data response error: ", error)
                complition(.failure(error))
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(DataResponse.FirstData.self, from: data)
                complition(.success(object))
            }
            catch let jsonError{
                print("Failed to decode JSON", jsonError)
                complition(.failure(jsonError))
            }
        }
        
    }
}
