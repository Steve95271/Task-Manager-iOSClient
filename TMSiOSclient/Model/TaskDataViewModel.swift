//
//  UnFinishTaskViewModel.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

class TaskDataViewModel: ObservableObject {
    @Published var tasks: [TaskData] = []
    
    //Feach data
    func feach() {
        guard let url = URL(string: "http://localhost:8080/tasks/unfinished") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert JSON
            do {
                let tasks = try JSONDecoder().decode(TmsJSON.self, from: data)
                
                self?.tasks = tasks.tasks
                
            }
            catch {
                print(error)
            }
            
        }
        
        task.resume()
            
    }
}
