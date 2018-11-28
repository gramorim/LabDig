library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


entity operacoes_campo_fd is
	generic( constant ratio 		: integer := 434;
				constant log2_ratio 	: integer := 9;
				constant filename : string := "campo_inicial.mif");
    port (
        clock, reset: in std_logic;
        partida : in std_logic;                    	-- tx_serial
        we: in std_logic;                          	-- memoria_jogo_16x7
        conta, zera, carrega: in std_logic;        	-- contador_m_load
        endereco: in std_logic_vector(5 downto 0); 	-- contador_m_load
        dado, sel: in std_logic_vector(1 downto 0);   -- mux3x1_n
        fim, fim_linha: out std_logic;             	-- contador_m_load
        saida_serial, pronto : out std_logic;      	-- tx_serial
        db_q: out std_logic_vector(5 downto 0);
        db_dados: out std_logic_vector(6 downto 0);
        verifica: out std_logic_vector(1 downto 0);
		  i_verifica : in std_logic
    );
end operacoes_campo_fd;

architecture operacoes_campo_fd of operacoes_campo_fd is
    signal s_contagem: std_logic_vector(5 downto 0);
    signal s_dados, s_mux, s_entrada: std_logic_vector (6 downto 0);
	 signal s_verifica : std_logic_vector(1 downto 0);

    component tx_serial 
		generic( constant ratio 		: integer;
					constant log2_ratio 	: integer);
		port (
        clock, reset, partida, paridade: in std_logic;
        dados_ascii: in std_logic_vector (6 downto 0);
        saida_serial, pronto : out std_logic
    );
    end component;
    
    component memoria_jogo_64x7 
	generic(constant filename : string);
   PORT (dado_entrada : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
         dado_saida   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
         endereco     : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);         
         we, ce       : IN  STD_LOGIC);
    end component;

    component contador_m_load
    generic (
        constant M: integer;  -- modulo do contador
        constant N: integer   -- numero de bits da saida
    );
    port (
        CLK, zera, conta, carrega: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR (N-1 downto 0);
        Q: out STD_LOGIC_VECTOR (N-1 downto 0);
        fim: out STD_LOGIC );
    end component;
    
    component mux3x1_n
      generic (
           constant BITS: integer := 4);
      port(D2, D1, D0 : in std_logic_vector (BITS-1 downto 0);
           SEL: in std_logic_vector (1 downto 0);
           MX_OUT : out std_logic_vector (BITS-1 downto 0));
    end component;

    component decoder
    port(
        input: in std_logic_vector (6 downto 0);
        output : out std_logic_vector(1 downto 0)
    );
  end component; 
  
	component registrador_n is
	  generic (constant N: integer := 8);
	  port (clock, clear, enable: in STD_LOGIC;
			  D: in STD_LOGIC_VECTOR(N-1 downto 0);
			  Q: out STD_LOGIC_VECTOR (N-1 downto 0));
	end component;

begin

    -- sinais reset e partida mapeados em botoes ativos em alto
    U1: tx_serial 
		generic map(ratio,log2_ratio)
		port map (clock=>clock, reset=>reset, partida=>partida, paridade=>'0',
                            dados_ascii=>s_mux, saida_serial=>saida_serial, pronto=>pronto);
    U2: memoria_jogo_64x7 
		generic map(filename)
		PORT map(s_entrada,
					s_dados,
					s_contagem,        
					we, '1');
	
    U3: contador_m_load generic map (M => 64, N => 6) port map (CLK=>clock, zera=>zera, conta=>conta, carrega=>carrega,
                                                           D=>endereco, q=>s_contagem, fim=>fim);
    -- mux da saida memoria
    U4: mux3x1_n generic map (BITS => 7) port map (D2 => "0001101", D1=> "0001010", D0=>s_dados, 
                                                   SEL=>sel, MX_OUT=>s_mux);

    -- mux da entrada da memoria
    U5: mux3x1_n generic map (BITS => 7) port map (D2 => "1011000", D1=> "1000001", D0=>"1011111", 
                                                   SEL=>dado, MX_OUT=>s_entrada);
                                                                    
    U6: decoder port map (input => s_dados, output => s_verifica);
	 
	 
	REG : registrador_n
	  generic map(2)
	  port map(clock, '0', i_verifica,
			  s_verifica,
			  verifica);

    with s_contagem(2 downto 0) select
        fim_linha <= '1' when "111", '0' when others;

-- depuracao
db_q <= s_contagem;
db_dados <= s_mux;
    
end operacoes_campo_fd;

