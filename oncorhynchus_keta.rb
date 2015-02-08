def distribute(accents, total_beats, beat_rotations=0)
  res = []

  total_beats.times do |i|
    # makes a boolean based on the index
    # true is an accent, false is a rest
    res << ((i * accents % total_beats) < accents)
  end

  res.ring
end

class SonicPi::Core::RingArray
  def as_x_notation
    self.to_a.map {|x| x ? 'x' : '.'}.join(' ')
  end

  def as_beat_groups
    self.to_a.slice_before {|x| x }.to_a.map(&:count).join
  end
end

use_bpm(120)

def play_sample_for_sequence(pattern, sample_name, sleep_time = 0.25)
  pattern.each.with_index do |beat, i|
    sample sample_name if !!beat
    sleep sleep_time
  end
end


live_loop(:sn) do
  with_fx :level, amp: 0.5 do
    cue :heartbeat
    play_sample_for_sequence(distribute(2, 16).to_a.rotate(4), :perc_snap)
  end
end

live_loop(:sn) do
  with_fx :level, amp: 0.5 do
    cue :heartbeat
    play_sample_for_sequence(distribute(2, 16).to_a.rotate(4), :elec_twip)
  end
end

live_loop(:leadsynth) do
  with_fx :level, amp: 1 do
    with_fx :wobble, amp: 1, mix: 1 do
      use_synth :supersaw
      cue :heartbeat
      distribute(3, 2).each do |beat|
        play scale(:e2, :diatonic).choose, release: 0.25 if beat
        sleep 0.5
      end
    end
  end
end

live_loop(:bass) do
  with_fx :level, amp: 0.5 do
    use_synth :fm
    cue :heartbeat
    distribute(3, 8).each do |beat|
      play scale(:a2, :mixolydian).choose, release: 0.5 if beat
      sleep 0.5
    end
  end
end