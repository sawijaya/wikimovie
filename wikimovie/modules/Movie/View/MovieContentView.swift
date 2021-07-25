//
//  MovieContentView.swift
//  wikimovie
//
//  Created by Salim Wijaya on 23/07/21.
//

import Foundation
import UIKit

protocol MovieContentViewDelegate: class {
    func movieContentView(_ view: MovieContentView, tapMoreContentAt index:Int)
    func movieContentView(_ view: MovieContentView, didSelectItemAt indexPath: IndexPath)
}

class MovieContentView: UIView {
    
    weak var delegate: MovieContentViewDelegate?
    var data:[Any] = []
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.identifier)
        return collectionView
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .custom)
        let img: UIImage = UIImage(named: "ic-arrow-right", in: Bundle.main, compatibleWith: nil) ?? UIImage()
        button.setImage(img, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapMore(_:)), for: .touchDown)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Now Playing"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 118/255, blue: 82/255, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    convenience init(title: String, data:[Any]) {
        self.init(frame: CGRect.zero)
        self.titleLabel.text = title
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapMore(_ sender: UIButton) {
        self.delegate?.movieContentView(self, tapMoreContentAt: 1)
    }
    
    func setupView(){
//        self.contentView.addSubview(self.nowPlayingView)
//        self.nowPlayingView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
//        self.nowPlayingView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
//        self.nowPlayingView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
//        self.nowPlayingView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
//        self.nowPlayingView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        self.addSubview(self.seperatorView)
        self.seperatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.seperatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.seperatorView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.seperatorView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        
        self.seperatorView.layer.cornerRadius = 2
        
        self.addSubview(self.titleLabel)
        self.titleLabel.centerYAnchor.constraint(equalTo: self.seperatorView.centerYAnchor).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.seperatorView.rightAnchor, constant: 4).isActive = true
        
        self.addSubview(self.moreButton)
        self.moreButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.moreButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        self.moreButton.centerYAnchor.constraint(equalTo: self.seperatorView.centerYAnchor).isActive = true
        self.moreButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        self.addSubview(self.collectionView)
        self.collectionView.topAnchor.constraint(equalTo: self.seperatorView.bottomAnchor, constant: 0).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
}


extension MovieContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.movieContentView(self, didSelectItemAt: indexPath)
        }
    }
    
}

extension MovieContentView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.identifier, for: indexPath) as? MovieViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension MovieContentView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 200)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

