//
//  MyShellsModel.swift
//  ShellFinder 2.0
//
//  Created by Yaroslav Matusevich on 6/16/24.
//

import Foundation

class MyShellsModel {
    
    private static var entries = [HistoryEntry]()
    
    public static func getEntries() -> [HistoryEntry] {
        MyShellsModel.test()
        return entries
    }
    
    public static func addEntry(entry: HistoryEntry) {
        entries.append(entry)
    }
    
    public static func test() {
        ShellDatabase.populateMap()
        let shell1 = ShellDatabase.getShellInfo(shellName: "Atlantic Razor Clam")
        let entry1 = HistoryEntry(shell: shell1, date: "June 9th, 2024")
        entries.append(entry1)
    }
}
