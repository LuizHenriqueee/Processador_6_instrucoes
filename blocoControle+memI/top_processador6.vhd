library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity top_processador6 is
	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC);
end;
			
			
architecture top of top_processador6 is

component unidade_de_controle is 
	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			RF_Rp_zero: in STD_LOGIC;
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC;
			D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
			RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
			D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC);
end component;

component  top_level_operacional is
  Port (D_addr : in STD_LOGIC_VECTOR (7 downto 0);
        D_rd : in STD_LOGIC;
        D_wr : in STD_LOGIC;
        clk: in STD_LOGIC;
        RF_W_data : in STD_LOGIC_VECTOR (7 downto 0);
        RF_s1 : in STD_LOGIC;
        RF_s0 : in STD_LOGIC;
        RF_W_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_W_wr : in STD_LOGIC;
        RF_Rp_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_Rp_rd : in STD_LOGIC;
        RF_Rq_addr : in STD_LOGIC_VECTOR (3 downto 0);
        RF_Rq_rd : in STD_LOGIC;
        alu_s1 : in STD_LOGIC;
        alu_s0 : in STD_LOGIC;
        RF_Rp_zero : out STD_LOGIC);
end component;

  signal D_addr :  STD_LOGIC_VECTOR (7 downto 0);
  signal D_rd :  STD_LOGIC;
  signal D_wr :  STD_LOGIC;
  signal RF_W_data :  STD_LOGIC_VECTOR (7 downto 0);
  signal RF_s1 :  STD_LOGIC;
  signal RF_s0 :  STD_LOGIC;
  signal RF_W_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_W_wr :  STD_LOGIC;
  signal RF_Rp_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_Rp_rd :  STD_LOGIC;
  signal RF_Rq_addr :  STD_LOGIC_VECTOR (3 downto 0);
  signal RF_Rq_rd :  STD_LOGIC;
  signal alu_s1 :  STD_LOGIC;
  signal alu_s0 :  STD_LOGIC;
  signal RF_Rp_zero :  STD_LOGIC;
  
begin
 U0: unidade_de_controle port map (clk => clk,
							  reset => reset,
							  data => data,
							  RF_Rp_zero => RF_Rp_zero,
							  PC =>PC, 
							  I_rd => I_rd,
							  D_addr => D_addr,
							  RF_W_data => RF_W_data, 
							  RF_W_addr => RF_W_addr, 
							  RF_Rp_addr => RF_Rp_addr,
							  RF_Rq_addr => RF_Rq_addr, 
							  D_rd => D_rd,
							  D_wr => D_wr,
							  RF_s1 => RF_s1,
							  RF_s0 => RF_s0,  
							  RF_W_wr => RF_W_wr, 
							  RF_Rp_rd => RF_Rp_rd, 
							  RF_Rq_rd => RF_Rq_rd, 
							  alu_s1 => alu_s1, 
							  alu_s0 => alu_s0);
							  
 U1: top_level_operacional port map (	D_addr => D_addr,
										D_rd => D_rd,
										D_wr => D_wr,
										clk => clk,
										RF_W_data => RF_W_data,
										RF_s1 => RF_s1,
										RF_s0 => RF_s0,
										RF_W_addr => RF_W_addr,
										RF_W_wr => RF_W_wr,
										RF_Rp_addr => RF_Rp_addr,
										RF_Rp_rd => RF_Rp_rd,
										RF_Rq_addr => RF_Rq_addr,
										RF_Rq_rd => RF_Rq_rd,
										alu_s1 => alu_s1,
										alu_s0 => alu_s0,
										RF_Rp_zero => RF_Rp_zero);

end; 