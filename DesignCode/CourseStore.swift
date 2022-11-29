//
//  CourseStore.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 01/08/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let clinet = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")

func getArray(id: String, completion: @escaping ([Entry]) -> () ) {
    let query = Query.where(contentTypeId: id)
    
    
    clinet.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
            break
        case .failure(let error):
            print(error)
            break
        }
    }
    
    
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    let colors = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    
    init() {
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!,
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: self.colors.randomElement()!,
                    show: false))
            }
        }
    }
}
