//
//  ListCard.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import SwiftUI

struct ListCard: View {
    var name: String? = ""
    var spesies: String? = ""
    var status: String? = ""
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 10) {
                Text("\(name ?? "")")
                    .font(.title)
                Text("\(spesies ?? "")")
                    .font(.body)
                Text("\(status ?? "")")
                    .font(.caption)
            }
            .foregroundColor(.black)
            Spacer()
        }.padding()
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard()
    }
}
