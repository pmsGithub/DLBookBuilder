//
//  ContentView.swift
//  DLBookBuilder
//
//  Created by Paul M Sweazey on 30.06.23.
//

import SwiftUI

/// The top-level View for this app
struct ContentView: View {
    @Binding var document: DLDocument
    @State var eFileContent = ""
    @State var gFileContent = ""
    var body: some View {
        NavigationSplitView {
            VStack {
                Button("Load text…") {
                }
                HStack {
                    Image(systemName: "book")
                    Image(systemName: "arrowshape.forward")
                    Image(systemName: "doc.text")
                }
                .imageScale(.large)
                .foregroundColor(.accentColor)
                Text("Load Text…")
            }
            .padding()
        } detail: {
            HSplitView {
                VStack {
                    Spacer()
                    Text("Left")
                    TextField("Enter English plaintext filepath here…", text: $eFileContent, onCommit: {})
                        .disableAutocorrection(true)
                        .padding()
                        .background(.red)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Text("Right")
                    TextField("Enter German plaintext filepath here…", text: $gFileContent, onCommit: {})
                        .disableAutocorrection(true)
                        .padding()
                        .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(DLDocument()))
    }
}

/// A sample below 'for my information'
//struct ContentView: View {
//    @StateObject private var viewModel = ContentViewModel()
//
//    var body: some View {
//        VStack {
//            if let data = viewModel.data {
//                Text(data.title)
//                    .font(.largeTitle)
//            } else {
//                ProgressView("Loading data…")
//            }
//        }
//        .task {
//            await viewModel.fetchData()
//        }
//    }
//}
