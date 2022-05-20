import SwiftUI

struct ListRowView: View {

    let item: ItemModel
    
    var body: some View {
        //A view that arranges its children in a horizontal line.
        HStack {
            /*if the item is completed, show the green check mark circle, if not,shows the red circle*/
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Fist Item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item!", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item:item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
