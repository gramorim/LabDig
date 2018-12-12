library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;


entity BatalhaNaval_uc is port ( clock, reset  : in std_logic);
end BatalhaNaval_uc;

architecture BatalhaNaval_uc_arch of BatalhaNaval_uc is
	type State_type is (	);
	

begin
	process (reset, clock)
	begin
		if reset = '1' then
			Sreg <= inicial;
		elsif clock'event and clock = '1' then
			Sreg <= Snext; 
		end if;
	end process;

	-- proximo estado
	process () 
	begin
		case Sreg is
			
		end case;
	end process;

	-- saidas
	
end BatalhaNaval_uc_arch;