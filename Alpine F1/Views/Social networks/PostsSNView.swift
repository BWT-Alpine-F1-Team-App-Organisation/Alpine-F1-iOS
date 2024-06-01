//
//  PostsSNView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import SwiftUI
import AVKit

struct PostsSNView: View {
    @State var posts: [PostSN]
    @State var sheetPost = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
            ForEach(posts, id: \.self.id) { post in
                VStack(alignment: .center) {
                    NavigationLink(destination: PostTeamView(post: post)) {
                        if post.medias[0].type == .video {
                            VideoThumbnailView(videoURL: post.medias[0].url)
                        } else {
                            AsyncImage(url: post.medias[0].url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 250)
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 250)
                            }
                        }
                    }
                    
                    Text(post.username)
                        .semibold(size: 14)
                        .foregroundColor(.accentColor)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct VideoThumbnailView: View {
    @State var videoURL: URL
    @State private var thumbnailImage: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = thumbnailImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
            } else {
                Color.clear
            }
        }
        .onAppear(perform: {
            generateThumbnail()
        })
    }
    
    private func generateThumbnail() {
        let asset = AVAsset(url: videoURL)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTime(seconds: 1, preferredTimescale: 60)
        
        do {
            let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
            DispatchQueue.main.async {
                self.thumbnailImage = UIImage(cgImage: cgImage)
            }
        } catch {
            print("Error generating thumbnail: \(error.localizedDescription)")
        }
    }
}


#Preview {
    PostsSNView(posts: [PostSN(), PostSN()])
}
