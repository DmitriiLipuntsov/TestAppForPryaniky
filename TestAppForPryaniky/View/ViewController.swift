//
//  ViewController.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {

    private var dataView: DataView?
    var viewModel: MainViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        updateView()
        createView()
        
    }
    
    private func createView() {
        let dataView = DataView()
        dataView.delegate = self
        dataView.bounds.size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        dataView.center = view.center
        view.addSubview(dataView)
        self.dataView = dataView
    }
    

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            guard let self = self else { return }
            self.dataView?.viewData = viewData
        }
    }
    


}

//MARK: - DataViewDelegate
extension ViewController: DataViewDelegate {
    func startAction(indexOption: Int) {
        viewModel.startAction(indexOption: indexOption)
    }
    
    func showAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}
