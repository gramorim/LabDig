LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.my_data_types.all;
-------------------------------------------------------------------------------------------------------------
ENTITY generic_demux IS
	GENERIC(	inputs	: INTEGER := 16;                     -- number of inputs
				size 		: INTEGER := 8);                         -- size of each input

	PORT(	input 	: OUT STD_LOGIC_VECTOR (size-1 DOWNTO 0);
			output	: IN  MATRIX (0 TO inputs-1, size-1 DOWNTO 0);
			sel   	: IN  INTEGER RANGE 0 TO inputs-1);
END generic_demux;
------------------------------------------------------------------------------------------------------------- 
ARCHITECTURE behavioral OF generic_demux IS

BEGIN

	
END behavioral;