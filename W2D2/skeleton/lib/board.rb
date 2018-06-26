class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones

    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |idx|
      @cups[idx] = [:stone, :stone, :stone, :stone] if idx != 6 && idx != 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13) === start_pos
    raise "Starting cup is empty" if @cups[start_pos].empty?

    true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos] if valid_move?(start_pos)
    @cups[start_pos] = []

    until stones.empty?
      start_pos += 1
      start_pos %= 14

      next if (current_player_name == name1 && start_pos == 13) || (current_player_name == name2 && start_pos == 6)
      @cups[start_pos] << stones.shift
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13

    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6] == @cups[13]

    return name1 if @cups.length > @cups[13].length
    name2
  end

  private
  attr_reader :name1, :name2
end
