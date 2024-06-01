//
//  PostSN.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 16/05/2024.
//

import Foundation

struct PostSN: Codable {
    let id: String
    let username: String
    let text: String
    let medias: [MediaSN]
    let date: String
    
    init() {
        self.id = "3369294469010226266_185117962"
        self.username = "alpinef1team"
        self.text = "Approved and signed by @pierregasly 👀\n\nDiscover more about BWT Alpine F1 Team Simulator at @f1authentics"
        self.medias = [
            MediaSN(url: URL(string: "https://scontent-mrs2-2.cdninstagram.com/o1/v/t16/f2/m69/An-1B8JGkdh-I-lDsDlEol_sYSaOx3-hN0SMoPxDCkpFp2kBG6kXyZaBan4GE2bpOizcg6fS01Y0fyr4dTcOlTg.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLmNsaXBzLmMyLjEwODAuYmFzZWxpbmUifQ&_nc_ht=scontent-mrs2-2.cdninstagram.com&_nc_cat=107&vs=972398357723007_699425578&_nc_vs=HBksFQIYOnBhc3N0aHJvdWdoX2V2ZXJzdG9yZS9HQklrRlJPZ2dlYmhEVXNCQUxweDZiMzhpcE5ZYnBSMUFBQUYVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dCZklmaHAzTmVhR2pEd0ZBSkRMbWJ4NFNIOEpicV9FQUFBRhUCAsgBACgAGAAbABUAACaiponZ48%2FyQBUCKAJDMywXQFGHGp%2B%2BdskYFmRhc2hfYmFzZWxpbmVfMTA4MHBfdjERAHX%2BBwA%3D&_nc_rid=0b21d29fa4&ccb=9-4&oh=00_AYA7Db17AtBDVOGNLbn5-BQqF3F0f5tCEttBHOeWQozFOg&oe=6650649E&_nc_sid=b41fef")!, type: .video)
        ]
        self.date = "21 mai 2024"
    }
}

struct MediaSN: Codable {
    let id = UUID()
    let url: URL
    let type: TypeMediaSN
    
    enum CodingKeys: String, CodingKey {
        case url
        case type
    }
    
    init(url: URL, type: TypeMediaSN) {
        self.url = url
        self.type = type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(URL.self, forKey: .url)
        self.type = TypeMediaSN(rawValue: try container.decode(String.self, forKey: .type))!
    }
}

enum TypeMediaSN: String, Codable, CaseIterable {
    case image
    case video
}
