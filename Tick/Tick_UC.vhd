
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Tick_UC is
	port(CLK, serial, fim, Reset : in  std_logic;
		  enable, o_reset         : out std_logic;
		  estado                  : out std_logic_vector(3 downto 0));
End Entity;

Architecture Tick_UC_arc of Tick_UC is
	type State_type is (Inicio, Gera);
	Signal Sreg, Snext: State_type;

Begin
	process(CLK, Reset)
	begin
		if Reset = '1'                then Sreg <= Inicio;
		elsif CLK'event and CLK = '1' then Sreg <= Snext;
		end if;
	end process;
	
	process(Serial, Fim)
	begin
		case Sreg is
			when Inicio => if serial = '0' then Snext <= Gera;
							   else                 Snext <= Inicio;
								end if;
				
			when Gera   => if fim = '0' then Snext <= Gera;
			               else              Snext <= inicio;
								end if;
			
			when others => Snext <= Inicio;
		end case;
	end process;
	
	with Sreg select enable  <= '1' when Gera, '0' when others;
	
	with Sreg select o_reset <= '1' when Inicio, '0' when others;
	
	with Sreg select estado  <= "0000" when Inicio,
										 "0001" when Gera,
										 "1110" when others;
end Tick_UC_arc;