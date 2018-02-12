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
    
    let dbQueue: FMDatabaseQueue
    
    override init() {
        
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        
        let path = documentPath.appendingPathComponent("fmdb.db")
        print("path: \(path)")
        
        // 创建FMDatabaseQueue对象会自动打开数据库,如果数据库不存在会创建数据库
        // 后续的所有数据库操作都是通过dbQueue来调用
        dbQueue = FMDatabaseQueue(path: path)
        
        super.init()
        // 创建数据表
        createTable()
    }
    
    private func createTable() {
        // 通过文件来加载sql语句,在文件中可以编写多条sql语句
        let bundlePath = Bundle.main.path(forResource: "table", ofType: "sql")!
        let sql = try! String(contentsOfFile: bundlePath)

        
        dbQueue.inDatabase { (db) -> Void in
            db.executeStatements(sql)
        }
    }
}
