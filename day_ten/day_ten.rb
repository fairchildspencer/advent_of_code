# setup
instructions = File.read("input.txt").split("\n")

# part one
def check_cycle(interesting_cycles, cycle, x, signal_strength)
  if interesting_cycles.include?(cycle)
    return cycle * x
  end
  return 0
end

interesting_cycles = [20, 60, 100, 140, 180, 220]
signal_strength = 0
cycle = 1
x = 1

instructions.each do | instruction |
  type, val = instruction.split(" ")
  if type == "noop"
    signal_strength += check_cycle(interesting_cycles, cycle, x, signal_strength)
    cycle += 1
  else
    signal_strength += check_cycle(interesting_cycles, cycle, x, signal_strength)
    cycle += 1
    signal_strength += check_cycle(interesting_cycles, cycle, x, signal_strength)
    cycle += 1
    x += val.to_i
  end
end
signal_strength += check_cycle(interesting_cycles, cycle, x, signal_strength)
puts signal_strength

# part two
def handle_cycle(crt, sprite, cycle, interesting_cycles)
  if [(sprite - 1), sprite, (sprite + 1)].include?(crt)
    print "#"
  else
    print "."
  end

  if interesting_cycles.include?(cycle)
    print "\n"
    return 0
  end
  return crt + 1
end

interesting_cycles = [40, 80, 120, 160, 200, 240]
cycle = 1
sprite_pos = 1
crt = 0
instructions.each do | instruction |
  type, val = instruction.split(" ")
  if type == "noop"
    crt = handle_cycle(crt, sprite_pos, cycle, interesting_cycles)
    cycle += 1
  else
    crt = handle_cycle(crt, sprite_pos, cycle, interesting_cycles)
    cycle += 1
    crt = handle_cycle(crt, sprite_pos, cycle, interesting_cycles)
    cycle += 1
    sprite_pos += val.to_i
  end
end