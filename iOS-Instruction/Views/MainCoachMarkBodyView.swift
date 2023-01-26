//
//  MainCoachMarkBodyView.swift
//  iOS-Instruction
//
//  Created by Albert on 26/01/23.
//

import UIKit
import Instructions

final class MainCoachMarkBodyView: UIView, CoachMarkBodyView, CoachMarkSkipView {
    
    var nextControl: UIControl? { return self.nextButton }
    var skipControl: UIControl? { return self.skipButton }
    weak var highlightArrowDelegate: CoachMarkBodyHighlightArrowDelegate?
    
    private lazy var explanation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.text = "Seen you eyes son show. Far two unaffected one alteration apartments celebrated but middletons interested. Described deficient applauded consisted my me do."
        label.textColor = .black
        
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var countPage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "1 of 5 pages"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonTapped() {
        print("The skipButton is tapped")
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(explanation)
        addSubview(hStackView)
        hStackView.addArrangedSubview(countPage)
        hStackView.addArrangedSubview(skipButton)
        hStackView.addArrangedSubview(nextButton)
    }
    
    private func setupLayouts() {
        translatesAutoresizingMaskIntoConstraints = false
        explanation.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            explanation.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            explanation.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            explanation.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            hStackView.topAnchor.constraint(equalTo: explanation.bottomAnchor, constant: 8),
            hStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            hStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
        ])
    }
}
