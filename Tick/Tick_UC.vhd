
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

Entity Tick_UC is
	port(Fim_h, Fim_t, Total, serial, Reset, CLK: in  std_logic;
		  tick, Enable_c, Reset_c, Reset_r       : out std_logic);
End Entity;

Architecture Tick_UC_arc of Tick_UC is
	type State_type is (Espera, conta_h, ativa, saida, conta_t);
	Signal Sreg, Snext: State_type;

Begin
	process(CLK, Reset)
	begin
		if Reset = '1'                      then Sreg <= Espera;
		elsif CLK'event and CLK = '1' then Sreg <= Snext;
		end if;
	end process;
	
	process(Fim_h, Fim_t, total, serial)
	begin
		case Sreg is
			when Espera   => if serial = '0' then Snext <= conta_h;
								  else                 Snext <= Espera;
								  end if;
				
			when conta_h  => if Fim_h = '1' then Snext <= ativa;
								  else                Snext <= conta_h;
								  end if;
								  
			when ativa    => Snext <= saida;
			
			when saida    => if Total = '1' then Snext <= Espera;
								  else                Snext <= conta_t;
								  end if;
								  
			when conta_t  => if Fim_t = '1' then Snext <= ativa;
			                 else                Snext <= conta_t;
								  end if;
		end case;
	end process;
	
	with Sreg select tick <= '1' when ativa, '0' when others;
	
	with Sreg select enable_c <= '1' when conta_h|conta_t|ativa, '0' when others;
	
	with Sreg select reset_c <= '1' when ativa|Espera, '0' when others;
	
	with Sreg select reset_r <= '1' when Espera, '0' when others;
end Tick_UC_arc;