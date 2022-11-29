//
//  PostList.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 31/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store =  DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.system(.title, design: .serif)).bold()
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
