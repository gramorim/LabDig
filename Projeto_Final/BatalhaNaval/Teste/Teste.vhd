library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity Teste is
	generic( constant ratio 		: integer := 7;
				constant log2_ratio 	: integer := 3);
	port(	clock, reset, inicia, envia	: in std_logic;
			jogada : in std_logic_vector(13 downto 0);
			i_mensagem : in std_logic_vector(2 downto 0);
			
			HEX5_Jogada                 : out std_logic_vector (6 downto 0);
			HEX4_Jogada                 : out std_logic_vector (6 downto 0);
			HEX3_Resultado              : out std_logic_vector (6 downto 0);
			
			ascii_impresso : out std_logic_vector(6 downto 0);
			
			o_estado : out std_logic_vector(3 downto 0);
			o_serial_entrada, o_serial_saida : out std_logic;
			o_prontoRecMen : out std_logic;
			db_ascii_entrada : out std_logic_vector(6 downto 0);
			o_mensagem : out std_logic_vector(2 downto 0);
			db_mensagem : out std_logic_vector(2 downto 0);
			o_end1, o_end0 : out std_logic_vector(6 downto 0));
end Teste;

architecture Teste_arc of Teste is

	

	component BatalhaNaval is
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer);
		port (clock, reset 	: in std_logic;
				entrada_serial : in std_logic;
				saida_serial 	: out std_logic;
			
				inicia : in std_logic;
				HEX5_Jogada                 : out std_logic_vector (6 downto 0);
				HEX4_Jogada                 : out std_logic_vector (6 downto 0);
				HEX3_Resultado              : out std_logic_vector (6 downto 0);
				
				o_estado : out std_logic_vector(3 downto 0);
			o_prontoRecMen : out std_logic;
			o_mensagem : out std_logic_vector(2 downto 0);
			db_mensagem : out std_logic_vector(2 downto 0);
			o_end1, o_end0 : out std_logic_vector(6 downto 0));
	end component;
	
	component rx_serial is
		 generic(constant Ratio_m : integer;
					constant Ratio_n : integer;
					constant tam_ascii : integer);
		 port (clock, reset                                 : in  std_logic;
				 entrada_serial, recebe_dado, paridade        : in  std_logic;
				 hex1, hex0, hex_est, hex_cont, hex_ticker    : out std_logic_vector(6 downto 0);
				 tem_dado_recebido, paridade_ok, o_tick       : out std_logic;
				 o_serial, O_FIM                              : out std_logic;
				 o_estado                                     : out std_logic_vector(3 downto 0);
				 o_dados                                      : out std_logic_vector(tam_ascii+2 downto 0);
				 o_dado_recebido                              : out std_logic_vector(tam_ascii-1 downto 0));
	end component;
	
	component mensagem is
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer;
					constant tam_ascii 	: integer);
		PORT(	clock, reset 			: in  std_logic;
				i_mensagem 				: in  std_logic_vector( 2 downto 0);
				jogada					: in  std_logic_vector(2*tam_ascii-1 downto 0);
				enviar					: in  std_logic;
				saida_serial, pronto : out std_logic;
				
				--Depuração
				db_estado 	: out std_logic_vector(3 downto 0);
				db_tick, db_enable, db_Q		: out std_logic;
				db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0));
	end component;


	signal s_entrada_serial, s_saida_serial : std_logic;
begin

	MEN : mensagem
		generic map(ratio,log2_ratio,7)
		PORT map(clock, reset,
					i_mensagem,
					jogada,
					envia,
					s_entrada_serial, open,
				
				--Depuração
				open,
				open, open, open,
				open, open, db_ascii_entrada);
				
	BatNav : BatalhaNaval
		generic map(ratio,log2_ratio)
		port map(clock, not reset,
					s_entrada_serial,
					s_saida_serial,
				
					not inicia,
					HEX5_Jogada,
					HEX4_Jogada,
					HEX3_Resultado,
					
					o_estado,
					o_prontoRecMen,
					o_mensagem,
					db_mensagem,
					o_end1, o_end0);
					
	RX : rx_serial
		 generic map(ratio,log2_ratio,7)
		 port map(clock, reset,
					 s_saida_serial, '1', '0',
					 open, open, open, open, open,
					 open, open, open,
					 open, open,
					 open,
					 open,
					 ascii_impresso);
					 
	o_serial_entrada 	<= s_entrada_serial;
	o_serial_saida	 	<= s_saida_serial;
end Teste_arc;