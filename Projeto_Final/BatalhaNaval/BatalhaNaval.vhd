library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;

entity BatalhaNaval is
	generic(	constant ratio 		: integer := 434; --Baud rate
				constant log2_ratio 	: integer := 9;
				constant tam_ascii 	: integer := 7;   -- tamanho do ascii 7 ou 8
				constant paridade 	: std_logic := '0'; -- paridade 0 par, 1 impar
				constant end_bit 		: integer := 2);  -- tamanho end bit 1 ou 2
	port(	clock, reset, jogar, vez														: in  std_logic;
			entrada_serial_terminal, entrada_serial_adversario 					: in  std_logic;
			saida_serial_terminal, saida_serial_adversario							: out std_logic;
			jogada_1, jogada_0, resultado, placar_jogador, placar_adversario 	: out std_logic_vector(tam_ascii-1 downto 0);
			fazer_jogada, pronto, ganhei													: out std_logic);
end BatalhaNaval;

architecture batalha_naval_arc of BatalhaNaval is 

	component recebe_jogada_UART is
	generic(	constant N_ascii  : integer;     -- Numero de characteres desejados
				constant log2_N	: integer;
				constant Ratio	: integer;
				constant log2_Ratio : integer;
				constant tam_ascii 	: integer);
		port(
			clock, reset, enable:     in std_logic;
			entrada_serial:   		  in std_logic;
			erro:             		  out std_logic;
			pronto:					  out std_logic;
			endereco:					  out std_logic_vector(5 downto 0);
			jogada:         out std_logic_vector (2*tam_ascii-1 downto 0)
	);
	end component;
	
	component operacoes_campo is
		
	generic( constant ratio 		: integer := 434;
				constant log2_ratio 	: integer := 9;
				constant tam_ascii : integer := 7;
				constant filename : string := "campo_inicial.mif");
    port(clock, reset, iniciar	: in  std_logic;
			operacao, dado         	: in  std_logic_vector(1 downto 0);
			endereco                : in  std_logic_vector(5 downto 0);
			editavel 					: in std_logic;
			saida_serial, pronto    : out std_logic;
			o_dado						: out std_logic_vector(1 downto 0);									
			
			-- depuracao
			db_saida_serial                           : out std_logic;
			db_reseta, db_partida, db_zera, db_conta	: out std_logic;
			db_carrega, db_pronto, db_we, db_fim  		: out std_logic;
			db_q                                      : out std_logic_vector(5 downto 0);
			db_sel                                    : out std_logic_vector(1 downto 0);
			db_dados                                  : out std_logic_vector(tam_ascii-1 downto 0));
	end component;
	
	component decodificadorjogada is
		port(	vez, passa_vez, venceu 	: in  std_logic;
				resultado_jogada 			: in  std_logic_vector(1 downto 0);
				mensagem 					: out std_logic_vector(2 downto 0));
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
	
	component decoder is
		generic(constant tam_ascii : integer := 7);
		 port(   input  : in  std_logic_vector(tam_ascii-1 downto 0);
					output : out std_logic_vector(1 downto 0);
					ganhei : out std_logic);
	end component;
	
	component mensagem is
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer;
					constant tam_ascii 	: integer);
		PORT(	clock, reset 			: in  std_logic;
				i_mensagem 				: in  std_logic_vector(2 downto 0);
				jogada					: in  std_logic_vector(2*tam_ascii-1 downto 0);
				enviar					: in  std_logic;
				saida_serial, pronto : out std_logic;
				
				--Depuração
				db_estado 	: out std_logic_vector(3 downto 0);
				db_tick, db_enable, db_Q		: out std_logic;
				db_ascii_dec, db_ascii_jogada, db_ascii : out std_logic_vector(tam_ascii-1 downto 0));
	end component;
	
	signal s_entrada_serial, s_vez, s_enable_recjog, s_erro_recjog, s_pronto_recjog	: std_logic;
	signal s_enable_jogador, s_saida_serial_jogador, s_pronto_jogador, s_passa_vez 	: std_logic;
	signal s_venceu, s_enable_RecMen, s_pronto_men, s_erro_recmem1, s_erro_recmem 	: std_logic;
	signal s_enable_adversario, s_saida_serial_adversario, s_pronto_adversario			: std_logic;
	signal s_enable_envia_mensagem_adversario, s_pronto_envia_mensagem_adversario		: std_logic;
	signal s_serial_envia_mensagem_adversario 													: std_logic;
	
	signal s_jogada									: std_logic_vector(2*tam_ascii-1 downto 0);
	signal s_MenRec			 						: std_logic_vector(tam_ascii-1 downto 0);
	signal s_endereco_rec		 					: std_logic_vector( 5 downto 0);
	signal s_mensagem									: std_logic_vector( 2 downto 0);
	signal s_operacao_jogador, s_dado_jogador : std_logic_vector( 1 downto 0);
	signal s_dado_rec, s_operacao_adversario 	: std_logic_vector( 1 downto 0);
begin

	with s_vez select
		s_entrada_serial <= 	entrada_serial_terminal 	when '0',
									entrada_serial_adversario 	when '1';
						
	RecebeJ : recebe_jogada_UART
		generic map(2,2,ratio,log2_ratio,tam_ascii)
		port map(clock, reset, s_enable_recjog,
					s_entrada_serial,
					s_erro_recjog,
					s_pronto_recjog,
					s_endereco_rec,
					s_jogada);
			
	JOGADOR : operacoes_campo
		generic map(ratio,log2_ratio,tam_ascii, "campo_inicial_jogador.mif")
		port map(clock, reset, s_enable_jogador,
					s_operacao_jogador, "00",
					s_endereco_rec,
					'0',
					s_saida_serial_jogador, s_pronto_jogador,
					s_dado_jogador,
					
					-- depuracao
					open,
					open, open, open, open,
					open, open, open, open,
					open,
					open,
					open);
	
	DecJogadaJogador : decodificadorjogada
		port map(s_vez, s_passa_vez, s_venceu,
					s_dado_jogador,
					s_mensagem);
					
	RecMensage : rx_serial
		generic map(Ratio,log2_Ratio,tam_ascii)
		port map(clock, reset,
					s_entrada_serial, s_enable_RecMen, '0',
					open, open, open, open, open,
					s_pronto_men, s_erro_recmem1, open,
					open, open,
					open,
					open,
					s_MenRec);
					
	s_erro_recmem <= s_erro_recmem1;
	
	MenDec : decoder
		generic map(tam_ascii)
		port map(s_MenRec, s_dado_rec, ganhei);
		
	ADVERSARIO : operacoes_campo
		generic map(ratio,log2_ratio,tam_ascii,"campo_inicial_adversario.mif")
		port map(clock, reset, s_enable_adversario,
					s_operacao_adversario, s_dado_rec,
					s_endereco_rec,
					'1',
					s_saida_serial_adversario, s_pronto_adversario,
					open,									
					
					-- depuracao
					open,
					open, open, open, open,
					open, open, open, open,
					open,
					open,
					open);
	
	mensagem_adversario : mensagem
		generic map(ratio,log2_ratio,tam_ascii)
		port map(clock, reset,
					s_mensagem,
					s_jogada,
					s_enable_envia_mensagem_adversario,
					s_serial_envia_mensagem_adversario , s_pronto_envia_mensagem_adversario,
					
					--Depuração
					open,
					open, open, open,
					open, open, open);
					
end batalha_naval_arc;