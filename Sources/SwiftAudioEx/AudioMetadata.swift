//
//  File.swift
//  
//
//  Created by James Rochabrun on 1/2/24.
//

import Foundation

public struct AudioMetaData {
   
   public let tags: String?
   public let prompt: String
   public let gptDescriptionPrompt: String?
   public let audioPromptId: String?
   public let history: String?
   public let concatHistory: String?
   public let type: String?
   public let duration: Double?
   public let refundCredits: Bool?
   public let stream: Bool?
   public let errorType: String?
   
   public init(
      tags: String? = nil,
      prompt: String,
      gptDescriptionPrompt: String? = nil,
      audioPromptId: String? = nil,
      history: String? = nil,
      concatHistory: String? = nil,
      type: String? = nil,
      duration: Double? = nil,
      refundCredits: Bool? = nil,
      stream: Bool? = nil,
      errorType: String? = nil)
   {
      self.tags = tags
      self.prompt = prompt
      self.gptDescriptionPrompt = gptDescriptionPrompt
      self.audioPromptId = audioPromptId
      self.history = history
      self.concatHistory = concatHistory
      self.type = type
      self.duration = duration
      self.refundCredits = refundCredits
      self.stream = stream
      self.errorType = errorType
   }
}
