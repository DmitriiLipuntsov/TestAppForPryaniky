//
//  MainViewModel.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 03.02.2021.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((DataResponse) -> Void)? { get set }
    func startAction(indexOption: Int)
}

class MainViewModel: MainViewModelProtocol {
    
    private var networkService: NetworkServiceProtocol
    private var variants: [DataResponse.Variant] = []
    var updateViewData: ((DataResponse) -> Void)?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        getData()
    }
    
    private func setData(dataResponse: DataResponse.FirstData) {
        
        let data = decodeData(dataResponse: dataResponse)
        updateViewData?(.success(data))
    }
    
    private  func decodeData(dataResponse: DataResponse.FirstData) -> ViewData {
        var viewData = ViewData(hzText: "", picturerText: "", url: "", selectedId: 0, variants: [])
        
        for data in dataResponse.data {
            if data.name == "hz" {
                viewData.hzText = data.data.text ?? ""
            }
            if data.name == "picture" {
                viewData.picturerText = data.data.text ?? ""
                viewData.url = data.data.url ?? ""
            }
            viewData.selectedId = data.data.selectedId ?? 0
            let variants = data.data.variants ?? []
            viewData.variants = variants
            self.variants = variants
        }
        
        return viewData
    }
    
    private func decodeDataToOption(option: Int) -> DataResponse.Variant {
        let variant = variants[option]
        
        return variant
    }
    
    private func getData() {
        networkService.featchData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let data):
                print(data)
                self.setData(dataResponse: data)
            case .failure(let error): print(error)
                
            }
            
        }
    }
    
    func startAction(indexOption: Int) {
        let variant = decodeDataToOption(option: indexOption)
        updateViewData?(.optionSelected(variant))
    }
    
}
