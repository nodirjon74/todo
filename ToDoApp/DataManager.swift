//
//  DataManager.swift
//  ToDoApp
//
//  Created by Nodirjon on 3/1/19.
//  Copyright © 2019 Nodirjon. All rights reserved.
//

import Foundation


public class DataManager {
    
    //Get Document Directory
    static fileprivate func getDocumentDirectory () -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        } else {
            fatalError("Unable to access file directory")
        }
    }
    //Save any document
    static func save <T:Encodable> (_ object: T, with fileName: String) {
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    //Load any kind of codable objects
    static func load <T:Decodable> (_ filename: String, with type: T.Type) -> T {
        let url = getDocumentDirectory().appendingPathComponent(filename, isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.path) {
            fatalError("File not found at path \(url.path)")
        }
        if let data = FileManager.default.contents(atPath: url.path) {
            do {
                let model = try JSONDecoder().decode(type, from: data)
                return model
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Data not available at  path \(url.path)")
        }
        
    }
    //Load data from a file
    static func loadData (_ filename: String) -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(filename, isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.path) {
            fatalError("File not found at path \(url.path)")
        }
        if let data = FileManager.default.contents(atPath: url.path) {
            return data
        } else {
            fatalError("Data not available at  path \(url.path)")
        }
        
    }
    //Load all files from a dictionary
    static func loadAll <T:Decodable> (_ type: T.Type) -> [T] {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: getDocumentDirectory().path)
            var modelObjects = [T]()
            
            for fileName in files {
                modelObjects.append(load(fileName, with: type))
            }
            return modelObjects
            
        } catch {
            fatalError("Could not download any files")
        }
    }
    //Delete files
    static func delete (_ fileName: String) {
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
