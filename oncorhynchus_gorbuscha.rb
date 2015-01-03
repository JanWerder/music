#Oncorhynchus gorbuscha
use_bpm 40
heights = [43,34,37,36,35,36,38,42]

live_loop :drums do
  #stop :drums
  sample :bd_haus, rate: 0.75, amp: 0.5
  sleep 0.5
end


live_loop :bg_synth do
  #stop :bg_synth
  use_synth :mod_pulse
  use_synth_defaults attack: 0.2, mod_pulse_with: 0.5, env_curve: 2, sustain: 0.1, decay: 0.1, cutoff: 40
  sync :drums
  play :e2
  sleep 0.5
  play :d1
  sleep 0.5
  play :e3
end

live_loop :main_synth do
  #stop :main_synth
  use_synth :pretty_bell
  use_synth_defaults attack: 0.2, mod_pulse_with: 0.5, env_curve: 2, sustain: 0.1, decay: 0.1, cutoff: rrand(60,80)
  sync :bg_synth
  sleep 0.25
  play :a2
  sleep 0.5
  play :a1
  sleep 0.5
  play :a3
  sleep 0.5
  play :e3
  sleep 0.5
  play :b2
  sleep 0.5
  play :b1
  sleep 0.5
  play :b3
  sleep 0.5
  play :f3, sustain: 0.3
end