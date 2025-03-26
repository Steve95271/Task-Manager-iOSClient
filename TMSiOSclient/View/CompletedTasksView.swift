//
//  CompletedTasksView.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import SwiftUI

struct CompletedTasksView: View {
    @StateObject var completedTasks = CompletedTasksViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(completedTasks.completedTasks, id: \.self) { task in
                    
                    VStack {
                        Text(task.taskTitle)
                            .padding()
                            .font(.title2)
                    }
                    VStack {
                        Text(task.taskContent)
                            .padding()
                            .font(.system(size: 14, weight: .light, design: .serif))
                        
                    }
                }
            }
            .navigationTitle("Completed Tasks")
            .onAppear {
                completedTasks.feach()
            }
        }

    }
}

#Preview {
    CompletedTasksView()
}
