//
//  Drummer.swift
//  Drummer
//
//  Created by Paige Plander on 12/28/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import Foundation
import AVFoundation

class Drummer {
    
    /// Filenames for the available drums
    let audioFileNames = ["drum0.wav", "drum1.wav", "drum2.wav", "drum3.wav", "drum4.wav", "drum5.wav", "kick.wav"]
    
    /// AVPlayers for each of the available drums
    var audioPlayers = [AVAudioPlayer?]()
    
    init() {
        for filename in audioFileNames {
            if let audioURL = Bundle.main.url(forResource: filename, withExtension: nil) {
                do {
                    let audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer.prepareToPlay()
                    audioPlayers.append(audioPlayer)
                }
                catch {
                    print(error)
                }
                
            }
            else {
                audioPlayers.append(nil)
                print("Error creating a audio player from the file \(filename)")
            }
        }
    }
    
    /// Plays the audio file for drum associated with the given tag
    ///
    /// - Parameter tag: The tag of the drum button pressed
    func playDrumSound(forDrumWithTag tag: Int) {
        if let audioPlayer = audioPlayers[tag] {
            audioPlayer.play()
        }
    }
}
