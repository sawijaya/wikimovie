//
//  ApplicationAssembly.swift

import Swinject
import UIKit

final class ApplicationAssembly {
    
    //Use default dependency
    class var assembler: Assembler {
        return Assembler([
            MovieAssemblyContainer(),
            MovieDetailAssemblyContainer()
        ])
    }
    
    var assembler: Assembler
    
    //If you want use custom Assembler
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
    
}

class AppContainer {
    static var shared: AppContainer = AppContainer()
    private var defaultContainer: Container!
    
    private init() {
        self.setup()
    }
    
    private func setup(){
        defaultContainer = ApplicationAssembly.assembler.resolver as? Container
    }
    
    func rootViewController() -> UIViewController {
        return UIViewController()
//        return self.defaultContainer.resolve(TabBarViewController.self) ?? UIViewController()
    }
    
    var movieViewController: UIViewController {
        get {
            let vc: UIViewController = self.defaultContainer.resolve(MovieViewController.self) ?? UIViewController()
            let nv: UINavigationController = UINavigationController(rootViewController: vc)
            return nv
        }
    }
    
    var movieDetailViewController: UIViewController {
        get {
            let vc: UIViewController = self.defaultContainer.resolve(MovieDetailViewController.self) ?? UIViewController()
            return vc
        }
    }
//    var logInViewController: UIViewController {
//        get {
//            let vc: UIViewController = self.defaultContainer.resolve(LogInViewController.self) ?? UIViewController()
//            let nv: UINavigationController = UINavigationController(rootViewController: vc)
//            return nv
//        }
//    }
}
