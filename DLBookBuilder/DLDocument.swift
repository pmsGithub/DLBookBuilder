//
//  DLDocument.swift
//  DLBookBuilder
//
//  Created by Paul M Sweazey on 30.06.23.
//

import SwiftUI
import UniformTypeIdentifiers

struct DLDocument: FileDocument, Codable {
    static var readableContentTypes = [UTType(exportedAs: "com.sweazey.dlbook")]
    var bookTitle = ""
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self=try JSONDecoder().decode(DLDocument.self, from: data)
        }
    }
    
    init() {
        // Creates a document using just default property values
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(self)
        return FileWrapper(regularFileWithContents: data)
    }
}
