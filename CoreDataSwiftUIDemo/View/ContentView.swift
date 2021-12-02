//
//  ContentView.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        EmployeeListView()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
