//
//  UserStore.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 28/09/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged:Bool = false
    @Published var showLogin:Bool  = false
    
    
    
}
