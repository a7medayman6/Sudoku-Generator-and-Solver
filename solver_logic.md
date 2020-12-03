1. get the first empty cell in the board
2. if there are none empty cells:	return true; the borad solved succesfully.
3. loop from 1 to 9:
	3.1. for each n check if it is safe to place n in the empty cell.
	3.2. if safe:
		3.2.1. set the value n in the empty cell.
		3.2.2. call the solve method again to recursivly solve the whole board
		3.2.3. if the solve method returned true: return true
		3.2.4. else: set the value of the empty cell to 0 again and continue the loop looking for a more suitable number
4. return false if the loop is done without finding a suitable number (in other words, return true if there is no number will contribute in solving the rest of the board)				