//
//  File.swift
//  
//
//  Created by James Rochabrun on 1/2/24.
//

import Foundation

public struct AudioMetaData {
   
   let tags: String?
   let prompt: String
   let gptDescriptionPrompt: String?
   let audioPromptId: String?
   let history: String?
   let concatHistory: String?
   let type: String?
   let duration: Double?
   let refundCredits: Bool?
   let stream: Bool?
   let errorType: String?
   
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
