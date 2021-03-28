class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    n = @board.length - 1

    # check each row

    @board.each do |row|
      if row.uniq.length == 1 && row.uniq[0] != " "
        return row.uniq[0]
      end
    end

   # check each column

   (0..n).each do |column|
    (1..n).each do |space|
      if @board[space][column] == @board[space - 1][column] && @board[space][column] != " "
        next if space != n
        return @board[space][column]
      else
        break
      end
    end
  end

  # check diagonals
  
  (1..n).each do |diag|
    if @board[diag][diag] == @board[diag - 1][diag - 1] && @board[diag][diag] != " "
      next if diag != n
      return @board[diag][diag]
    else
      break
    end
  end
  
  (1..n).each do |diag|
    if @board[n - diag][diag] == @board[n - diag + 1][diag - 1] && @board[n - diag][diag] != " "
      next if diag != n
      return @board[n - diag][diag]
    else
      break
    end
  end

  # check for empty spaces 

  @board.each do |row|
    if row.include? " "
      return "unfinished"
    end
  end

  return "draw"

  end 
end
