//
//  EmployeeListView.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//

import SwiftUI

struct EmployeeListView: View {
    
    @Environment(\.managedObjectContext)
    private var viewContext
    
    // Fetch Request
    @FetchRequest(sortDescriptors: [])
    private var employeeList: FetchedResults<Employee>
    
    @State private var showAddEmployeeSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(employeeList, id:\.self) { employee in
                        NavigationLink(destination: {
                            AddEmployeeView(employee: employee)
                        }) {
                            
                            VStack {
                                Text(employee.name ?? "No name")
                                    .font(.headline)
                                Text(employee.city ?? "No city")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: deleteEmployees(at:))
                }
                .navigationTitle("Employee List")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    showAddEmployeeSheet = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }))
                .sheet(isPresented: $showAddEmployeeSheet) {
                    AddEmployeeView()
                }
                .toolbar {
                    EditButton()
                }
            }
        }
    }
    
    func deleteEmployees(at offsets: IndexSet) {
        for index in offsets {
            let employee = employeeList[index]
            viewContext.delete(employee)
            
            try! viewContext.save()
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
