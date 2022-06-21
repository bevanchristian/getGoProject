//
//  DetailView.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var data: DetailModel?
    @State var loadedImage: UIImage? = nil
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                KFImage(URL(string: data?.image ?? ""))
                    .placeholder({
                       Image(systemName: "plus")
                            .resizable()
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.5)
                    })
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height * 0.4, alignment: .center)
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(data?.name ?? "")")
                        .font(.title)
                    Text("\(data?.type ?? "")")
                        .font(.title2)
                    HStack {
                        Text("\(data?.gender ?? "")")
                        Text("\(data?.type ?? "")")
                        Text("\(data?.origin ?? "")")
                    }
                }
                .foregroundColor(.black)
                .padding()
            }
        }.onAppear {
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
