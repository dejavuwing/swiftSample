//
//  JakeFileManager.swift
//  swiftSample
//
//  Created by ngle on 2016. 7. 29..
//  Copyright © 2016년 ngle. All rights reserved.
//

import Foundation

class jakeFile {
    
    // Checking for the Existence of a File
    class func exists (path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.fileExistsAtPath(path)
    }
    
    // Comparing the Contents of Tow Files
    class func compare (filepath1: String, filepath2: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.contentsEqualAtPath(filepath1, andPath: filepath2)
    }
    
    //Checking if a File is Readable/Writable/Executable/Deletable
    class func isReadable (path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.isReadableFileAtPath(path)
    }
    
    //Checking if a File is Readable/Writable/Executable/Deletable
    class func isWritable (path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.isWritableFileAtPath(path)
    }
    
    //Checking if a File is Readable/Writable/Executable/Deletable
    class func isExecutable (path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.isExecutableFileAtPath(path)
    }
    
    //Checking if a File is Readable/Writable/Executable/Deletable
    class func isDeletable (path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.isDeletableFileAtPath(path)
    }
    
}