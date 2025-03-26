//
//  UnFinishedTaskView.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import SwiftUI

struct TaskView: View {
    @StateObject var unFinishTask = TaskDataViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(unFinishTask.tasks, id: \.self) { task in
                        VStack {
                            Text(task.taskTitle)
                                .padding()
                                .font(.title)
                        }
                        VStack {
                            Text(task.taskContent)
                                .padding()
                                .font(.system(size: 14, weight: .light, design: .serif))
                            
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
            .navigationTitle("Tasks")
            .onAppear {
                unFinishTask.feach()
            }
        }
    }
}

#Preview {
    TaskView()
}
