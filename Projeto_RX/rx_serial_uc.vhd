library IEEE;
use IEEE.std_logic_1164.all;

entity rx_serial_uc is 
  port ( clock, reset, tick, fim, partida                      : in STD_LOGIC;
         zerar, contar, carregar, deslocar, pronto, o_registra : out STD_LOGIC;
			Estado : out std_logic_vector(3 downto 0));
end;

architecture rx_serial_uc of rx_serial_uc is
    type State_type is (inicial, preparacao, espera, recepcao, final, registra);
    signal Sreg, Snext: State_type;  -- current state and next state
begin

  -- state memory
  process (RESET, CLOCK)
  begin
      if RESET = '1' then
          Sreg <= inicial;
      elsif CLOCK'event and CLOCK = '1' then
          Sreg <= Snext; 
      end if;
  end process;

  -- next-state logic
	process (tick, fim, partida, Sreg) 
	begin
	 case Sreg is
		when inicial =>    if tick='1' then Snext <= preparacao;
								 else             Snext <= inicial;
								 end if;
										 
		when preparacao => Snext <= espera;
		
		when espera =>     if tick='1' then   Snext <= recepcao;
								 elsif fim='0' then Snext <= espera;
								 else               Snext <= final;
								 end if;
										 
		when recepcao =>   if fim = '0' then Snext <= espera;
								 else              Snext <= registra;
								 end if;
										 
		when registra =>   Snext <= final;
										 
		when final =>      if partida = '0' then Snext <= Final;
								 else                  Snext <= Inicial;
								 end if;
										 
		when others =>     Snext <= inicial;
	 end case;
	end process;
	
  
  
	-- output logic (based on state only)
	with Sreg select  -- output logic (based on state only)
      carregar <= '1' when preparacao, '0' when others;
		
	with Sreg select
      zerar <= '1' when preparacao, '0' when others;
		
	with Sreg select
      deslocar <= '1' when recepcao, '0' when others;
		
	with Sreg select
      contar <= '1' when recepcao, '0' when others;
	with Sreg select
		o_registra <= '1' when registra, '0' when others;
		
	with Sreg select
      pronto <= '1' when final, '0' when others;
		
	with Sreg select
		estado <= "0000" when inicial,
					 "0001" when preparacao,
					 "0010" when espera,
					 "0011" when recepcao,
					 "0100" when registra,
					 "0101" when final,
					 "1110" when others;
end rx_serial_uc;
