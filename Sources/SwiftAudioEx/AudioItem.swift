//
//  AudioItem.swift
//  SwiftAudio
//
//  Created by Jørgen Henrichsen on 18/03/2018.
//

import Foundation
import AVFoundation
import UIKit

public enum SourceType {
    case stream
    case file
}

public protocol AudioItem {
   
   func getID() -> String
   func getSourceUrl() -> String
   func getArtist() -> String?
   func getTitle() -> String?
   func getAlbumTitle() -> String?
   func getSourceType() -> SourceType
   func getArtworkURL() -> String
}

/// Make your `AudioItem`-subclass conform to this protocol to control which AVAudioTimePitchAlgorithm is used for each item.
public protocol TimePitching {
    
    func getPitchAlgorithmType() -> AVAudioTimePitchAlgorithm
    
}

/// Make your `AudioItem`-subclass conform to this protocol to control enable the ability to start an item at a specific time of playback.
public protocol InitialTiming {
    func getInitialTime() -> TimeInterval
}

/// Make your `AudioItem`-subclass conform to this protocol to set initialization options for the asset. Available keys available at [Apple Developer Documentation](https://developer.apple.com/documentation/avfoundation/avurlasset/initialization_options).
public protocol AssetOptionsProviding {
    func getAssetOptions() -> [String: Any]
}

public class DefaultAudioItem: AudioItem, Identifiable {

    public var audioUrl: String
    
    public var artist: String?
    
    public var title: String?
    
    public var albumTitle: String?
    
    public var sourceType: SourceType
    
    public var artworkUrl: String
   
   public var id: String
    
   public init(id: String, audioUrl: String, artist: String? = nil, title: String? = nil, albumTitle: String? = nil, sourceType: SourceType, artworkUrl: String) {
      self.id = id
      self.audioUrl = audioUrl
      self.artist = artist
      self.title = title
      self.albumTitle = albumTitle
      self.sourceType = sourceType
      self.artworkUrl = artworkUrl
   }
    
    public func getSourceUrl() -> String {
        audioUrl
    }
    
    public func getArtist() -> String? {
        artist
    }
    
    public func getTitle() -> String? {
        title
    }
    
    public func getAlbumTitle() -> String? {
        albumTitle
    }
    
    public func getSourceType() -> SourceType {
        sourceType
    }

   public func getArtworkURL() -> String {
         artworkUrl
    }
   
   public func getID() -> String {
      id
   }
    
}

/// An AudioItem that also conforms to the `TimePitching`-protocol
public class DefaultAudioItemTimePitching: DefaultAudioItem, TimePitching {
    
    public var pitchAlgorithmType: AVAudioTimePitchAlgorithm
    
   public override init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String) {
        pitchAlgorithmType = AVAudioTimePitchAlgorithm.timeDomain
      super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
   public init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String, audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm) {
        pitchAlgorithmType = audioTimePitchAlgorithm
       super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
    public func getPitchAlgorithmType() -> AVAudioTimePitchAlgorithm {
        pitchAlgorithmType
    }
}

/// An AudioItem that also conforms to the `InitialTiming`-protocol
public class DefaultAudioItemInitialTime: DefaultAudioItem, InitialTiming {
    
    public var initialTime: TimeInterval
    
   public override init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String) {
        initialTime = 0.0
      super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
   public init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String, initialTime: TimeInterval) {
        self.initialTime = initialTime
      super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
    public func getInitialTime() -> TimeInterval {
        initialTime
    }
    
}

/// An AudioItem that also conforms to the `AssetOptionsProviding`-protocol
public class DefaultAudioItemAssetOptionsProviding: DefaultAudioItem, AssetOptionsProviding {
    
    public var options: [String: Any]
    
   public override init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String) {
        options = [:]
      super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
   public init(id: String, audioUrl: String, artist: String?, title: String?, albumTitle: String?, sourceType: SourceType, artworkUrl: String, options: [String: Any]) {
        self.options = options
      super.init(id: id, audioUrl: audioUrl, artist: artist, title: title, albumTitle: albumTitle, sourceType: sourceType, artworkUrl: artworkUrl)
    }
    
    public func getAssetOptions() -> [String: Any] {
        options
    }
}
