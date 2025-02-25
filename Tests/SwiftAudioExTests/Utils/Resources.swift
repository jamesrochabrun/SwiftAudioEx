import Foundation
import SwiftAudioEx
import UIKit

struct Source {
   static let path: String = Bundle.module.path(forResource: "TestSound", ofType: "m4a")!
   static let url: URL = URL(fileURLWithPath: Source.path)
   
   static func getAudioItem() -> AudioItem {
      return DefaultAudioItem(id: "", audioUrl: self.path, artist: "Artist", title: "Title", albumTitle: "AlbumTitle", sourceType: .file, artworkUrl: "", metadata: .init(prompt: ""))
   }
}

struct ShortSource {
   static let path: String = Bundle.module.path(forResource: "ShortTestSound", ofType: "m4a")!
   static let url: URL = URL(fileURLWithPath: ShortSource.path)
   
   static func getAudioItem() -> AudioItem {
      return DefaultAudioItem(id: "", audioUrl: self.path, sourceType: .file, artworkUrl: "", metadata: .init(prompt: ""))
   }
}

struct LongSource {
   static let path: String = Bundle.module.path(forResource: "WAV-MP3", ofType: "wav")!
   static let url: URL = URL(fileURLWithPath: LongSource.path)
   
   static func getAudioItem() -> AudioItem {
      return DefaultAudioItem(id: "", audioUrl: self.path, sourceType: .file, artworkUrl: "", metadata: .init(prompt: ""))
   }
}

struct FiveSecondSource {
   static let path: String = Bundle.module.path(forResource: "five_seconds", ofType: "m4a")!
   static let url: URL = URL(fileURLWithPath: FiveSecondSource.path)
   
   static func getAudioItem() -> AudioItem {
      return DefaultAudioItem(id: "", audioUrl: self.path, sourceType: .file, artworkUrl: "", metadata: .init(prompt: ""))
   }
}

struct FiveSecondSourceWithInitialTimeOfFourSeconds {
   static let path: String = Bundle.module.path(forResource: "five_seconds", ofType: "m4a")!
   static let url: URL = URL(fileURLWithPath: FiveSecondSource.path)
   
   static func getAudioItem() -> AudioItem {
      return DefaultAudioItemInitialTime(
         id: "", audioUrl: self.path,
         artist: "a",
         title: "a",
         albumTitle: "a",
         sourceType: .file,
         artworkUrl: "",
         initialTime: 4,
         metadata: .init(prompt: "")
      )
   }
}
