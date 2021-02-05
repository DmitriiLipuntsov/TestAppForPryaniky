//
//  AssemblyModuleBuilder.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 04.02.2021.
//

import UIKit

protocol AssemblyModuleBuilderProtocol {
    func creatMainModule() -> UIViewController
}

class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    
    func creatMainModule() -> UIViewController {
        let networkService = NetworkService()
        let viewModel = MainViewModel(networkService: networkService)
        let viewController = ViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
