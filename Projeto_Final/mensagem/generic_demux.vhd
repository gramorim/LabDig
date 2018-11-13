LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.my_data_types.all;
-------------------------------------------------------------------------------------------------------------
ENTITY generic_demux IS
	GENERIC(	outputs	: INTEGER := 16;                     -- number of inputs
				log2_outputs 		: INTEGER := 4);                         -- size of each input

	PORT(	input 	: IN STD_LOGIC;
			sel    	: IN  STD_LOGIC_VECTOR (log2_outputs-1 downto 0);
			output	: OUT  STD_LOGIC_VECTOR (outputs-1 downto 0)
		 );
END generic_demux;
------------------------------------------------------------------------------------------------------------- 
ARCHITECTURE behavioral OF generic_demux IS
signal unsigned_sel: unsigned;
BEGIN
		unsigned_sel <= unsigned(sel);
		output(unsigned_sel) <= input; 
END behavioral;