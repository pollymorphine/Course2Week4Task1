//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit


class RadioViewController: UIViewController {
    
    private lazy var songLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Harold Faltermeyer - Axel F"
        return label
    }()
    
    private lazy var albumImage: UIImageView = {
        let pic = UIImage(named: "pic.jpeg")
        let image = UIImageView(image: pic)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds  = true
        
        return image
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.frame = CGRect(x: 0, y: 0, width: 200, height: 31)
        return slider
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        return progressView
    }()
    
    private var compactConstraints = [NSLayoutConstraint]()
    private var regularConstraints = [NSLayoutConstraint]()
    
   override func viewDidLoad() {
        super.viewDidLoad()
       addRegularConstraints()
       addCompactConstrains()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.addSubview(songLabel)
        self.view.addSubview(slider)
        self.view.addSubview(albumImage)
        self.view.addSubview(progressView)
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
            
        } else {
            NSLayoutConstraint.activate(compactConstraints)
            NSLayoutConstraint.deactivate(regularConstraints)
        }
    }
}

extension RadioViewController {
    struct Offset {
        static let leading: CGFloat = 16.0
        static let trailing: CGFloat = -16.0
        static let top: CGFloat = 8.0
        static let bottom: CGFloat = -24.0
    }
    
//MARK: Constrains
    
    func addRegularConstraints() {
        regularConstraints.append(contentsOf: [albumImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               albumImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1),
                                               albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Offset.top),
                                               
                                               slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Offset.bottom),
                                               slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               
                                               progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               progressView.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30),
                                               
                                               songLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               songLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               songLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor),
                                               songLabel.bottomAnchor.constraint(equalTo: slider.topAnchor)])
        
    }
    
    
    func addCompactConstrains() {
        compactConstraints.append(contentsOf: [progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                                               
                                               slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
                                               slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.leading),
                                               slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Offset.trailing),
                                               
                                               albumImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                               
                                               
                                               albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34),
                                               albumImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -71),
                                               
                                               albumImage.widthAnchor.constraint(equalTo: albumImage.heightAnchor, multiplier: 1),
                                               
                                               songLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
                                               songLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor),
                                               songLabel.bottomAnchor.constraint(equalTo: slider.topAnchor)])
        
    }
}


