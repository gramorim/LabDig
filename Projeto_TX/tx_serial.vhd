-- tx_serial.vhd
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity tx_serial is
	 generic(constant Ratio_m : integer := 100;
				constant Ratio_n : integer := 7);
    port(clock, reset, partida, paridade                : in  std_logic;
         dados_ascii                                    : in  std_logic_vector (6 downto 0);
         saida_serial, pronto, o_tick, transm_andamento : out std_logic;
			o_estado                                       : out std_logic_vector(3 downto 0));
end tx_serial;

architecture tx_serial of tx_serial is
    signal s_zera, s_conta, s_carrega, s_desloca, s_tick, s_fim: std_logic;
    signal s_partida: std_logic; -- used by edge_detector
     
    component tx_serial_uc 
		  port ( clock, reset, partida, tick, fim                    : in  STD_LOGIC;
					zera, conta, carrega, desloca, pronto, em_andamento : out STD_LOGIC;
					o_estado                                            : out std_logic_vector(3 downto 0));
    end component;

    component tx_serial_fd port (
        clock, reset: in std_logic;
        zera, conta, carrega, desloca, paridade: in std_logic;
        dados_ascii: in std_logic_vector (6 downto 0);
        saida_serial, fim : out std_logic);
    end component;
    
    component contador_m
	generic (
		constant M: integer;  -- modulo do contador
		constant N: integer   -- numero de bits da saida
	);
    port (
        CLK, zera, conta: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR (N-1 downto 0);
        fim: out STD_LOGIC);
    end component;
    
    component edge_detector is port ( 
             clk         : in  STD_LOGIC;
             signal_in   : in  STD_LOGIC;
             output      : out  STD_LOGIC);
    end component;
    
begin

    -- sinais reset e partida mapeados em botoes ativos em alto
    UC: tx_serial_uc port map (clock, reset, s_partida, s_tick, s_fim,
                               s_zera, s_conta, s_carrega, s_desloca, pronto, transm_andamento,
										 o_estado);
    FD: tx_serial_fd port map (clock, reset, s_zera, s_conta, s_carrega, s_desloca, paridade, 
                               dados_ascii, saida_serial, s_fim);
    -- fator de divisao para 115.200 bauds (434=50M/115200)
    U3: contador_m generic map (Ratio_m, Ratio_n) port map (clock, s_zera, '1', open, s_tick);
	 -- fator de divisao para simulacao
    U4: edge_detector port map (clock, partida, s_partida);
    
	 o_tick <= s_tick;
end tx_serial;

