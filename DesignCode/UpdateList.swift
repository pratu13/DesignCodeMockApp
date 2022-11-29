//
//  UpdateList.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 27/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addData() {
        store.updates.append(.init(image: "Card1", title: "New Item", text: "Text", date: "JAN 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { data in
                    NavigationLink(destination: UpdateDetail(update: data)) {
                        UpdateRow(data: data)
                    }
                }
                .onDelete { index in
                    guard let index = index.first else { return }
                    self.store.updates.remove(at: index)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle("Updates")
            .navigationBarItems(leading:
                Button(action: addData) {
                    Image(systemName: "plus")
                }
                ,trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct UpdateRow: View {
    var data: Update
    var body: some View {
        HStack(alignment: .top, spacing: 30.0) {
            Image(data.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color("primary"))
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(data.title)
                    .font(.system(size: 20, weight: .bold))
                Text(data.text)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Text(data.date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct Update: Identifiable {
    var id: UUID = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData: [Update] = [
    Update(image: "Card1", title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(image: "Card4", title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(image: "Card5", title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
