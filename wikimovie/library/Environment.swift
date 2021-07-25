//
//  Environment.swift
//  RSAURI
//
//  Created by Salim Wijaya on 23/11/20.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        static let appEnvironment = "APP_ENV"
        static let endPoint = "ENDPOINT"
        static let locationName = "LOCATION"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    private static let appEnvironment: [String: Any] = {
        guard let dict = Environment.infoDictionary[Keys.appEnvironment] as? [String: Any] else {
          fatalError("Root URL not set in plist for this environment")
        }
        print(dict)
        return dict
    }()
    
//  MARK: - Plist values
    static let endPoint: String = {
        let value: String = Environment.appEnvironment[Keys.endPoint] as? String ?? ""
        return value
    }()
    
//  MARK: - Plist values
    static let locationName: String = {
        let value: String = Environment.appEnvironment[Keys.locationName] as? String ?? ""
        return value
    }()
}
