//
//  SessionLocalDataSourceImpl.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class SessionLocalDataSourceImpl: SessionLocalDataSource {
    
    public static let PREFERENCE_KEY = "AccessTokenKey"
    
    private static var INSTANCE: SessionLocalDataSourceImpl?
    
    private let defaultsDao: UserDefaults
    
    private init(defaultsDao: UserDefaults) {
        self.defaultsDao = defaultsDao
    }
    
    public static func getInstance(defaultsDao: UserDefaults) -> SessionLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = SessionLocalDataSourceImpl(defaultsDao: defaultsDao)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func save(token: String) {        
        defaultsDao.set(token, forKey: SessionLocalDataSourceImpl.PREFERENCE_KEY)
    }
    
    func getToken() -> String? {
        return defaultsDao.string(forKey: SessionLocalDataSourceImpl.PREFERENCE_KEY)
    }
    
    public func destroy() {
        defaultsDao.set(nil, forKey: SessionLocalDataSourceImpl.PREFERENCE_KEY)
    }
}
