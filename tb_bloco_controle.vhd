library IEEE; use IEEE.STD_LOGIC_1164.all;
entity tb_bloco_controle is -- no inputs or outputs
end;
architecture sim of tb_bloco_controle is

 component bloco_controle is -- entradas e saídas do bloco de controle
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
end component;

 signal IR: STD_LOGIC_VECTOR(15 downto 0);
 signal clk, reset, flag0, alu_s1, alu_s0: STD_LOGIC:='0';

begin
 -- instantiate device under test
 du: bloco_controle port map(	clk=>clk,
				reset=>reset,
				RF_Rp_zero=>flag0,
				IR=>IR,
				alu_s1=>alu_s1, 
				alu_s0=>alu_s0);
clk <= not clk after 10 ns;
 reset <='0', '1' after 30 ns, '0'after 40 ns;
 IR <="0100110001000011";
end;
