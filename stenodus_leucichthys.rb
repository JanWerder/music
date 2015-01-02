use_bpm 140
use_synth_defaults release: 0.3, amp: 1, cutoff: 130

heights = [0.7,1.9,2.85,3.8,3,2,3,2,1.8]
mods = [0.8,0.9,0.7,1.2,0.7,1.3,0.6]


in_thread do
  for i in 0..2
    for i in mods
      for j in heights
        with_fx :wobble, phase:1, wave: 2, filter: 1, res: 0.5 do
          sleep 0.6
          sample :bd_klub, amp: 1
          sample :bd_zome, amp: 0.2
          sleep 0.2
          sample :ambi_glass_hum, amp: 1,rate: heights[j]*mods[i]
          sleep 0.1
          sample :drum_cymbal_pedal, amp: 0.5
          if j % 2 == 0
            sample :drum_tom_mid_soft, amp: 0.5
          else
            sample :drum_tom_mid_hard, amp: 0.5
          end
        end
      end
      sample :bd_zome, amp: 0.7
    end
    sample :bass_trance_c, amp: 0.1
  end
end
