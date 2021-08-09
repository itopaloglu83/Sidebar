//
//  ContentView.swift
//  Sidebar
//
//  Created by İhsan TOPALOĞLU on 8/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresenting = false
    
    var body: some View {
        ZStack {
            if !isPresenting {
                Button("Open Sidebar") {
                    isPresenting = true
                }
            }
            
            // Sidebar is on the top of ZStack but
            // configured to be not visible.
            SideMenu(width: 270, isOpen: $isPresenting)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    
    @Binding var isOpen: Bool
    
    var body: some View {
        ZStack {
            // Rectangle is normally fully transparent.
            // When the sidebar is presented,
            // its opacity is increased with animation.
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.gray.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
                .opacity(isOpen ? 1 : 0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    isOpen = false
                }
            
            // Menu is normally pushed aside.
            // When the sidebar is presented,
            // it slides into the view.
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: isOpen ? 0 : -width)
                    .animation(.easeIn)
                
                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List {
            Text("My Profile")
            Text("Posts")
            Text("Logout")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
