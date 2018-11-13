LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.my_data_types.all;
-------------------------------------------------------------------------------------------------------------
ENTITY generic_mux IS
	GENERIC(	inputs	: INTEGER := 16;
				log2_inputs: INTEGER := 4);                     -- number of inputs

	PORT(	input  	: IN  STD_LOGIC_VECTOR (inputs-1 downto 0);
			sel    	: IN  STD_LOGIC_VECTOR (log2_inputs-1 downto 0);
			output	: OUT STD_LOGIC);
	 
END generic_mux;
------------------------------------------------------------------------------------------------------------- 
ARCHITECTURE behavioral OF generic_mux IS
signal unsigned_sel: unsigned;
BEGIN
		unsigned_sel <= unsigned(sel);
		output <= input(to_integer(unsigned_sel)); 
END behavioral;