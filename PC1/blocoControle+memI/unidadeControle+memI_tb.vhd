library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity topUnidadeControle_tb is
end topUnidadeControle_tb;

architecture Behavioral of topUnidadeControle_tb is

component top_level_controle is
  Port (clk, reset: in STD_LOGIC;
	    RF_Rp_zero: in STD_LOGIC;
	    D_addr, RF_W_data: out STD_LOGIC_VECTOR(7 downto 0);
	    RF_W_addr, RF_Rp_addr, RF_Rq_addr: out STD_LOGIC_VECTOR(3 downto 0);
	    D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 : out STD_LOGIC); 
end component;

    signal clk, reset:  STD_LOGIC;
    signal RF_Rp_zero:  STD_LOGIC;
    signal D_addr, RF_W_data:  STD_LOGIC_VECTOR(7 downto 0);
    signal RF_W_addr, RF_Rp_addr, RF_Rq_addr:  STD_LOGIC_VECTOR(3 downto 0);
    signal D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0 :  STD_LOGIC; 


begin

    control_unit: top_level_controle port map (
        clk, reset,
	    RF_Rp_zero,
	    D_addr, RF_W_data,
	    RF_W_addr, RF_Rp_addr, RF_Rq_addr,
	    D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0
    );
    
    
    -- test bench apenas para o estímulo do clock.
    clk_stim: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    



end Behavioral;
