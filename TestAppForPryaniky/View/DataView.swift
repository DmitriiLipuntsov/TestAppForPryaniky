//
//  TestView.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 03.02.2021.
//

import UIKit
import Kingfisher

protocol DataViewDelegate {
    func startAction(indexOption: Int)
    func showAlert(alert: UIAlertController)
}

class DataView: UIView {
    
    var viewData: DataResponse = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    var delegate: DataViewDelegate!
    var options: [DataResponse.Variant] = []
    var stackView: UIStackView?
    var topHzLabel: UILabel?
    var optionsStackView: UIStackView?
    var picture: UIImageView?
    var pictureLabel: UILabel?
    var bottomHzLabel: UILabel?
    
    init() {
        super.init(frame: CGRect())
        makeTopHzLabel()
        makePicture()
        makePictureLabel()
        makeBottomHzLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case.success(let response):
            update(viewData: response)
        case .optionSelected(let variant):
            print(variant)
            startAlert(variant: variant)
        case .failure:
            print("error")
        default:
            break
        }
        
        makeStackViewForChois()
        makeStackView()

    }
    
    private func update(viewData: ViewData) {
        options = viewData.variants
        stackView?.backgroundColor = .gray
        optionsStackView?.backgroundColor = .brown
        topHzLabel?.text = viewData.hzText
        let url = URL(string: viewData.url)
        picture?.kf.setImage(with: url)
        pictureLabel?.text = viewData.picturerText
        bottomHzLabel?.text = viewData.hzText
    }
    
    private func startAlert(variant: DataResponse.Variant) {
        let alert = UIAlertController(title: "ID: \(variant.id)", message: variant.text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
        delegate.showAlert(alert: alert)
        
    }
    
    @objc func startAction(sender: UIButton) {
        delegate.startAction(indexOption: sender.tag)
    }
    
}

