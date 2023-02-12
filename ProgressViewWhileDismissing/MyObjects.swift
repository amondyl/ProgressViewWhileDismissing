//
//  MyObjects.swift
//  ProgressViewWhileDismissing
//
//  Created by Klaus Menning on 12.02.23.
//

import Foundation
class MyStates: ObservableObject{
    @Published var inProgress: Bool = false
    @Published var toPresent: Bool = false
}
struct SingerAndSongs{
    let singerSongWriter = ["Neil Young", "Bob Dylan", "Leonard Cohen"]
    let album = ["Neil Young":["Harvest ", "On the Beach", "Long May You Run", "Rust Never Sleeps"], "Bob Dylan":["The Freewheelin' Bob Dylan", "Another Side of Bob Dylan", "Pat Garrett & Billy the Kid"], "Leonard Cohen":["Songs from a Room", "Songs of Love and Hate", "Death of a Ladies' Man"]]
   
}
struct SingerIdentifiable: Identifiable {
    var id: Int
    var name: String
}
struct AlbumIdentifiable: Identifiable {
    var id: Int
    var title: String
}
func getSingerIdentifiable() -> [SingerIdentifiable]{
    let singerAndSongs = SingerAndSongs()
    var singerIds = [SingerIdentifiable]()
    var counter = 0
    for singer in singerAndSongs.singerSongWriter{
        counter += 1
        let singerId = SingerIdentifiable(id: counter, name: singer)
        singerIds.append(singerId)
    }
    return singerIds
}
func getAlbumIdentifiable(singer: String) -> [AlbumIdentifiable]{
    let singerAndSongs = SingerAndSongs()
    var albumIds = [AlbumIdentifiable]()
    var counter = 0
    for album in singerAndSongs.album[singer] ?? []{
        counter += 1
        let albumId = AlbumIdentifiable(id: counter, title: album)
        albumIds.append(albumId)
    }
    return albumIds
}
