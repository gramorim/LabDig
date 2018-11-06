LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.my_data_types.all;
-------------------------------------------------------------------------------------------------------------
ENTITY generic_mux IS
	GENERIC(	inputs	: INTEGER := 16;                     -- number of inputs
				size 		: INTEGER := 8);                         -- size of each input

	PORT(	input  	: IN  MATRIX (0 TO inputs-1, size-1 DOWNTO 0);
			sel    	: IN  INTEGER RANGE 0 TO inputs-1;
			output	: OUT STD_LOGIC_VECTOR (size-1 DOWNTO 0));
	 
END generic_mux;
------------------------------------------------------------------------------------------------------------- 
ARCHITECTURE behavioral OF generic_mux IS
BEGIN
  gen: FOR i IN size-1 DOWNTO 0 GENERATE
			output(i) <= input(sel, i);
  END GENERATE gen; 
END behavioral;