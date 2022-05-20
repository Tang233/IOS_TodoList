import SwiftUI

struct ListView: View {
    //Create environment object to share data between views in this environment
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        //The ZStack assigns each successive child view a higher z-axis
        //value than the one before it, meaning later children appear “on top” of earlier ones.
        ZStack {
            //if the list have no items, shows the NoItemsView
            if( listViewModel.items.isEmpty ) {
               NoItemsView()
                //Easing animation starts slow and speeds up over time + fade in and fade out
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                //list all the items if there is any items
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                        //Change the (circle styles)item completion status when click item
                            .onTapGesture {
                                //The animation transitions evenly from start to finish over time
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


