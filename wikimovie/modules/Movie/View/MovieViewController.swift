//
//  MovieViewController.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//  Copyright (c) 2021. All rights reserved.

import UIKit

public class MovieViewController: UIViewController {
    var currentPage: Int = 1
    var totalPage: Int = -1
    
	var presenter: IMovieModule!
    var movies:[Movie] = []
    let tableView: UITableView = {
        let tbvw: UITableView = UITableView()
        tbvw.translatesAutoresizingMaskIntoConstraints = false
        tbvw.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tbvw.separatorStyle = .none
        tbvw.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        return tbvw
    }()
    
    
    
	override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.setupNavigation()
        
        self.perform(#selector(requestMovie), with: nil, afterDelay: 2)
    }
    
    @objc func requestMovie(){
//        self.currentPage =
        self.request(true)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func request(_ request: Bool = false) {
        print(#function)
        if request == true {
            self.movies = []
            self.currentPage = 1
            self.presenter.requestMovieAt(page: self.currentPage)
        } else {
            let totalPage: Int = self.totalPage
            let nextPage: Int = self.currentPage + 1
            if totalPage == -1 {
                self.presenter.requestMovieAt(page: nextPage)
            } else if nextPage < totalPage {
                self.presenter.requestMovieAt(page: nextPage)
            }
        }
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupNavigation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let navigationBar: UINavigationBar = self.navigationController!.navigationBar
        navigationBar.topItem?.title = ""
        
        let bundleImage: Bundle = Bundle.main
        let backButton: UIImage? = UIImage(named: "ic-arrow-left", in: bundleImage, compatibleWith: nil)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
    }

    deinit {
        print(#file, #function)
    }
}

extension MovieViewController: IMovieView {
    public func loadMovies(_ movies: [Movie], currentPage: Int, totalPage: Int) {
        self.movies.append(contentsOf: movies)
        self.currentPage = currentPage
        self.totalPage = totalPage
//        self.
        print(#file, #function)
        self.tableView.reloadData()
    }
}

extension MovieViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        print(self.currentPage)
        print(self.movies.count)
        return self.movies.count
     }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath)
        (cell as? MovieTableViewCell)?.movie = self.movies[indexPath.row]
       return cell
     }
}

extension MovieViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.requestMovie(1)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.movies.count - 1 {
            self.request()
            print("request page")
        }
    }
}
