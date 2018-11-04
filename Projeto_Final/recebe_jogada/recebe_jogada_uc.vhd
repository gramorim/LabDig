library ieee;
use ieee.std_logic.all;

entity recebe_jogada_uc is
	port(
		tem_dado_recebido:      in std_logic;
		fim_c, clock:           in std_logic;
		reset, enable:          in std_logic;
		recebe_dado:            out std_logic;
		enable_c:			    out std_logic;
		reg_write:              out std_logic;
		pronto:					out std_logic
	);
end entity;

architecture recebe_jogada_uc_arch of recebe_jogada_uc is
    type State_type is (inicial, preparacao, espera, guarda, recebe, fim, conta);
    signal Sreg, Snext: State_type;  -- current state and next state
begin

  -- state memory
  process (reset, clock)
  begin
      if reset = '1' then
          Sreg <= inicial;
      elsif clock'event and clock = '1' then
          Sreg <= Snext; 
      end if;
  end process;

  -- next-state logic
  process (partida, tick, fim, Sreg) 
  begin
    case Sreg is
		when inicial =>     if enable='1' then 
								Snext <= preparacao;
							else 
								Snext <= inicial;
							end if;
		when preparacao =>  Snext <= espera;
		when espera =>      if fim_c = '1' then
								Snext <= fim;
							elsif tem_dado_recebido = '1' then
								Snext <= recebe;
							else Snext <= espera;							
							end if;
		when recebe =>      Snext <= guarda;
		when guarda =>		Snext <= conta;					
		when fim => 		Snext <= inicial;
		when conta =>       Snext <= espera;
		when others =>      Snext <= inicial;
    end case;
  end process;

  -- output logic (based on state only)
  with Sreg select  -- output logic (based on state only)
	recebe_dado <= '1' when recebe, '0' when others;
  with Sreg select
	reg_write <= '1' when guarda, '0' when others;
  with Sreg select
	enable_c <= '1' when conta, '0' when others;
  with Sreg select
	pronto <= '1' when fim, '0' when others;
end architecture;
		