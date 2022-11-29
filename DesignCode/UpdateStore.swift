//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 27/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData

    
}
