//
//  AddDeviceView.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//

import SwiftUI

struct AddDeviceView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) private var presentationMode
    
    var employee: Employee
    
    @State private var nameInput: String = ""
    
    var body: some View {
        NavigationView {
            
            Form {
                      
                Section(header: Text("Device")) {
                    
                    TextField("name", text: $nameInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                
                Button(action: {
                    
                    guard self.nameInput != "" else { return }
                    
                    let newDevice = Device(context: viewContext)
                    newDevice.name = self.nameInput
                    newDevice.id = UUID()
                    
                    self.employee.addToAsset(newDevice)
                                        
                    do {
                        try viewContext.save()
                        print("device saved")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add Device")
                }
            }
            .navigationTitle("Add Device")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView(employee: Employee())
    }
}
