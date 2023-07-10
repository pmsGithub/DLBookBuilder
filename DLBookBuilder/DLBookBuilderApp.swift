//
//  DLBookBuilderApp.swift
//  DLBookBuilder
//
//  Created by Paul M Sweazey on 30.06.23.
//

import SwiftUI

@main
struct DLBookBuilderApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DLDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
