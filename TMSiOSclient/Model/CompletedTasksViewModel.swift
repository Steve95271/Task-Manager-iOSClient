//
//  CompletedTasksProvider.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

class CompletedTasksViewModel: ObservableObject {
    @Published var completedTasks: [TaskData] = []
    
    func feach() {
        guard let url = URL(string: "http://localhost:8080/tasks/completed") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert JSON
            do {
                let completedTasks = try JSONDecoder().decode(TmsJSON.self, from: data)
                
                self?.completedTasks = completedTasks.tasks
                
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
