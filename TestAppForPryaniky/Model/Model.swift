//
//  Model.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 03.02.2021.
//

import Foundation

enum DataResponse {
    
    case initial
    case success(ViewData)
    case optionSelected(Variant)
    case failure

    enum Options {
        case optionOne(Variant)
        case optionTwo(Variant)
        case optionThree(Variant)
    }
    
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

struct ViewData { //создал эту модель из-за picturerText - это в json файле текст для картинки. Не уверен, что нужно было его отображать, если нет то это моделька не нужна и вместо нее можно спокойно использовать ThirdData
    
    var hzText: String
    var picturerText: String
    var url: String
    var selectedId: Int
    var variants: [DataResponse.Variant]
    
}
