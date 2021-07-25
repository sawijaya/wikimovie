//
//  MovieDetailViewController.swift
//  wikimovie
//
//  Created by Salim Wijaya on 23/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieDetailViewController: UIViewController {
	var presenter: IMovieDetailModule!
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView: UIImageView = {
        let imgvw: UIImageView = UIImageView()
        imgvw.contentMode = .scaleToFill
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        return imgvw
    }()
    
    let contentImageView: UIView = {
        let vw: UIView = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    let overlayView: UIView = {
        let vw: UIView = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        return vw
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How to Train Your Dragon: The Hidden World"
        return label
    }()
    
    let genreView1: GenreView = {
        let g: GenreView = GenreView()
        g.translatesAutoresizingMaskIntoConstraints = false
        g.text = "Fantasi"
        return g
    }()
    
    let genreView2: GenreView = {
        let g: GenreView = GenreView()
        g.translatesAutoresizingMaskIntoConstraints = false
        g.text = "Fantasi"
        return g
    }()
    
    let starImageViews: [UIImageView] = {
        var imgvws:[UIImageView] = []
        for i in 1...5 {
            let imgvw: UIImageView = UIImageView()
            let unstar: UIImage = UIImage(named: "ic-star-white", in: Bundle.main, compatibleWith: nil) ?? UIImage()
            let star: UIImage = UIImage(named: "ic-star", in: Bundle.main, compatibleWith: nil) ?? UIImage()
            imgvw.image = unstar
            imgvw.highlightedImage = star
            imgvw.translatesAutoresizingMaskIntoConstraints = false
            imgvws.append(imgvw)
        }
        
        return imgvws
    }()
    
    let contentRateView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let storylineLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Storyline"
        label.textColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let storylineContentLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger."
        label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let castLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Full cast"
        label.textColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CastViewCell.self, forCellWithReuseIdentifier: CastViewCell.identifier)
        return collectionView
    }()
    
	override public func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.setupScrollView()
        self.setupView()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        self.contentImageView.roundCorners([.bottomLeft, .bottomRight], radius: 20)
    }
    
    func setupRateView(){
        self.contentImageView.addSubview(self.contentRateView)
        self.contentRateView.leftAnchor.constraint(equalTo: self.contentImageView.leftAnchor, constant: 32).isActive = true
        self.contentRateView.bottomAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: -42).isActive = true
        self.contentRateView.widthAnchor.constraint(equalToConstant: 72).isActive = true
        self.contentRateView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        print(#function)
        var i: Int = 0
        while(i < self.starImageViews.count) {
            let imageView: UIImageView = self.starImageViews[i]
            self.contentRateView.addSubview(imageView)
            imageView.topAnchor.constraint(equalTo: self.contentRateView.topAnchor, constant: 0).isActive = true
            if i == 0 {
                imageView.leftAnchor.constraint(equalTo: self.contentRateView.leftAnchor, constant: 2).isActive = true
            } else {
                let imageViewPrev: UIImageView = self.starImageViews[i - 1]
                imageView.leftAnchor.constraint(equalTo: imageViewPrev.rightAnchor, constant: 2).isActive = true
            }
            imageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
            i = i + 1
        }
        
        i = 0
        while(i < 3) {
            let imageView: UIImageView = self.starImageViews[i]
            imageView.isHighlighted = true
            i = i + 1
        }
    }
    
    func setupScrollView(){
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        print(self.scrollView)
        self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
    }
    
    func setupView(){
        self.contentImageView.addSubview(self.imageView)
        self.imageView.topAnchor.constraint(equalTo: self.contentImageView.topAnchor, constant: 0).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.contentImageView.leftAnchor, constant: 0).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.contentImageView.rightAnchor, constant: 0).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: 0).isActive = true
        
        self.contentImageView.addSubview(self.overlayView)
        self.overlayView.topAnchor.constraint(equalTo: self.contentImageView.topAnchor, constant: 0).isActive = true
        self.overlayView.leftAnchor.constraint(equalTo: self.contentImageView.leftAnchor, constant: 0).isActive = true
        self.overlayView.rightAnchor.constraint(equalTo: self.contentImageView.rightAnchor, constant: 0).isActive = true
        self.overlayView.bottomAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: 0).isActive = true
        
        self.contentImageView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentImageView.topAnchor, constant: 90).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.contentImageView.leftAnchor, constant: 32).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.contentImageView.rightAnchor, constant: -32).isActive = true
        
        self.contentImageView.addSubview(self.genreView1)
        self.genreView1.leftAnchor.constraint(equalTo: self.contentImageView.leftAnchor, constant: 32).isActive = true
        self.genreView1.bottomAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: -10).isActive = true
        
        self.genreView2.text = "Sci-fi"
        self.contentImageView.addSubview(self.genreView2)
        self.genreView2.leftAnchor.constraint(equalTo: self.genreView1.rightAnchor, constant: 5).isActive = true
        self.genreView2.bottomAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: -10).isActive = true
        
        self.contentView.addSubview(self.contentImageView)
        self.contentImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.contentImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.contentImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        self.contentImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
//        self.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!)
        self.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg")!)
            
        self.setupRateView()
        
        self.contentView.addSubview(self.storylineLabel)
        self.storylineLabel.topAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: 16).isActive = true
        self.storylineLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24).isActive = true
        
        self.contentView.addSubview(self.storylineContentLabel)
        self.storylineContentLabel.topAnchor.constraint(equalTo: self.storylineLabel.bottomAnchor, constant: 12).isActive = true
        self.storylineContentLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24).isActive = true
        self.storylineContentLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24).isActive = true

        self.contentView.addSubview(self.castLabel)
        self.castLabel.topAnchor.constraint(equalTo: self.storylineContentLabel.bottomAnchor, constant: 16).isActive = true
        self.castLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24).isActive = true
        
        self.contentView.addSubview(self.castCollectionView)
        self.castCollectionView.topAnchor.constraint(equalTo: self.castLabel.bottomAnchor, constant: 8).isActive = true
        self.castCollectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24).isActive = true
        self.castCollectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -24).isActive = true
        self.castCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.castCollectionView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    

    deinit {
        print(#file, #function)
    }
}

extension MovieDetailViewController: IMovieDetailView {
}

extension MovieDetailViewController: UICollectionViewDelegate {
    
}

extension MovieDetailViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastViewCell.identifier, for: indexPath) as? CastViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension MovieDetailViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 110)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
