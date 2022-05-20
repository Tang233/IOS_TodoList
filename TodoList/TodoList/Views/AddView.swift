import SwiftUI

struct AddView: View {
    //Create a property called presentationMode and bind it to
    //the presentation mode variable in the app's environment
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    //Use state to save the variable in the view hierarcy
    //When the varibales changed, the views will be updated
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
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
    
    //Save the item to the item list
    func saveButtonPressed() {
        if(isTextAppropriate()) {
            listViewModel.addItem(title: textFieldText)
            //Jump back to the item list page
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    //Input data constraint
    //Check if the input text character length is greater than 3
    func isTextAppropriate() -> Bool {
        if (textFieldText.count<3) {
            alertTitle = "New todo item must be at least 3 characters long! 😥"
            //showAlert changed to true
            showAlert.toggle()
            return false
        }
        return true
    }
    
    //Return the alert content
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
