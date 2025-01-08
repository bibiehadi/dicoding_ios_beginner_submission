//
//  Untitled.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 07/01/25.
//
import UIKit

struct PokemonModel {
    let number: String
    let name: String
    let description: String
    let type: String
    let photo: URL
    let weakness: [String]
    let skills: [String]
    let type_image: URL
}

let pokemons = [
PokemonModel(
    number: "#006",
    name: "Charizard",
    description: "Charizard is a dragon-like Pokémon that loves to soar through the sky, spitting flames that can melt anything. Its fiery tail burns hotter as it gets more powerful.",
    type: "fire",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png")!,
    weakness: ["Water", "Electric", "Rock"],
    skills: ["Flamethrower (90)", "Fly (70)", "Dragon Claw (50)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/f/f9/Fire_icon_HOME3.png")!
),
PokemonModel(
    number: "#150",
    name: "Mewtwo",
    description: "Mewtwo is a genetically engineered Pokémon created to be the ultimate fighter. Its psychic abilities are unparalleled, making it a fearsome opponent.",
    type: "psychic",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/150.png")!,
    weakness: ["Bug", "Ghost", "Dark"],
    skills: ["Psystrike (100)", "Recover (0)", "Shadow Ball (50)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/2/2d/Psychic_icon_HOME3.png")!
),
PokemonModel(
    number: "#025",
    name: "Pikachu",
    description: "Pikachu is a mouse-like Pokémon known for its cuteness and ability to store electricity in its cheeks. It’s quick and clever in battles.",
    type: "electric",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png")!,
    weakness: ["Ground"],
    skills: ["Thunderbolt (50)", "Quick Attack (20)", "Electro Ball (40)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/c/cf/Electric_icon_HOME3.png")!
),
PokemonModel(
    number: "#493",
    name: "Arceus",
    description: "Known as the creator of the Pokémon universe, Arceus is a mythical Pokémon with godlike powers, able to change its type based on the Plates it holds.",
    type: "normal",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/493.png")!,
    weakness: ["Fighting"],
    skills: ["Judgment (100)", "Recover (0)", "Extreme Speed (60)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/8/8c/Normal_icon_HOME3.png")!
),
PokemonModel(
    number: "#384",
    name: "Raichu",
    description: "Raichu is the evolved form of Pikachu. It’s faster and stronger, with the ability to unleash electric surges that light up the battlefield.",
    type: "electric",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/384.png")!,
    weakness: ["Ground"],
    skills: ["Thunder (100)", "Volt Tackle (90)", "Iron Tail (50)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/c/cf/Electric_icon_HOME3.png")!
),
PokemonModel(
    number: "#133",
    name: "Eevee",
    description: "Eevee is a fox-like Pokémon known for its adaptability and ability to evolve into many forms depending on environmental influences.",
    type: "normal",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/133.png")!,
    weakness: ["Fighting"],
    skills: ["Swift (30)", "Bite (40)", "Helping Hand (0)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/8/8c/Normal_icon_HOME3.png")!
),
PokemonModel(
    number: "#448",
    name: "Articuno",
    description: "Articuno is a legendary bird with the ability to control ice. It creates beautiful snowfalls wherever it flies.",
    type: "ice",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/448.png")!,
    weakness: ["Fire", "Electric", "Steel", "Rock"],
    skills: ["Blizzard (120)", "Hurricane (110)", "Roost (0)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/8/86/Ice_icon_HOME3.png")!
),
PokemonModel(
    number: "#658",
    name: "Jigglypuff",
    description: "Jigglypuff’s songs are so soothing that they can put anyone to sleep. It uses this to its advantage in battles.",
    type: "fairy",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/658.png")!,
    weakness: ["Steel", "Poison"],
    skills: ["Sing (0)", "Hyper Voice (70)", "Dazzling Gleam (80)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/0/0b/Fairy_icon_HOME3.png")!
),
PokemonModel(
    number: "#007",
    name: "Squirtle",
    description: "Squirtle is a small turtle Pokémon known for its protective shell and ability to spray water at high pressure.",
    type: "water",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/7.png")!,
    weakness: ["Electric", "Grass"],
    skills: ["Water Gun (30)", "Aqua Tail (60)", "Protect (0)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/e/e7/Water_icon_HOME3.png")!
),
PokemonModel(
    number: "#001",
    name: "Bulbasaur",
    description: "Bulbasaur carries a plant bulb on its back that grows as it absorbs sunlight. It is calm and reliable.",
    type: "grass",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png")!,
    weakness: ["Fire", "Psychic", "Flying", "Ice"],
    skills: ["Vine Whip (25)", "Razor Leaf (45)", "Leech Seed (30)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/8/81/Grass_icon_HOME3.png")!
),
PokemonModel(
    number: "#004",
    name: "Charmander",
    description: "A small lizard-like Pokémon with a flame on its tail that represents its life force. It’s loyal and determined.",
    type: "fire",
    photo: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png")!,
    weakness: ["Water", "Ground", "Rock"],
    skills: ["Ember (30)", "Fire Fang (40)", "Smokescreen (0)"],
    type_image: URL(string: "https://archives.bulbagarden.net/media/upload/f/f9/Fire_icon_HOME3.png")!
)
]
