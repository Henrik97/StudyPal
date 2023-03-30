//
//  TagView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 24/02/2023.
//

import SwiftUI

struct TagView: View {
    
    var maxLimit: Int
    @Binding var tags: [Tag]
    var title: String = "Add Some Tags"
    var fontSize: CGFloat = 16
    var body: some View {
        
  
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 2){
                    
                    ForEach(getRows(),id: \.self ) {rows in
                        
                        HStack(spacing: 3)
                        {
                            ForEach(rows){row in
                                
                                RowView(tag: row)
                            }
                        }
                    
                }
                .frame(width: UIScreen.main.bounds.width-80, alignment: .leading)
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity)
            
        }
        .onChange(of: tags) { newValue in
            
            guard let last = tags.last else{
                return
            }
            
            let font = UIFont.systemFont(ofSize: fontSize)
            
            let attributes = [NSAttributedString.Key.font: font]
            
            let size = (last.text as NSString).size(withAttributes: attributes)
            
            // updating size
            
            tags [getIndex(tag: last)].size = size.width
        }
        
    }
    
    @ViewBuilder
    func RowView(tag: Tag)->some View{
        
        Text(tag.text)
            .font(.system(size: fontSize))
            .padding(.horizontal,14)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.gray)
            )
            .foregroundColor(Color.black)
        
    }
    
    func getIndex(tag: Tag)->Int {
        let index = tags.firstIndex{currentTag in
            return tag.id == currentTag.id
            
        } ?? 0
        return index
    }
    func getRows()->[[Tag]]{
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth: CGFloat = UIScreen.main.bounds.width-90
        
        tags.forEach{ tag in
            totalWidth += (tag.size + 40)
            
            if totalWidth > screenWidth{
                
                totalWidth = 0
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
                
            } else {
                currentRow.append(tag)
            }
            
        }
        if !currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
            
        }
        return rows
    }
    
}
    
    
    
    struct TagView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

