//
//  ErrorAlert.swift
//  getGoProject
//
//  Created by bevan christian on 21/06/22.
//

import SwiftUI

struct ErrorAlert: View {
    @Binding var errorAlert: String
    var body: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text("\(errorAlert)")
                        .foregroundColor(.white)
                }
                .frame(width: geo.size.width * 0.8, height: 10, alignment: .center)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct ErrorAlert_Previews: PreviewProvider {
    static var previews: some View {
        ErrorAlert(errorAlert: .constant("api error"))
    }
}
