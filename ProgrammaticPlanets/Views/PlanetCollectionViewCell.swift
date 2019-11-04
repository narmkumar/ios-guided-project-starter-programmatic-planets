//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    
    // Used to create collection view cells programmatically. This is automatically done within the storyboard
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    // Used by storyboard to initalize cells
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }
    
    
    private func setupSubViews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        
        let leadingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 4)
        
        let trailingContraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1,
                                                   constant: -4)
        
        
        NSLayoutConstraint.activate([leadingConstraint, trailingContraint])
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
    
    
        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.nameLabel = label
    }
    
    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
}
