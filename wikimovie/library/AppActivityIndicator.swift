//
//  AppActivityIndicator.swift
//
//

import UIKit
import NVActivityIndicatorView

class AppActivityIndicator: UIView {
    
    @IBOutlet var actIndicator: NVActivityIndicatorView!
    @IBOutlet var vwContainer: UIView!
    static let sharedInstance = AppActivityIndicator()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        var vwFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        vwFrame.origin = self.center
        self.vwContainer = UIView(frame: vwFrame)
        self.vwContainer.layer.cornerRadius = 8
        self.vwContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.addSubview(vwContainer)
        
        var actFrame: CGRect = CGRect(x: 0, y: 0, width: 75, height: 75)
        actFrame.origin = self.center
        self.actIndicator = NVActivityIndicatorView(frame: actFrame, type: .ballRotateChase, color: UIColor.white, padding: 0)
        self.addSubview(self.actIndicator)
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("%s", #function)
    }
    
    func startAnimatingIn(_ view: UIView){
        self.frame = view.bounds
        self.actIndicator.center = self.center
        self.vwContainer.center = self.center
        view.addSubview(self)
        view.layoutIfNeeded()
        self.actIndicator.startAnimating()
    }
    
    func startAnimating(){
        let frontToBackWindows = UIApplication.shared.windows.reversed()
        for window in frontToBackWindows {
            if window.windowLevel == UIWindow.Level.normal && !window.isHidden {
                self.frame = window.bounds
                self.actIndicator.center = self.center
                self.vwContainer.center = self.center
                window.addSubview(self)
                self.layoutIfNeeded()
                self.actIndicator.startAnimating()
                break
            }
        }
    }
    
    func stopAnimating(){
        self.actIndicator.stopAnimating()
        self.removeFromSuperview()
    }

}
