library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bloco_controle is -- entradas e saídas do bloco de controle
	port(    	clk, reset: in STD_LOGIC;
				IR: in STD_LOGIC_VECTOR(15 downto 0);
				RF_Rp_zero: in STD_LOGIC;
				D_rd, D_wr, RF_s1, RF_s0: out STD_LOGIC;
				D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
				PC_id, PC_clr, PC_inc, I_rd, IR_id: out STD_LOGIC;
				RF_W_wr, RF_Rp_rd, RF_Rq_rd: out STD_LOGIC;
				alu_s1, alu_s0: out STD_LOGIC;
				RF_W_addr, RF_Rp_addr, 
				RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0));
end bloco_controle;

architecture synth of bloco_controle is -- declaração da variavel estados e sinais internos
	
	type statetype is (inicio, busca, decodifica, carrega, armazena, soma,
	constante, subtrair, saltar_se, verifica, saltar);
	signal state, nextstate: statetype;
	signal op, r, ra, rb, rc:STD_LOGIC_VECTOR(3 downto 0);
	signal d, c, o: STD_LOGIC_VECTOR(7 downto 0);
	

begin
	-- sinais que serão utilizados pela maquina de estados para transferir os dados esperados para cada saída de controle 
	-- op deve comandar a qual operação a ser realizada pelo bloco operacional
	-- r, ra, rb, rc são registradores utilizados para carregar os valores nas operações de soma, subtração entre outras
	-- d, o e c são posições de memória.
    op <= IR(15 downto 12);
	r <= IR(11 downto 8);
	ra <= IR(11 downto 8);
	rb <= IR(7 downto 4);
	rc <= IR(3 downto 0);
	d <= IR(7 downto 0);
	c <= IR(7 downto 0);
	o <= IR(7 downto 0);

process (clk) begin -- registrador de estados que promove a mudança de estado sincrona ao sinal de clk, respeitando o reset que retorna a máquina para estado "inicio"
		if clk'event and clk = '1' then
			if reset = '1' then state <= inicio;
			else state <= nextstate;
			end if;
		end if;
	end process;
	
	process (state, op) begin -- logica de mudança de estados
		case state is
			when inicio => nextstate <= busca;
			when busca => nextstate <= decodifica;
			when decodifica => case op is -- novo case determina qual operação comparando op com os valores binários de 0 a 5, correspondentes a 6 intruções
						when "0000" => nextstate <= carrega;
						when "0001" => nextstate <= armazena;
						when "0010" => nextstate <= soma;
						when "0011" => nextstate <= constante;
						when "0100" => nextstate <= subtrair;
						when "0101" => nextstate <= saltar_se;
						when others => nextstate <= inicio; -- caso não esperado
					   end case;
		
			when saltar_se => nextstate <= verifica;
			
			when verifica =>
			case RF_Rp_zero is --identificando se a flag0 está ativa para que o estado saltar seja lido ou não
						when '1' => nextstate <= saltar;
						when '0' => nextstate <= busca;
						when others => nextstate <= inicio; -- caso não esperado
					  end case;
	
			when carrega => nextstate <= busca;
			when armazena => nextstate <= busca;
			when soma => nextstate <= busca;
			when constante => nextstate <= busca;
			when subtrair => nextstate <= busca;
			when saltar => nextstate <= busca;
			when others => nextstate <= inicio; -- caso não esperado
		end case;
	
	end process;
	
	process (state) begin --atualizaçãoo das saídas para cada estado
	-- reset de todas as saídas para manipular apenas as desejadas
			PC_clr <= '0'; PC_id <= '0'; PC_inc <= '0';
			I_rd <= '0';IR_id <= '0';
			D_addr <= "00000000"; D_rd <= '0'; D_wr <= '0';
			RF_Rp_addr <= "0000"; RF_Rp_rd <= '0'; RF_Rq_addr <= "0000"; RF_Rq_rd <= '0';
			RF_W_addr <= "0000"; RF_W_data <= "00000000"; RF_W_wr <= '0'; RF_s0 <= '0';
			RF_s1 <= '0'; alu_s0 <= '0'; alu_s1 <= '0';
	
	case state is -- case de definição, onde a partir do estado as variaveis de controle são alteradas para comandar a operação dada pela intrução atual.
			when inicio => PC_clr <= '1';
			when busca => I_rd <= '1';
				PC_inc <= '1';
				IR_id <= '1';
			when carrega => D_addr <= d;
				D_rd <= '1';
				RF_s1 <= '0';
				RF_s0 <= '1';
				RF_W_addr <= ra;
				RF_W_wr <='1';
			when armazena => D_addr <= d;
				RF_Rp_addr <= ra;
				RF_Rp_rd <='1';
				D_wr <= '1';
				RF_s1 <= 'X';
				RF_s0 <= 'X';				
			when soma => RF_Rp_addr <= rb;
				RF_Rq_addr <= rb;
				RF_Rp_rd <= '1';
				RF_Rq_addr <= rc;
				RF_Rq_rd <= '1';
				RF_W_addr <= ra;							
				RF_s1 <= '0';
				RF_s0 <= '0';
				alu_s0 <= '1';
				alu_s1 <= '0';
				RF_W_wr <='1';				
			when constante => RF_s1 <= '1';
				RF_s0 <= '0';
				RF_W_addr <= ra;
				RF_W_data <= c;
				RF_W_wr <= '1';
			when subtrair => RF_Rp_addr <= rb;
				RF_Rq_addr <= rb;
				RF_Rp_rd <= '1';
				RF_s1 <= '0';
				RF_s0 <= '0';
				RF_Rq_addr <= rc;
				RF_Rq_rd <= '1';
				RF_W_addr <= ra;
				RF_W_wr <='1';
				alu_s0 <= '0';
				alu_s1 <= '1';
			when saltar_se => 
			    RF_Rp_addr <= ra;
				RF_Rp_rd <= '1';
			when saltar => 
			    PC_id <= '1';
			when others => null;
end case;
end process;
end;
