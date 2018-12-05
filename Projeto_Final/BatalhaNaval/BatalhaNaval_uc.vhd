library IEEE;
use IEEE.std_logic_1164.all;

entity BatalhaNaval_uc is port ( 
	clock, reset, vez, jogar	: in std_logic;
	vitoria_adversario, erro	: in std_logic; 
	prontoC, prontoJ, pronto	: in std_logic;
	ganhei						: in std_logic;
	operacoes					: out std_logic_vector(2 downto 0);
	hex_estado					: out std_logic_vector(6 downto 0);
	troca_vez 					: out std_logic;
	enviar_adv 					: out std_logic
	 );
end BatalhaNaval_uc;

architecture BatalhaNaval_uc_arch of BatalhaNaval_uc is
	type State_type is (inicial, envia, espera, incrementa, final, selecionaCR, enviaCR, esperaCR, selecionaNL, enviaNL, esperaNL,
						carrega_endereco, escreve_memoria, verifica_memoria);
	signal Sreg, Snext: State_type;

-- constantes
constant IMPRIME :	std_logic_vector(1 downto 0) := "00";
constant ESCREVE :	std_logic_vector(1 downto 0) := "01";
constant VERIFICA:	std_logic_vector(1 downto 0) := "10";

begin
	process (reset, clock)
	begin
		if reset = '1' then
			Sreg <= inicial;
		elsif clock'event and clock = '1' then
			Sreg <= Snext; 
		end if;
	end process;

	-- proximo estado
	process (iniciar, operacao, pronto, fim, fim_linha, Sreg) 
	begin
		case Sreg is
			-- Estados iniciais
			when inicia => 				if jogar='1' then Snext <= prepara;
												else Snext <= inicia;
												end if;
			when prepara =>				if vez='1' then Snext <= espera_jogada;
												else Snext <= espera_resposta;
												end if;
			-- Estados do jogador										
			when espera_jogada =>		if prontoC='1' then Snext <= envia_jogada;
												else Snext <= espera_jogada;
												end if;
			when envia_jogada => 		Snext <= espera_confirmacao;
			when espera_confirmacao => if prontoJ='1' then Snext <= verifica_resposta;
												else Snext <= espera_confirmacao;
												end if;
			when verifica_resposta =>	if ganhei='1' then Snext <= venceu;
												else Snext <= espera_jogada_adv;
												end if;
												
			-- Estados do adversário									
			when espera_jogada_adv => 	if prontoJ='1' then Snext <= atualiza_mapa;
												else Snext <= espera_jogada_adv;
												end if;
			when atualiza_mapa => 		Snext <= envia_resposta;
			when envia_resultado => 	Snext <= espera_pronto;
			when espera_pronto => 		if prontoJ='1' then 
													if vitoria_adversario='1' then Snext <= comunica_derrota;
													else Snext <= comunica_vez;
													end if;
												else Snext <= espera_pronto;
												end if;
			when comunica_vez =>  		Snext <= espera_jogada; 
			when comunica_vitoria => 	Snext <= perdeu;
			
			-- Estados finais
			when venceu => 				Snext <= inicia;
			when perdeu => 				Snext <= inicia;
		end case;
	end process;

	-- saidas
	with Sreg select
		zera <= '1' when inicial, '0' when others;
	with Sreg select
		reseta <= '1' when inicial, '0' when others;
	
end BatalhaNaval_uc_arch;