//
//  TmsJSON.swift
//  TMSiOSclient
//
//  Created by Steve on 2023/11/9.
//

import Foundation

struct TmsJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case data
    }
    

    
    private(set) var tasks: [TaskData] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var dataContainer = try rootContainer.nestedUnkeyedContainer(forKey: .data)
        
                
        while !dataContainer.isAtEnd {
            if let data = try? dataContainer.decode(TaskData.self){
                tasks.append(data)
            }
        }
    }
}
