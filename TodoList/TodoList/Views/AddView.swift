//
//  AddView.swift
//  TodoList
//
//  Created by Jin Tang on 14/5/2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9))
                    .cornerRadius(10)
               Button(
                    action: {
                        
                    },
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
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
