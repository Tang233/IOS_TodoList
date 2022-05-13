//
//  AddView.swift
//  TodoList
//
//  Created by Jin Tang on 14/5/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9))
                    .cornerRadius(10)
               Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .frame(maxWidth:.infinity)
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if(isTextAppropriate()) {
            listViewModel.addItem(title: textFieldText)
            //Jump back to the item list page
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isTextAppropriate() -> Bool {
        if (textFieldText.count<3) {
            alertTitle = "New todo item must be at least 3 characters long! 😥"
            showAlert.toggle()
            return false
        }
        return true
    }
        
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
