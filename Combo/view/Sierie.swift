//
//  Sierie.swift
//  Combo
//
//  Created by Young Ju on 3/5/22.
//

import Speech
import UIKit

class Sierie {
    
    let audioEng = AVAudioEngine()
    let speechR = SFSpeechRecognizer()
    let req = SFSpeechAudioBufferRecognitionRequest()
    var rTask: SFSpeechRecognitionTask!
    var isStart = false
    weak var spokenText: UILabel!
 
    func startSpeechRec(cmd: String)  {
        
        let nd = audioEng.inputNode
        let recordF = nd.outputFormat(forBus: 0)
        
        nd.installTap(onBus: 0, bufferSize: 1024, format: recordF) {
            (buffer , _) in self.req.append(buffer)
            
        }
        
        audioEng.prepare()
        
        do {
            try audioEng.start()
        }
        catch let err {
            print(err)
        }
        
        rTask = speechR?.recognitionTask(with: req, resultHandler: { [self] (resp, error) in
            guard resp != nil else {
                print(error.debugDescription)
                return
            }
            
            let msg = resp?.bestTranscription.formattedString
//            self.spokenText.text = msg!
            
            var str: String = ""
            for seg in resp!.bestTranscription.segments {
                let indexTo = msg!.index(msg!.startIndex, offsetBy: seg.substringRange.location)
                str = String(msg![indexTo...])
            }
            if str == cmd {
                return ()
            }
        })
        
     }

     func cancelSpeechRec() {
                rTask.finish()
                rTask.cancel()
                rTask = nil
                req.endAudio()
                audioEng.stop()
                if audioEng.inputNode.numberOfInputs > 0 {
                    audioEng.inputNode.removeTap(onBus: 0)
                }
            }
        }

