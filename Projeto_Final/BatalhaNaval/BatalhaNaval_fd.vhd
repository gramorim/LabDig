library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;


entity BatalhaNaval_fd is
	generic( constant ratio 		: integer := 7;
				constant log2_ratio 	: integer := 3);
	port(	clock, reset : in std_logic;
			entrada_serial : in std_logic;
			
			enableRecJog, enableEnvMen, enableRecMen, enableOpCam : in std_logic;
			i_mensagem : in std_logic_vector(2 downto 0);
			
			end1, end0 : out std_logic_vector(6 DOWNTO 0);
			menRec : out std_logic_vector(6 downto 0);
			saida_serial : out std_logic;
			
			prontoRecJog, prontoEnvMen, prontoRecMen, prontoOpCam : out std_logic;
			db_mensagem : out std_logic_vector(2 downto 0));
end BatalhaNaval_fd;

architecture batalha_naval_fd_arc of BatalhaNaval_fd is 

	component mensagem
		generic( constant ratio 		: integer := 7;
					constant log2_ratio 	: integer := 3;
					constant tam_ascii : integer := 7);
		PORT(	clock, reset 			: in  std_logic;
				i_mensagem 				: in  std_logic_vector( 2 downto 0);
				jogada					: in  std_logic_vector(2*tam_ascii-1 downto 0);
				enviar					: in  std_logic;
				saida_serial, pronto : out std_logic;
				
				--Depuração
				db_estado 	: out std_logic_vector(3 downto 0);
				db_tick, db_enable, db_Q		: out std_logic;
				db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0);
			db_mensagem : out std_logic_vector(2 downto 0));
	end component;
	
	component recebe_jogada_UART is
		generic(	constant N_ascii  : integer := 2;     -- Numero de characteres desejados
					constant log2_N	: integer := 2;
					constant Ratio	: integer := 434;
					constant log2_Ratio : integer := 9;
					constant tam_ascii : integer := 8);
		port(
			clock, reset, enable:     in std_logic;
			entrada_serial:   		  in std_logic;
			erro:             		  out std_logic;
			pronto:					  out std_logic;
			endereco:					  out std_logic_vector(5 downto 0);
			jogada:         out std_logic_vector (2*tam_ascii-1 downto 0)
		);
	end component;
	
	component decodificador_endereco is
		generic(constant tam_ascii : integer := 7);
		port(	ascii		: in  std_logic_vector(tam_ascii-1 downto 0);
				endereco	: out std_logic_vector(2 downto 0);
				erro		: out std_logic);
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

	signal s_jogada : std_logic_vector(13 downto 0);
begin

	MEN : mensagem
		generic map(ratio,log2_ratio,7)
		PORT map(clock, reset,
					i_mensagem,
					s_jogada,
					enableEnvMen,
					saida_serial, prontoEnvMen,
					
					--Depuração
					open,
					open, open, open,
					open, open, open,
					db_mensagem);
	
	RecJog : recebe_jogada_UART
			generic map(2,2,Ratio,log2_Ratio,7)
			port map(
				clock, reset, enableRecJog,
				entrada_serial,
				open,
				prontoRecJog,
				open,
				s_jogada
		);
		
	end1 <= s_jogada(13 downto 7);
		
	end0 <= s_jogada(6 downto 0);

	RecMen : rx_serial
		 generic map(ratio,log2_ratio,7)
		 port map(clock, reset,
				 entrada_serial, enableRecMen, '0',
				 open, open, open, open, open,
				 prontoRecMen, open, open,
				 open, open,
				 open,
				 open,
				 menRec);
	
end batalha_naval_fd_arc;