//
//  ImportantTasksProvider.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

class ImportantTasksViewModel: ObservableObject {
    @Published var importantTasks: [TaskData] = []
    
    func feach() {
        guard let url = URL(string: "http://localhost:8080/tasks/important") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert JSON
            do {
                let importantTasks = try JSONDecoder().decode(TmsJSON.self, from: data)
                
                self?.importantTasks = importantTasks.tasks
                
            }
            catch {
                print(error)
            }
            
        }
        
        task.resume()
            
    }
}
