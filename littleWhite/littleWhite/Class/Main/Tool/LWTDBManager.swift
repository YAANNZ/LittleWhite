//
//  LWTDBManager.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/12.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit
import FMDB

class LWTDBManager: NSObject {
    // 单例
    static let sharedManager = LWTDBManager()
    
    var db_Queue:FMDatabaseQueue!
    
    var dbQueue:FMDatabaseQueue {
        set {
            db_Queue = dbQueue
        }
        
        get {
            if (db_Queue == nil) {
                var tempDbQueue = FMDatabaseQueue()
                let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
                
                let path = documentPath.appendingPathComponent("fmdb.db")
                print("path: \(path)")
                // 打开数据库,如果数据库不存在会创建
                tempDbQueue = FMDatabaseQueue(path: path)
                db_Queue = tempDbQueue
                // 创建表
                createTables()
            }
            return db_Queue
        }
    }
    
    override init() {
        super.init()
    }
    
//    private func createTable() {
//        // 通过文件来加载sql语句,在文件中可以编写多条sql语句
//        let bundlePath = Bundle.main.path(forResource: "table", ofType: "sql")!
//        let sql = try! String(contentsOfFile: bundlePath)
//
//        dbQueue.inDatabase { (db) -> Void in
//            db.executeStatements(sql)
//        }
//    }
    
    func createTables() {
        dbQueue.inDatabase { (db) in
            db.executeStatements("CREATE TABLE IF NOT EXISTS t_lwtTasks (id INTEGER PRIMARY KEY AUTOINCREMENT, creatTime TEXT NOT NULL, task TEXT NOT NULL);")
        }
    }
}
