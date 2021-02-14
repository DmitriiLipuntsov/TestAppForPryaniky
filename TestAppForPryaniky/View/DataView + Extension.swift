//
//  DataView + Extension.swift
//  TestAppForPryaniky
//
//  Created by Михаил Липунцов on 04.02.2021.
//

import UIKit

extension DataView {
    
    func makeStackView() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalCentering
        stackView.center = center
        stackView.backgroundColor = .gray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height / 8),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 100),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -100),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(self.bounds.height / 8))
        ])
        
        addViewsInStackView(stackView)
        self.stackView = stackView
    }
    
    func addViewsInStackView(_ stackView: UIStackView) {
        stackView.addArrangedSubview(topHzLabel ?? UILabel())
        stackView.addArrangedSubview(optionsStackView ?? UIStackView())
        stackView.addArrangedSubview(picture ?? UIImageView())
        stackView.addArrangedSubview(pictureLabel ?? UILabel())
        stackView.addArrangedSubview(bottomHzLabel ?? UILabel())
    }
    
    func makeTopHzLabel() {
        let label = UILabel()
        label.text = "H"
        self.topHzLabel = label
    }
    
    func makeBottomHzLabel() {
        let label = UILabel()
        label.text = "H"
        self.bottomHzLabel = label
    }
    
    func makeStackViewForChois() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .blue
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        makeOptionsForSelectorStackView(stackView)
        
        self.optionsStackView = stackView
    }
    
    func makeOptionsForSelectorStackView(_ stackView: UIStackView) {
        for (index,option) in options.enumerated() {
                let button = makeOptionButton()
                button.addTarget(self, action: #selector(startAction), for: .touchUpInside)
                button.tag = index
                button.setTitle(option.text, for: .normal)
                button.backgroundColor = .yellow
                stackView.addArrangedSubview(button)
            }
    }
    
    func makeOptionButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        return button
    }
    
    func makePicture() {
        let imageView = UIImageView()
        self.picture = imageView
    }
    
    func makePictureLabel() {
        let label = UILabel()
        label.text = "Picture"
        self.pictureLabel = label
    }
    
}
