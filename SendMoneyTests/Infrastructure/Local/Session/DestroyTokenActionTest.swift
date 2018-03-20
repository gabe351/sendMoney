//
//  DestroyTokenActionTest.swift
//  SendMoneyTests
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble

class destroyTokenActionTest: QuickSpec {
    
    override func spec() {
        
        let userDefaults    = UserDefaults.standard
        let localDataSource = SessionLocalDataSourceImpl.getInstance(defaultsDao: userDefaults)
        
        describe("destroy") {
            
            let token = "my-destroy-test-token"
            let key   = "my-key-to-destroy"
            
            context("when save was called") {
                
                beforeEach {
                    localDataSource.save(token: token, key)
                    localDataSource.destroyBy(key: key)
                }
                
                it("Should get same token") {
                    expect(localDataSource.getTokenBy(key: key)).to(beNil())
                }
            }
        }
    }
}

