use_bpm 130
heights = [38,50,62,48,55,60,45,70,65,60,40,56,40,21,15,20,35]
mods = [0.8,0.9,0.7]
verse = [1,1,0.9,0.8]
snare_count = 0

in_thread do
  for i in verse
    for j in mods

      for k in heights      
        use_synth :dull_bell
        play note: k*j*i, amp: rrand(0.4,0.5), mod_wave: 1, attack: rrand(0.2,0.3), sustain: 0.3
        sleep 0.6
        sample :bd_fat, amp: 0.4    
        snare_count = snare_count + 1
        if snare_count % 4 == 0 
          sample :drum_snare_soft, amp: 0.6    
        end
      end
      sample :drum_tom_lo_soft, amp: 0.3
    end 
  end
  sample :pacman_dies_y, amp: 0.2
end

