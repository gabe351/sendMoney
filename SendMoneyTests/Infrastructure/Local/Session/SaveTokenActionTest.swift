//
//  SaveTokenActionTest.swift
//  SendMoneyTests
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble

class SaveTokenActionTest: QuickSpec {
    
    override func spec() {
        
        let userDefaults    = UserDefaults.standard
        let localDataSource = SessionLocalDataSourceImpl.getInstance(defaultsDao: userDefaults)
        
        describe("#save") {
            
            let token = "my-found-test-token"
            let key   = "my-found-key"
            
            context("when save was called") {
                
                var result = ""
                
                beforeEach {
                    localDataSource.save(token: token, key)
                    result = userDefaults.string(forKey: key)!
                }
                
                it("Should get same token") {
                    expect(result).to(equal(token))
                }
            }
        }
    }
}
