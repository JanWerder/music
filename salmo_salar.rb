use_bpm 130
heights = [38,50,62,48,55,60,45,70,65,60,40,56,40,21,15,20,35]
mods = [0.8,0.9,0.7]
verse = [1,1,0.9,0.8]
snare_count = 0
volume = 0.7

in_thread do
  for i in verse
    for j in mods

      for k in heights      
        use_synth :dull_bell
        play note: k*j*i, amp: volume, mod_wave: 1, attack: rrand(0.2,0.3), sustain: 0.3
        sleep 0.6
        sample :bd_fat, amp: volume-0.2   
        snare_count = snare_count + 1
        if snare_count % 4 == 0 
          sample :drum_snare_soft, amp: volume   
        end
      end
      sample :drum_tom_lo_soft, amp:volume-0.2
    end 
    volume-0.1
  end
  sample :pacman_dies_y, amp: 0.2
end
