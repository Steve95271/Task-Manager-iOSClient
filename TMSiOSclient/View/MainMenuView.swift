//
//  ContentView.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import SwiftUI

struct MainMenuView: View {
    
    
    var body: some View {
        NavigationView {
            List {
                
                // Unfinish tasks link
                NavigationLink(destination: TaskView()){
                    Text("Tasks")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.blue)
                }
                .padding()
                
                // Important tasks link
                NavigationLink(destination: ImportantTaskView()){
                    Text("Important Tasks")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.blue)
                }
                .padding()
                
                // Completed tasks link
                NavigationLink(destination: CompletedTasksView()){
                    Text("Completed Tasks")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.blue)
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    MainMenuView()
}
