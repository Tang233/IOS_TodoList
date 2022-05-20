import SwiftUI

@main
struct TodoListApp: App {
    
    //Define property wrapper type that initiates the observable object
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //The first screen in our app!
                ListView()
            }
            //device adaptation for iPad and the other large devices
            .navigationViewStyle(StackNavigationViewStyle())
            //share the object info of the listViewModel in the ListView
            .environmentObject(listViewModel)
        }
    }
}
