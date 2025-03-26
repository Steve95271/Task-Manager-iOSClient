//
//  ImportantTaskView.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import SwiftUI

struct ImportantTaskView: View {
    
    @StateObject var importantTasks = ImportantTasksViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(importantTasks.importantTasks, id: \.self) { task in
                    
                    VStack {
                        Text(task.taskTitle)
                            .padding()
                            .font(.title2)
                    }
                    VStack {
                        Text(task.taskContent)
                            .padding()
                        
                    }
                    VStack {
                        HStack{
                            Text("Due Date:")
                                .padding(.leading)
                                .font(.caption)
                            Text(task.dueDate)
                                .padding(.trailing)
                                .font(.caption)
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("Important Tasks")
            .onAppear {
                importantTasks.feach()
            }
        }
    }
}

#Preview {
    ImportantTaskView()
}
