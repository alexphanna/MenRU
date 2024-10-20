//
//  DiningHallView.swift
//  MenRU
//
//  Created by alex on 9/6/24.
//

import SwiftUI
import SwiftSoup
import StoreKit

struct MenusView : View {
    @State private var isSheetShowing = false
    
    var body : some View {
        NavigationStack {
            List {
                ForEach(places, id: \.self) { place in
                    MenuView(viewModel: MenuViewModel(place: place))
                }
            }
            .navigationTitle("Menus")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isSheetShowing = true }, label: {
                        Image(systemName: "gear")
                    })
                }
            }
            .sheet(isPresented: $isSheetShowing, content: {
                SettingsView()
            })
        }
    }
}
