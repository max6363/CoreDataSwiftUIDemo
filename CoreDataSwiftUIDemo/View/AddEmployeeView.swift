//
//  AddEmployeeView.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//

import SwiftUI

struct AddEmployeeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var nameInput: String = ""
    @State private var cityInput: String = ""
    
    var employee: Employee?
    
    @State private var showAddDeviceSheet: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                      
                Section(header: Text("Employee Details")) {
                    
                    if let e = employee {
                     
                        if let name = e.name {
                            Text("Name: \(name)")
                        } else {
                            Text("No name")
                        }
                        if let city = e.city {
                            Text("City: \(city)")
                        } else {
                            Text("No city")
                        }
                        
                    } else {
                    
                        TextField("name", text: $nameInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("city", text: $cityInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                }
                
                if employee != nil {
                    Section(header: Text("Asset")) {
                                        
                        if let objects = employee?.asset?.allObjects as? [Device] {
                            Text("Count: \(objects.count)")
                            
                            ForEach(objects) { object in
                                Text(object.name ?? "No device name")
                            }
                        }

                        Button(action: {
                            showAddDeviceSheet = true
                        }) {
                            Text("Add Device")
                        }
                    }
                    
                }
                
                if employee == nil {
                    
                    Button(action: {
                        
                        guard self.nameInput != "" else { return }
                        guard self.cityInput != "" else { return }
                        
                        let newEmployee = Employee(context: viewContext)
                        newEmployee.name = self.nameInput
                        newEmployee.city = self.cityInput
                        newEmployee.id = UUID()
                        
                        do {
                            try viewContext.save()
                            print("employee saved")
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                    }) {
                        Text("Add Employee")
                    }
                }
            }
            .navigationTitle(employee == nil ? "Add Employee" : "Employee Details")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .sheet(isPresented: $showAddDeviceSheet) {
            if let e = self.employee {
                AddDeviceView(employee: e)
            }
        }
    }
}

struct AddEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployeeView()
    }
}
