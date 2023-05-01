//
//  LoadCommandList.swift
//  SwiftInMachO
//
//  Created by d on 2023/05/02.
//

import SwiftUI

struct LoadCommandList: View {
    
    var titles = [
        TitleItem(title: "title 1"),
        TitleItem(title: "title 2"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(titles) { item in
                    NavigationLink {
                        Text("Item at \(item.title)")
                    } label: {
                        Text(item.title)
                    }
                }
            }
        }
        .navigationTitle("SwiftInMachO")
        
    }
}

struct LoadCommandList_Previews: PreviewProvider {
    static var previews: some View {
        LoadCommandList()
    }
}
