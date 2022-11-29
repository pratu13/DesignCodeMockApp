//
//  DataStore.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 31/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
