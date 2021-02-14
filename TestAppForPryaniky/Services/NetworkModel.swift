//
//  NetworkModel.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 14.02.2021.
//

import Foundation

enum DataResponse {
    
    case initial
    case success(ViewData)
    case optionSelected(Variant)
    case failure
    
    // MARK: - FirstData
    struct FirstData: Codable {
        let data: [SecondData]
        let view: [String]
    }
    
    // MARK: - SecondData
    struct SecondData: Codable {
        let name: String
        let data: ThirdData
    }
    
    // MARK: - ThirdData
    struct ThirdData: Codable {
        
        let text: String?
        let url: String?
        let selectedId: Int?
        let variants: [Variant]?
        
    }
    
    // MARK: - Variant
    struct Variant: Codable {
        let id: Int
        let text: String
    }
}
