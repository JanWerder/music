#oncorhynchus_tractus
sample :custom_rocketstart
wait = 0.75
wait1 = 0.25
pitch = 2.3

volume = 0
stretch =2

for i in 0..132
  in_thread do
    if i > 43 and i < 102
      if i == 43
        volume = 0
      end
      with_fx :nlpf, amp: 0.2  do
        with_fx :ixi_techno, amp: 0.2 do
          with_fx :distortion, mix: 0.5, amp: 0.2 do
            with_fx :reverb do |rev|
              control rev, mix: rrand(0, 0.6)
              r = rrand(0.1, 0.2)
              with_synth :fm  do
                use_synth_defaults release: r, cutoff: rrand(120, 130), amp: 0.7, attack: 2, sustain: 0.5
                sleep 0.5
                play chord(:e, :minor).choose
                sleep 0.5
                play chord(:c, :major).choose
              end
            end
          end
        end
      end
    end
  end

  in_thread do
    if i > 4 and i < 43 or i > 84 and i < 116
      if volume < 0.5
        volume = volume + 0.15
      end
      use_synth :mod_sine
      use_synth_defaults attack: 0.75+stretch, sustain: 0.5+stretch, decay: 0.25+stretch,attack_level: 2, sustain_level: rrand(0.3,0.5), amp: volume
      play :a2
      play :d2
      sleep wait+stretch*3
      play :b1
      play :d2
      play :a3
      sleep wait+stretch*3
      play :a2
      play :E3
      play :e3
      sleep wait+stretch*3
      play :g2
      play :e2
      play :b3
      sleep wait+stretch*3
      play :a2
      play :e2
      play :a3
      sleep (wait+stretch)*2
    end
  end

  in_thread do
    sample :drum_heavy_kick, rate: 0.75
    sleep 0.5
    sample :drum_snare_soft, rate: 0.75
    sleep 0.5
  end

  in_thread do
    if i == 32 or ((i - 32)%12 == 0 and i > 32)
      with_fx :distortion do
        with_fx :ixi_techno, mix: rrand(0.5,1), phase: 2, cutoff_max: rrand(60,80) do
          sample :custom_apollo, amp: 0.5
          sleep 11
        end
      end
    end
  end
  sleep 1
end