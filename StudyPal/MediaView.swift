//
//  MediaView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 27/04/2023.
//

import SwiftUI

struct MediaView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    
    @StateObject var dataModel = DataModel()
    var body: some View {
        NavigationStack {
        GridView()
        }
        .environmentObject(dataModel)
        
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
    }
}
