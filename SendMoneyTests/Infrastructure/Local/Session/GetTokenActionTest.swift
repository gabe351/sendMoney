//
//  SaveTokenActionTest.swift
//  SendMoneyTests
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble


class GetTokenActionTest: QuickSpec {
    
    
    override func spec() {
        
        let userDefaults    = UserDefaults.standard
        let localDataSource = SessionLocalDataSourceImpl.getInstance(defaultsDao: userDefaults)
        
        describe("#getSaved") {
            
            let token = "my-test-token"
            let key   = "my-key"
            
            context("when get saved token") {
                
                var result = ""
                
                beforeEach {
                    localDataSource.save(token: token, key)
                    result = localDataSource.getTokenBy(key: key)!
                }
                
                it("Should get same token") {
                    expect(result).to(equal(token))
                }
            }                                    
        }
    }
}
