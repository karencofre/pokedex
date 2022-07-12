//
//  ProgressView.swift
//  pokeDex
//
//  Created by karen cofré on 17-02-22.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        Text("loading...")
        .foregroundColor(.init(UIColor(named:"white")!))
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
