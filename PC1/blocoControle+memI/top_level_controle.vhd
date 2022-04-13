library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_controle is
  Port (clk, reset: in STD_LOGIC;
	    RF_Rp_zero: in STD_LOGIC;
	    D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
	    RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
	    D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC); 
end top_level_controle;

architecture Behavioral of top_level_controle is

	-- Unidade de controle completa excluindo a memória I.
    component unidade_de_controle is -- top-level design for testing
	port(	clk, reset: in STD_LOGIC;
			data: in STD_LOGIC_VECTOR(15 downto 0);
			RF_Rp_zero: in STD_LOGIC;
			PC: out STD_LOGIC_VECTOR(15 downto 0);
			I_rd: out STD_LOGIC;
			D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
			RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
			D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC);
    end component;
    
    --Memória de Instrução.
    component memoryI is
    Port ( addr : in STD_LOGIC_VECTOR (15 downto 0);
           rd : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal s_data_I, s_PC: std_logic_vector(15 downto 0);
    signal s_I_rd: std_logic;
begin
	-- Mapeamento da unidade de controle.
    unit_control:unidade_de_controle port map
        (	clk => clk, 
            reset => reset,
			data => s_data_I,
			RF_Rp_zero => RF_Rp_zero,
			PC => s_PC,
			I_rd => s_I_rd,
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
    
	-- Mapeamento da memória I.
    memoria_I: memoryI port map 
         ( addr => s_PC,
           rd => s_I_rd,
           data => s_data_I);
          

end Behavioral;
