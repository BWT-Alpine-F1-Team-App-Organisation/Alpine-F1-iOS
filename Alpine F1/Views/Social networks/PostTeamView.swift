//
//  PostTeamView.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import SwiftUI
import AVKit

struct PostTeamView: View {
    @State var post: PostSN
    var body: some View {
        ZStack {
            if post.medias.count > 0 {
                TabView {
                    ForEach(post.medias, id: \.self.id) { media in
                        MediaPostPlayer(media: media)
                            .tabItem {
                                Text(media.type.rawValue)
                            }
                    }
                }
                .tabViewStyle(.page)
            } else {
                MediaPostPlayer(media: post.medias[0])
            }
            
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack(spacing: 15) {
                        Image("team-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(post.username.uppercased())
                                .semibold(size: 20)
                            
                            Text(post.username)
                                .regular(size: 16)
                            
                        }
                        Text(post.date)
                            .semibold(size: 16)
                    }
                    Text(post.text)
                        .regular(size: 20)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor.opacity(0.5))
                .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
    }
}

struct MediaPostPlayer: View {
    @State var media: MediaSN
    
    var body: some View {
        ZStack {
            if media.type == .video {
                let player = AVPlayer(url: media.url)
                VideoPlayer(player: player)
                    .onAppear(perform: {
                        player.play()
                    })
            } else {
                AsyncImage(url: media.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    PostTeamView(post: PostSN())
}
