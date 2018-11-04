
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity print_uc is
	port(clock, send, reset, fim, pronto, trams            : in  std_logic;
		  o_pronto, carrega, conta, zera, we, ce, transmite : out std_logic;
		  o_estado                                          : out std_logic_vector(3 downto 0);
		  char_fim, o_mem                                   : in std_logic_vector(6 downto 0)
		  );
end print_uc;

architecture print_uc_arc of print_uc is
	type ESTADO is (Inicio, Prepara, IniciaT, EsperaP, Soma1, FimE);
	--type ESTADO is (Inicio, Prepara, IniciaT, EsperaP, Soma1, FimE, EsperaBotao, TestaChar);
	signal Sreg, Snext : ESTADO;

begin
	process(clock, reset)
	begin
		if    reset = '1'                 then Sreg <= Inicio;
		elsif clock'event and clock = '1' then Sreg <= Snext;
		end if;
	end process;
	
	process(send, fim, pronto, trams)
	begin
		case Sreg is
			when Inicio  => if send = '0' then Snext <= Inicio;
								 else 				  Snext <= Prepara;
								 --else               Snext <= EsperaBotao;
								 end if;
			--when EsperaBotao => if send = '0' then Snext <= Prepara;
			--					 else               Snext <= EsperaBotao;
			--					 end if;					 
			
			when Prepara => Snext <= IniciaT;
			
			when IniciaT => if trams = '0' then Snext <= IniciaT;
								 else					   Snext <= EsperaP;
								 end if;
			
			when EsperaP => if    pronto = '0' then Snext <= EsperaP;
								 elsif fim    = '0' then Snext <= Soma1;
								 else							 Snext <= FimE;
								 end if;
			--when TestaChar => if    char_fim = o_mem then Snext <= FimE;
			--					 elsif fim    = '0' then Snext <= Soma1;
			--					 else							 Snext <= FimE;
			--					 end if;
								 
			when Soma1   => Snext <= IniciaT;
			
			when FimE    => Snext <= Inicio;
		end case;
	end process;
	
	with Sreg select o_pronto  <= '1' when FimE           , '0' when others;
	
	with Sreg select conta     <= '1' when Soma1          , '0' when others;
	
	with Sreg select zera      <= '1' when Inicio|prepara , '0' when others;
	
	with Sreg select transmite <= '1' when IniciaT        , '0' when others;
	
	carrega <= '0';
	we      <= '0';
	ce      <= '0';
	
	with Sreg select o_estado <= "0000" when Inicio,
										  "0001" when Prepara,
										  "0010" when IniciaT,
										  "0011" when EsperaP,
										  "0100" when Soma1,
										  "0101" when FimE;
	
end print_uc_arc;