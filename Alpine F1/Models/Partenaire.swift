//
//  Partenaire.swift
//  BWT Alpine F1 Team
//
//  Created by Florian DAVID on 13/05/2024.
//

import Foundation

struct Partenaire: Codable {
    let _id: String
    let name: String
    let type: TypePartenaire
    let description: String
    let image_white: URL
    let image_black: URL
    let site: URL?
    let socialNetworks: [SocialNetwork]
    
    init() {
        self._id = "66420d689ed80838e9d24c74"
        self.name = "BWT"
        self.type = TypePartenaire(_id: "663fb577cbe5b15a717b6274", name: "Partenaire titre")
        self.description = "Le Groupe Best Water Technology (BWT) se distingue en étant le leader européen des technologies de l’eau, avec une équipe dédiée de plus de 5500 professionnels dans le monde entier. Sa principale mission s’articule autour de solutions pionnières économiques et écologiques du traitement de l’eau pour différents secteurs, dont les ménages, les commerces, les industries, les entreprises, les restaurants, les hôtels et les municipalités. Les innovations de BWT font non seulement de l’eau la ressource la plus précieuse de la planète, mais elles garantissent aussi une expérience quotidienne de l’eau des plus sures, des plus saines, des plus hygiéniques et un bien-être général maximum.\n\nBWT propose des technologies et services modernes de minéralisation pour de nombreuses utilisations, dont les eaux potables, pharmaceutiques, traitées, de chauffage et de chaudière, mais aussi pour les systèmes de refroidissement, de climatisation ainsi que les piscines, car chaque goutte mérite le meilleur. À l’échelle internationale, les équipes de recherche et de développement de BWT s’appuient sur des méthodes de pointe pour inventer de nouveaux procédés et matériaux afin de créer des produits écologiques et économiques repoussant les frontières de l’innovation.\n\nLe développement durable est au cœur de l’identité de BWT, chaque produit jouant un rôle important dans la conservation de la ressource la plus précieuse – l’eau – tout en minimisant son impact sur l’environnement. La devise « For You and Planet Blue » souligne son engagement à relever les défis mondiaux, en se concentrant sur la réduction des émissions de CO2 et la priorisation du bien-être individuel à travers les mesures liées à la durabilité.\n\nLa mission est claire : fournir une eau potable de haute qualité aux populations de la planète tout en minimisant l’utilisation de bouteilles en plastique ou en verre à usage unique. Favorisant non seulement un mode de vie sain, cela simplifie également les complexités liées au transport, au stockage et à l’élimination des bouteilles d’eau à usage unique. BWT accorde une attention particulière à la durabilité, à la responsabilité sociale et à l’utilisation réfléchie de ressources limitées afin de transmettre un monde meilleur aux futures générations.\n\nDécouvrez comment BWT traduit les changements de vie en histoires de changements tout en étant un partenaire durable pour chacun. Retrouvez plus d’informations sur le groupe sur www.bwt.com.\n\n\nLE ROSE POUR MENER LE CHANGEMENT\nEn 2024, le partenariat avec BWT Alpine F1 Team continue d’être la pierre angulaire de l’engagement de BWT sur la scène du sport international. Cette coopération innovante étend sa mission « Change the World – sip by sip » au monde dans la couleur rose désormais bien connue. Pour BWT, le rose est toutefois bien plus qu’une simple couleur, car il représente une véritable attitude.\nL’impact va au-delà de la présentation du rose comme attitude auprès d’un public mondial. La F1® constitue une plateforme cruciale pour démontrer comment l’innovation peut générer des changements positifs sur la piste et en dehors. BWT apporte un soutien inestimable aux événements et aux athlètes qu’il parraine. Engagé dans la réduction de l’utilisation de bouteilles en plastique ou en verre à usage unique, BWT a installé des bars à eau dans les paddocks pour offrir à toute l’équipe et aux fans la meilleure eau minéralisée sur place. Tout le monde peut ainsi bénéficier de l’eau locale, enrichie en magnésium, zinc et silicate.\nUne fois de plus, BWT place la ressource précieuse de notre planète – l’eau – en pole position et étant plus engagé que jamais dans la lutte pour le changement."
        self.image_white = URL(string: "https://cdn.group.renault.com/alp/master/formula-1/logos-footer-parnters/White-BWT.png")!
        self.image_black = URL(string: "https://cdn.group.renault.com/alp/master/formula-1/logos-footer-parnters/Black-BWT.png")!
        self.site = URL(string: "https://www.bwt.com")
        self.socialNetworks = [
            SocialNetwork(_id: "66420d679ed80838e9d24c6c", accountName: "bwtglobal", unit: TypeSocialNetwork(_id: "65a16acce662cb7b7d7c2846", name: "Facebook"), url: URL(string: "https://www.facebook.com/bwtglobal")!),
            SocialNetwork(_id: "66420d689ed80838e9d24c6f", accountName: "BWTwatertechnology", unit: TypeSocialNetwork(_id: "65a16b37e662cb7b7d7c284b", name: "YouTube"), url: URL(string: "https://www.youtube.com/user/BWTwatertechnology")!)
        ]
    }
}

struct TypePartenaire: Codable {
    let _id: String
    let name: String
}
