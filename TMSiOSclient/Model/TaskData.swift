//
//  TaskData.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

struct TaskData: Identifiable {
    
    let id: Int
    let taskTitle, taskContent, createTime, dueDate: String
    let status: Int
    
}

extension TaskData: Hashable, Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case taskTitle
        case taskContent
        case createTime
        case dueDate
        case status
    }
    
    init(from decoder: Decoder) throws {
        let tasks = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? tasks.decode(Int.self, forKey: .id)
        let rawTaskTitle = try? tasks.decode(String.self, forKey: .taskTitle)
        let rawTaskContent = try? tasks.decode(String.self, forKey: .taskContent)
        let rawCreateTime = try? tasks.decode(String.self, forKey: .createTime)
        let rawDueDate = try? tasks.decode(String.self, forKey: .dueDate)
        let rawStatus = try? tasks.decode(Int.self, forKey: .status)
        
        guard let id = rawId,
              let taskTitle = rawTaskTitle,
              let taskContent = rawTaskContent,
              let createTime = rawCreateTime,
              let dueDate = rawDueDate,
              let status = rawStatus
        else {
            throw RequestError.missingData
        }
        
        self.id = id
        self.taskTitle = taskTitle
        self.taskContent = taskContent
        self.createTime = createTime
        self.dueDate = dueDate
        self.status = status
    }
    
}
