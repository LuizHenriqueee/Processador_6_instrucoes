library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity unidade_de_controle is 
	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			RF_Rp_zero: in STD_LOGIC;
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC;
			D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
			RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
			D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC);
end;

architecture UC of unidade_de_controle is

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

--Instanciação do contador de programa.
component programCounter is
    Port ( clk : in STD_LOGIC;
           PC_Id : in STD_LOGIC;
           PC_clr : in STD_LOGIC;
           PC_inc : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           PC : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--Instanciação do Registrador de instruções.
component InstructionRegister is
    Port ( clk : in STD_LOGIC;
           IR_Id : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Instanciação do somador.
component somador is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			b: in STD_LOGIC_VECTOR(7 downto 0);
			s: out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal s_PC, s_IR, ss : STD_LOGIC_VECTOR(15 downto 0);
signal sPC_Id, sPC_clr, sPC_inc, sIR_id: STD_LOGIC;
begin
	--Mapeamento do bloco de controle.
 U0: bloco_controle port map (clk => clk,
							  reset => reset,
							  IR => s_IR,
							  RF_Rp_zero => RF_Rp_zero,
							  D_rd => D_rd,
							  D_wr => D_wr,
							  RF_s1 => RF_s1,
							  RF_s0 => RF_s0,
							  D_addr => D_addr,
							  RF_W_data => RF_W_data, 
							  PC_id => sPC_Id, 
							  PC_clr => sPC_clr, 
							  PC_inc => sPC_inc, 
							  I_rd => I_rd, 
							  IR_id => sIR_id, 
							  RF_W_wr => RF_W_wr, 
							  RF_Rp_rd => RF_Rp_rd, 
							  RF_Rq_rd => RF_Rq_rd, 
							  alu_s1 => alu_s1, 
							  alu_s0 => alu_s0, 
							  RF_W_addr => RF_W_addr, 
							  RF_Rp_addr => RF_Rp_addr, 
							  RF_Rq_addr => RF_Rq_addr);
 --Mapeamento do contador de programa.
 U1: programCounter port map (	clk => clk,
							    PC_Id => sPC_Id,
							    PC_clr => sPC_clr,
							    PC_inc => sPC_inc,
							    PC_in => ss,
							    PC => s_PC);
 --Mapeamento do Registrador de Instruções
 U2: InstructionRegister port map(clk => clk,
								  IR_Id => sIR_id,
							      data_in => data,
							      data_out => s_IR);
 --Mapeamento do somador.
 U3: somador port map(a => s_PC,
					  b => s_IR(7 DOWNTO 0),
					  s => ss);
					  
PC <= s_PC;

end; 
