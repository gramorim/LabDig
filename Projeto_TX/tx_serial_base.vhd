-- tx_serial_base.vhd
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity tx_serial_base is
	port (clock, reset, partida, paridade  : in  std_logic;
         dados_ascii                      : in  std_logic_vector (6 downto 0);
         saida_serial, pronto             : out std_logic;
			o_paridade, o_clock              : out std_logic;
		   hex1, hex0                       : out std_logic_vector(6 downto 0));
end tx_serial_base;

architecture arch_tx_serial_base of tx_serial_base is
   signal s_zera, s_conta, s_carrega, s_desloca, s_fim: std_logic;
     
   component tx_serial_uc 
	port (clock, reset, partida, fim            : in std_logic;
         zera, conta, carrega, desloca, pronto : out STD_LOGIC);
   end component;

   component tx_serial_fd 
   port (clock, reset                            :  in  std_logic;
         zera, conta, carrega, desloca, paridade :  in  std_logic;
         dados_ascii                             :  in  std_logic_vector (6 downto 0);
         saida_serial, fim, o_paridade           :  out std_logic;
		   hex1, hex0                              :  out std_logic_vector(6 downto 0));
    end component;
      
begin

    -- sinais reset e partida mapeados na GPIO
   U1: tx_serial_uc 
	port map (clock,
             reset, 
				 partida, 
				 s_fim,s_zera, 
				 s_conta, 
				 s_carrega, 
				 s_desloca, 
				 pronto);
   
	U2: tx_serial_fd 
	port map (clock, 
	          reset, 
				 s_zera, 
				 s_conta, 
				 s_carrega, 
				 s_desloca, 
				 paridade, 
				 dados_ascii, 
				 saida_serial, 
				 s_fim, o_paridade,
				 hex1, hex0);
				 
	o_clock <= clock;
	

end arch_tx_serial_base;

