//
//  Log.swift
//  Logger
//
//  Created by Varun V Nair on 25/12/22.
//

import Foundation

enum Log {
    enum LogLevel {
        case info
        case warning
        case error
        
        var prefixValue: String {
            switch self {
            case .info:
                return "INFO ℹ️"
            case .warning:
                return "WARNING ⚠️"
            case .error:
                return "ERROR 💥"
            }
        }
    }
    
    struct FileDetail {
        let file: String
        let functionName: String
        let lineNumber: Int
        var description: String {
            return "\((file as NSString).lastPathComponent):\(lineNumber) \(functionName)"
        }
    }
    
    static func info(_ str: String, shouldLogFileDetails: Bool = true, file: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        
        let fileDetail = FileDetail(file: file, functionName: functionName, lineNumber: lineNumber)
        Log.handleLog(logLevel: .info, str: str, shouldLogFileDetails: shouldLogFileDetails, fileDetails: fileDetail)
        
    }
    
    static func warning(_ str: String, shouldLogFileDetails: Bool = true, file: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        
        let fileDetail = FileDetail(file: file, functionName: functionName, lineNumber: lineNumber)
        Log.handleLog(logLevel: .warning, str: str, shouldLogFileDetails: shouldLogFileDetails, fileDetails: fileDetail)
        
    }
    
    static func error(_ str: String, shouldLogFileDetails: Bool = true, file: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        
        let fileDetail = FileDetail(file: file, functionName: functionName, lineNumber: lineNumber)
        Log.handleLog(logLevel: .error, str: str, shouldLogFileDetails: shouldLogFileDetails, fileDetails: fileDetail)
        
    }
    
    static func handleLog(logLevel: LogLevel, str: String, shouldLogFileDetails: Bool, fileDetails: FileDetail) {
        let logComponents = ["[\(logLevel.prefixValue)]", str]
        
        var fullString = logComponents.joined(separator: " ")
        
        if shouldLogFileDetails {
            fullString += " -> \(fileDetails.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
        
    }
}

